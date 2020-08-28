
local extend = class('extend');

--[[extend.upToInIndex = function(self, array, i)
	local indexes = {};
	for v = 1, #array do
		if (v >= i) then
			break;
		end;
		table.insert(indexes, array[v]);
	end;
	return indexes;
end;

extend.getListType = function(self, list)

end;]]

extend.toOneToTwo = function(self, list)
    local n_list = {};
	for i = 1, #list do
		local res = list[i];
		if (res ~= nil and type(res):lower() == 'table') then
			local f, g = unpack(res);
			n_list[f] = g or 0;
		end;
	end;
	return n_list;
end;

return extend;