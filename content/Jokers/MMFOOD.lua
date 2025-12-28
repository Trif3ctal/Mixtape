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
        if context.modify_shop_card and not context.blueprint then
            if context.card and not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' and context.card.config.center.pools and context.card.config.center.pools.Food then
                context.card.temp_edition = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.card.temp_edition = nil
                        context.card:set_edition('e_negative', true)
                        context.card.ability.couponed = true
                        context.card:set_cost()
                        context.card:add_sticker('perishable', true)
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
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