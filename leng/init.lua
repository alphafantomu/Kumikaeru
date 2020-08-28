
--[[
    Engine Handler

    We need to adjust droplets and have proper requirements etc

]]
require('30log');
require('leng/droplets/switch');
require('leng/droplets/root');
require('leng/droplets/object');
require('leng/droplets/dataType');
require('leng/droplets/vector');
require('leng/droplets/color');

require('leng/droplets/ui');
require('leng/droplets/physics');

return setmetatable({}, {__index = function(self, index) 
    return require('leng/'..tostring(index));
end});