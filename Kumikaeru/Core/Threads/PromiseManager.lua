
local ManagerClass = class('PromiseManager', {
    Promises = {};
});
local Instance = ManagerClass();
local ThreadAPI = love.thread;
local Thread = love.thread.newThread([[
    local thread = love.thread;
    local fulfill, reject, addChain = thread:getChannel('fulfill'), thread:getChannel('reject'), thread:getChannel('addChain');

    while true do

    end;
]]);

ManagerClass.Hook = function(self, Promise)
    
end;

ManagerClass.Fulfill = function(self, Promise)

end;

ManagerClass.Reject = function(self, Promise)

end;

ManagerClass.Update = function(self)
    local Fulfill, Reject, AddChain = ThreadAPI:getChannel('fulfill'), ThreadAPI:getChannel('reject'), ThreadAPI:getChannel('addChain');
    
end;

ManagerClass.init = function() end;
ManagerClass.new = function()
    error('Cannot instantiate');
end;
ManagerClass.extend = function()
    error('Cannot extend');
end;
ManagerClass.getInstance = function(self)
    return Instance;
end;

return ManagerClass;