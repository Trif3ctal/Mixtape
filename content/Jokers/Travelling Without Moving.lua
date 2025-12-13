SMODS.Joker {
    key = 'TravellingWithoutMoving',
    atlas = 'Jokers',
    pos = {
        x = 0,
        y = 4
    },
    rarity = 3,
    config = {
        extra = {
        }
    },
    bgg_addsound = 'bgg_TravellingWithoutMoving',
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

        if context.buying_card and not context.card ~= card and context.card.from_area == G.shop_jokers then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local new_card = create_card_for_shop(G.shop_jokers)
                    G.shop_jokers:emplace(new_card)
                    return true;
                end
            }))
            return {
                message = localize('k_bgg_rearrange_ex'),
                sound = 'bgg_rearrange'
            }
        end
    end
}

SMODS.Sound {
    key = 'TravellingWithoutMoving',
    path = 'addsounds/TravellingWithoutMoving.ogg'
}

SMODS.Sound {
    key = 'rearrange',
    path = 'rearrange.ogg'
}
