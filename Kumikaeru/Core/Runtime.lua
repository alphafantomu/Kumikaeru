
local RuntimeClass = class('Runtime', {
    Threads = {};
    ProcessQueue = {};
});
local Instance = RuntimeClass();

RuntimeClass.Promise = function(self, resolve, reject)
    local Promise = require('Kumikaeru/Core/Components/Promise.lua');
    return Promise(resolve, reject);
end;

RuntimeClass.Thread = function(self, process)
    local Thread = require('Kumikaeru/Core/Components/Thread.lua');
    return Thread(process);

    --Threads will need to go into process queue to stop, resume, and pause threads
end;

RuntimeClass.Event = function(self, process)
    local Event = require('Kumikaeru/Core/Components/Event.lua');
    return Event(process);

    --Events will need to go into queue to fire the process function
end;

RuntimeClass.Update = function(self)
    local queue = self.processQueue;
    for i = 1, math.floor(table.maxn(queue)) do
        local miniprocesses = queue[i];
        local incomplete = miniprocesses ~= nil;
        if (incomplete == true) then
            assert(queue[tonumber(i..'.1')], 'Finished process exists');
            for e = 1, #miniprocesses do
                local request = miniprocesses[e];
                local id = request.id;
                
            end;
            queue[i] = nil;
            queue[tonumber(i..'.1')] = miniprocesses;
        elseif (incomplete == false) then --Finished
            assert(not queue[tonumber(i..'.1')], 'Process cannot be found');
            queue[tonumber(i..'.1')] = nil;
        end;
    end;
end;

love.update = function(dts)
    Instance:update();
    local PromiseManager = Kumikaeru.Core.Threads.PromiseManager;
    
end;

RuntimeClass.init = function() end;
RuntimeClass.new = function()
    error('Cannot instantiate');
end;
RuntimeClass.extend = function()
    error('Cannot extend');
end;
RuntimeClass.getInstance = function(self)
    return Instance;
end;

return RuntimeClass;