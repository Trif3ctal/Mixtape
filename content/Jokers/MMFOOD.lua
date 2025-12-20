SMODS.Joker {
    key = 'MMFOOD',
    atlas = 'Jokers',
    pos = {
        x = 1,
        y = 1
    },
    rarity = 2,
    config = {
        extra = {
        }
    },
    jmix_addsound = 'jmix_MMFOOD',
    jmix_year = 2004,
    jmix_genres = { 'hiphop', },
    blueprint_compat = true,
    pools = {
        Album = true
    },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        return {
            vars = {}
        }
    end,
    calculate = function(self, card, context)
        local stg = card.ability.extra
        if (context.starting_shop or context.reroll_shop) and G.shop_jokers and not context.blueprint then
            for i = 1, #G.shop_jokers.cards do
                local joker = G.shop_jokers.cards[i]
                if joker and not joker.edition and not joker.temp_edition and joker.ability.set == 'Joker' and joker.config.center.pools and joker.config.center.pools.Food then
                    joker.temp_edition = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            joker.temp_edition = nil
                            joker:set_edition('e_negative', true)
                            joker.ability.couponed = true
                            joker:set_cost()
                            joker:add_sticker('perishable', true)
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
            end
        end
    end
}

SMODS.Sound {
    key = "MMFOOD",
    path = "addsounds/MMFOOD.ogg"
}

if not SMODS.ObjectTypes['Food'] then
    SMODS.ObjectType({
        key = 'Food',
        default = 'j_joker',
        cards = {
            j_gros_michel = true,
            j_ice_cream = true,
            j_cavendish = true,
            j_turtle_bean = true,
            j_diet_cola = true,
            j_popcorn = true,
            j_ramen = true,
            j_selzer = true,
            j_egg = true,
        }
    })
end