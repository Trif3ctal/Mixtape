--#region Sound on add
BalatroGoesGold.calculate = function(self, context)
    if context.card_added and context.card.config.center.bgg_addsound and BalatroGoesGold.config.add_sounds then
        G.E_MANAGER:add_event(Event({
            delay = 0.25,
            trigger = 'after',
            func = function()
                context.card:juice_up()
                play_sound(context.card.config.center.bgg_addsound)
                return true;
            end
        }))
    end
end

--#endregion