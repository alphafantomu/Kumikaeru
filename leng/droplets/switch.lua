
switch = class('switch');

switch.valid = function(self, name)
    return not (type(self[name]):lower() == 'function');
end;

switch.init = function(self, ...)
    local list = {...};
    for i = 1, #list do
        local name, trigger = unpack(list[i]);
        if (self:valid(name) == true) then
            self[name] = trigger;
        end;
    end;
end;