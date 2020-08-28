
root = class('root');

local configureSwitcher = switch:new({'select', function(name, twoList)
	if (twoList ~= nil and twoList[name] ~= nil) then --select is only valid if we give it value
		return 0, twoList[name];
	end;
	return 1;
end;}, {'all', function(name, twoList) --giving superclasses value is optional here
	if (twoList ~= nil and twoList[name] ~= nil) then
		return 0, twoList[name];
	end;
	return 0;
end;});

root.getSuperclasses = function(self)
	local supers, currentSuper = {}, self.super;
	while (currentSuper ~= nil) do
		table.insert(supers, currentSuper);
		currentSuper = currentSuper.super;
	end;
    return supers;
end;

root.forceSuperclassInit = function(self, query, ...) --a bit more complicated than i thought
	local lquery, supers = query:lower(), self:getSuperclasses();
	local twoList = require'leng.extend':toOneToTwo{...};
    for i = 1, #supers do
		local Superclass = supers[i];
		local name, init, switcher = Superclass.name, Superclass.init, configureSwitcher[lquery];
		if (init ~= nil) then
			if (name == query) then
				init(self, ...); break;
			elseif (switcher ~= nil) then
				local statusCode, args = switcher(name, twoList);
				if (statusCode == 0) then
					init(self, (function() if (args ~= nil and args ~= 0) then return unpack(args); end;end)());
				end;
			end;
		end;
    end;
end;
