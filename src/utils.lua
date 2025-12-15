--#region States
BalatroGoesGold.STATES = {
    add_sound_playing = false
}
--#endregion


--#region Sound stuff
--Sound event queue
G.E_MANAGER.queues.bgg_sounds = {}

-- Sound on add
BalatroGoesGold.calculate = function(self, context)
    if context.card_added and context.card.config.center.bgg_addsound then
        BalatroGoesGold.play_album_sound(context.card, 0.4)
    end
end

--Sound on collection click
local cc = Card.click
function Card:click()
    cc(self)
    if self.area and self.area.config.collection and self.config.center.bgg_addsound and self.config.center.unlocked and self.config.center.discovered then
        BalatroGoesGold.play_album_sound(self)
    end
end

BalatroGoesGold.play_album_sound = function(card, delay)
    if BalatroGoesGold.config.add_sounds then
        if not BalatroGoesGold.STATES.add_sound_playing then
            BalatroGoesGold.STATES.add_sound_playing = true
        else
            G.E_MANAGER:clear_queue('bgg_sounds')
        end

        local sound = card.config.center.bgg_addsound
        if type(sound) == 'table' then
            sound = pseudorandom_element(sound)
        end

        if not BalatroGoesGold.ORIGINAL_MUSIC_VOLUME then
            BalatroGoesGold.ORIGINAL_MUSIC_VOLUME = G.SETTINGS.SOUND.music_volume
        end

        G.E_MANAGER:add_event(Event({
            delay = delay,
            trigger = 'after',
            func = function()
                G.SETTINGS.SOUND.music_volume = BalatroGoesGold.ORIGINAL_MUSIC_VOLUME * 0.25
                card:juice_up()
                play_sound(sound)
                return true;
            end
        }), "bgg_sounds")
        G.E_MANAGER:add_event(Event({
            delay = 3 * G.SPEEDFACTOR,
            trigger = 'after',
            func = function()
                if G.SETTINGS.SOUND.music_volume >= BalatroGoesGold.ORIGINAL_MUSIC_VOLUME then
                    BalatroGoesGold.STATES.add_sound_playing = false
                    G.SETTINGS.SOUND.music_volume = BalatroGoesGold.ORIGINAL_MUSIC_VOLUME
                    BalatroGoesGold.ORIGINAL_MUSIC_VOLUME = nil
                    G:save_settings()
                    return true
                else
                    G.SETTINGS.SOUND.music_volume = G.SETTINGS.SOUND.music_volume + 1
                    return false
                end
            end
        }), "bgg_sounds")
    end
end
--#endregion

--#region Album ObjectType
SMODS.ObjectType {
    key = 'Album',
    default = 'j_bgg_RAM',
}
--#endregion

--#region Fancy UI Generation (Derived from Potato Patch Utils, don't kill me Eremel)
BalatroGoesGold.generate_genres_footer = function(genres, prefix)
    local amount = #genres
    local genre_string = {
        n = G.UIT.R,
        config = { align = 'tm' },
        nodes = {
            { n = G.UIT.R, config = { align = 'cm' }, nodes = { { n = G.UIT.T, config = { text = localize(prefix .. '_genres'), shadow = true, colour = G.C.UI.BACKGROUND_WHITE, scale = 0.27 } } } }
        }
    }

    for i, genre in ipairs(genres) do
        local target_row = math.ceil(i / 3)
        if target_row > #genre_string.nodes then
            table.insert(genre_string.nodes,
                { n = G.UIT.R, config = { align = 'cm' }, nodes = {} })
        end
        table.insert(genre_string.nodes[target_row].nodes, {
            n = G.UIT.O,
            config = {
                object = DynaText({
                    string = localize(prefix .. '_' .. genre),
                    colours = { G.C.UI.BACKGROUND_WHITE },
                    scale = 0.27,
                    silent = true,
                    shadow = true,
                    y_offset = -0.6,
                })
            }
        })
        if i < amount then
            table.insert(genre_string.nodes[target_row].nodes,
                { n = G.UIT.T, config = { text = localize(prefix .. '_comma_spacer'), shadow = true, colour = G.C.UI.BACKGROUND_WHITE, scale = 0.27 } })
        end
    end

    return genre_string
end

BalatroGoesGold.generate_year_footer = function(year, prefix)
    local year_string = {
        n = G.UIT.R,
        config = { align = 'tm' },
        nodes = {
            { n = G.UIT.R, config = { align = 'cm' }, nodes = { { n = G.UIT.T, config = { text = localize(prefix .. '_year'), shadow = true, colour = G.C.UI.BACKGROUND_WHITE, scale = 0.27 } } } }
        }
    }
    table.insert(year_string.nodes[1].nodes, {
        n = G.UIT.O,
        config = {
            object = DynaText({
                string = tostring(year),
                colours = { G.C.UI.BACKGROUND_WHITE },
                scale = 0.27,
                silent = true,
                shadow = true,
                y_offset = -0.6,
            })
        }
    })

    return year_string
end

local chp = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    local ret_val = chp(card)
    local obj = card.config.center
    if obj and obj.bgg_year then
        table.insert(ret_val.nodes[1].nodes[1].nodes[1].nodes, BalatroGoesGold.generate_year_footer(obj.bgg_year, 'bgg'))
    end
    if obj and obj.bgg_genres then
        table.insert(ret_val.nodes[1].nodes[1].nodes[1].nodes, BalatroGoesGold.generate_genres_footer(obj.bgg_genres, 'bgg'))
    end
    return ret_val
end

--#endregion
