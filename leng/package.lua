
require('30log');
local fs = love.filesystem;
local package = {};

package.load = function(dir)
    local starter = dir..'/starter';
    local dropletDir = dir..'/droplets';
    local leng, set_up = require('leng'), require(starter);
    local droplets = fs.getDirectoryItems(dropletDir);
    for i = 1, #droplets do
        local name = dropletDir..'/'..droplets[i]:gsub('%.lua', '');
        local ran, result = pcall(require, name);
        assert(ran, 'package handler failed to initialize '..name);
    end;
    local ran, result = pcall(set_up, leng);
end;

return package;