BalatroGoesGold = SMODS.current_mod

--#region File Loading
local nativefs = NFS

local path_len = string.len(SMODS.current_mod.path) + 1

local function load_file_native(path)
    if not path or path == "" then
        error("No path was provided to load.")
    end
    local file_path = path
    local file_content, err = NFS.read(file_path)
    if not file_content then
        return nil,
            "Error reading file '" .. path .. "' for mod with ID '" .. SMODS.current_mod.id .. "': " .. err
    end
    local short_path = string.sub(path, path_len, path:len())
    local chunk, err = load(file_content, "=[SMODS " .. SMODS.current_mod.id .. ' "' .. short_path .. '"]')
    if not chunk then
        return nil,
            "Error processing file '" .. path .. "' for mod with ID '" .. SMODS.current_mod.id .. "': " .. err
    end
    return chunk
end
local blacklist = {
    assets = true,
    lovely = true,
    [".github"] = true,
    [".git"] = true,
    ["localization"] = true,
    ["joker template.lua"] = true
}
local function load_files(path, dirs_only)
    local info = nativefs.getDirectoryItemsInfo(path)
    table.sort(info, function(a, b)
        return a.name < b.name
    end)
    for _, v in ipairs(info) do
        if v.type == "directory" and not blacklist[v.name] then
            load_files(path .. "/" .. v.name)
        elseif not dirs_only then
            if string.find(v.name, ".lua") and not blacklist[v.name] then -- no X.lua.txt files or whatever unless they are also lua files
                local f, err = load_file_native(path .. "/" .. v.name)
                if f then
                    f()
                else
                    error("error in file " .. v.name .. ": " .. err)
                end
            end
        end
    end
end
local path = SMODS.current_mod.path
load_files(path, true)
--#endregion

--#region Assets
SMODS.Atlas { -- Main Jokers Atlas
    key = 'Jokers',
    path = 'musicjokerssheet.png',
    px = 71,
    py = 95
}

SMODS.Font {
  key = "emoji",
  path = "712_serif.ttf"
}
--#endregion