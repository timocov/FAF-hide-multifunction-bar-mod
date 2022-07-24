-- see https://github.com/FAForever/fa/blob/7542596ea1c16be28615fdc40cc9bf9c8bb5481a/lua/ui/game/multifunction.lua#L1074-L1088
-- see https://github.com/FAForever/fa/blob/7542596ea1c16be28615fdc40cc9bf9c8bb5481a/lua/ui/game/multifunction.lua#L1030-L1056
local originalInitialAnimation = InitialAnimation
function InitialAnimation()
    -- call the original function first (to avoid conflicts with new versions)
    originalInitialAnimation()

    local newLeft = savedParent.Left() - controls.bg.Width() - 10

    -- reset everything known that was set by the original function
    controls.bg.OnFrame = function(self, elapsedTime)
    end
    controls.bg:SetNeedsFrameUpdate(false)
    controls.bg:Hide()
    controls.bg.Left:Set(newLeft)

    controls.collapseArrow:SetCheck(true, true)
end
