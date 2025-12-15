SMODS.Joker {
    key = 'BlueAlbum',
    atlas = 'Jokers',
    pos = {
        x = 9,
        y = 0
    },
    rarity = 1,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_BlueAlbum',
    bgg_year = 1994,
    bgg_genres = { 'rock', 'pop' },
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra
    end
}

SMODS.Sound {
    key = 'BlueAlbum',
    path = 'addsounds/Blue Album.ogg'
}
