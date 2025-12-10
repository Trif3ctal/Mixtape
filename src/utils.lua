--#region States
BalatroGoesGold.STATES = {
    add_sound_playing = false
}
--#endregion

--#region Sound on add
BalatroGoesGold.calculate = function(self, context)
    if context.card_added and context.card.config.center.bgg_addsound and BalatroGoesGold.config.add_sounds and not BalatroGoesGold.STATES.add_sound_playing then
        BalatroGoesGold.STATES.add_sound_playing = true
        local sound = context.card.config.center.bgg_addsound
        if type(sound) == 'table' then
            sound = pseudorandom_element(sound)
        end
        local og_volume = G.SETTINGS.SOUND.music_volume
        G.E_MANAGER:add_event(Event({
            delay = 0.4,
            trigger = 'after',
            func = function()
                G.SETTINGS.SOUND.music_volume = G.SETTINGS.SOUND.music_volume * 0.25
                context.card:juice_up()
                play_sound(sound)
                return true;
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 12,
            trigger = 'after',
            func = function()
                if G.SETTINGS.SOUND.music_volume >= og_volume then
                    BalatroGoesGold.STATES.add_sound_playing = false
                    G.SETTINGS.SOUND.music_volume = og_volume
                    G:save_settings()
                    return true
                else
                    G.SETTINGS.SOUND.music_volume = G.SETTINGS.SOUND.music_volume + 1
                    return false
                end
            end
        }))
    end
end
--#endregion

--#region Sound on collection click
local cc = Card.click
function Card:click()
    cc(self)
    if self.area and self.area.config.collection and self.config.center.bgg_addsound and BalatroGoesGold.config.add_sounds and not BalatroGoesGold.STATES.add_sound_playing then
        BalatroGoesGold.STATES.add_sound_playing = true
        local sound = self.config.center.bgg_addsound
        if type(sound) == 'table' then
            sound = pseudorandom_element(sound)
        end
        local og_volume = G.SETTINGS.SOUND.music_volume
        G.E_MANAGER:add_event(Event({
            func = function()
                G.SETTINGS.SOUND.music_volume = G.SETTINGS.SOUND.music_volume * 0.25
                self:juice_up()
                play_sound(sound)
                return true;
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 12,
            trigger = 'after',
            func = function()
                if G.SETTINGS.SOUND.music_volume >= og_volume then
                    BalatroGoesGold.STATES.add_sound_playing = false
                    G.SETTINGS.SOUND.music_volume = og_volume
                    G:save_settings()
                    return true
                else
                    G.SETTINGS.SOUND.music_volume = G.SETTINGS.SOUND.music_volume + 1
                    return false
                end
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
