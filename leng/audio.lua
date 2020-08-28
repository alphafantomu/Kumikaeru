
--[[
    Audio is several hundred times more complicated, we need to do this later
]]

local laudio = love.audio;
local audio = class('audio');

audio.getRecorders = function(self)
    return laudio.getRecordingDevices();
end;

return audio;