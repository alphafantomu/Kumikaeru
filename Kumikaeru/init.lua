
require('Kumikaeru/Assets/Dependencies/30log');
local env = getfenv();
oldRequire = require;
require = function(...)
    local f = {loadfile(...)};
    local ran, res = pcall(assert, unpack(f));
    assert(ran, res..'\n'..debug.traceback());
    return setfenv(unpack(f), env)();
end;

local LocalSpace = {
    Assets = {
        Dependencies = {
            class = class;
        }
    };
    Core = {
        Threads = {
            PromiseManager = require('Kumikaeru/Core/Threads/PromiseManager.lua');
        };
        Runtime = require('Kumikaeru/Core/Runtime.lua');
    };
};

Kumikaeru = LocalSpace;

return LocalSpace;