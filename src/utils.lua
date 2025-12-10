--#region Sound on add
BalatroGoesGold.calculate = function(self, context)
    if context.card_added and context.card.config.center.bgg_addsound and BalatroGoesGold.config.add_sounds then
        local sound = context.card.config.center.bgg_addsound
        if type(sound) == 'table' then
            sound = pseudorandom_element(sound)
        end
        G.E_MANAGER:add_event(Event({
            delay = 0.4,
            trigger = 'after',
            func = function()
                context.card:juice_up()
                play_sound(sound)
                return true;
            end
        }))
    end
end
--#endregion

--#region Album ObjectType
SMODS.ObjectType {
    key = 'Album',
    default = 'j_bgg_RAM',
}
--#endregion
