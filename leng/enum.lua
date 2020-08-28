
--[[
    enum:set('blockType', 'line', 'red');
]]

local enum = class('enum');
local internal = {c = 0;};

enum.valid = function(self, i)
    return not (type(self[i]) == 'function');
end;

enum.increase = function(self)
	local res = internal.c + 1;
	internal.c = res;
	return res;
end;

--enum.set uses a local reference so that it can be recalled faster inside the function than enum.setAlt, but analyzing speed differences says the speed is 0, so can't be helped
enum.set = function(self, ...)
	local paths = {...}; local t = #paths;
	local enumBackTo = self;
	for i = 1, t do
		local c_name, p_name = paths[i], paths[i - 1];
		if (p_name ~= nil) then
			local backTo = enumBackTo[p_name];
			if (backTo == nil) then
				backTo = {}; enumBackTo[p_name] = backTo;
			end;
			enumBackTo = backTo;
		end;
		if ((i >= t) and self:valid(c_name) == true) then
			enumBackTo[c_name] = self:increase();
		end;
    end;
end;

--enum.setAlt uses a slightly different filling technique for groups, this one is more line conservative.
enum.setAlt = function(self, ...)
	local paths = {...}; local t = #paths;
	local enumBackTo = self;
	for i = 1, t do
		local c_name, p_name = paths[i], paths[i - 1];
		if (p_name ~= nil) then
			local backTo = enumBackTo[p_name];
			enumBackTo[p_name] = backTo or {};
			enumBackTo = enumBackTo[p_name];
		end;
		if ((i >= t) and self:valid(c_name) == true) then
			enumBackTo[c_name] = self:increase();
		end;
    end;
end;

return enum;