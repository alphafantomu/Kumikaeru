
local attackRequests = {
    hyperionGM = 5; --Requests sent to server from client
};

for i, v in pairs(attackRequests) do
    v = v - 3;
end;

table.foreach(attackRequests, print);

local currentTime = 0;
local margin = 5;
local maxRequests = 50;

local decrementRequests = function(deltaTime)
    local rate = 1;
    currentTime = currentTime + deltaTime;
    if (attackRequests ~= nil) then
        for i, v in pairs(attackRequests) do
            if (currentTime >= 1) then
                currentTime = currentTime - rate;
                v = v - margin;
                if (v <= 0) then
                    v = 0;
                end;
                if (v > maxRequests) then
                    print('Too many requests');
                else
                    print('Works');
                end;
            end;
        end;
    end;
end;