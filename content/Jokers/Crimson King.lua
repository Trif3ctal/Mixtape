SMODS.Joker {
    key = 'CrimsonKing',
    atlas = 'Jokers',
    pos = {
        x = 0,
        y = 3
    },
    rarity = 2,
    config = {
        extra = {
        }
    },
    -- bgg_addsound = 'bgg_templatestring',
    bgg_year = 1969,
    bgg_genres = { 'rock', },
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local stg = card.ability.extra
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra
        if context.skip_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tags = { 'tag_uncommon', 'tag_rare', 'tag_negative', 'tag_foil', 'tag_holo', 'tag_polychrome' }
                    add_tag(Tag(pseudorandom_element(tags), 'bgg_crimson'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    card:juice_up()
                    return true
                end
            }))
        end
    end
}
