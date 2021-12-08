
--Need to write in threads into runtime for promises

local PromiseClass = class('Promise');

PromiseClass.init = function(self, process)
	assert(process, 'Missing process');
	local PromiseManager = Kumikaeru.Core.Threads.PromiseManager;
	self:updateStatus('pending');
	PromiseManager:Hook(self);
	local resolve, reject = function(...)
		self:updateStatus('fulfilled');
		self.PromiseValue = {...};
		PromiseManager:Fulfill(self);
	end, function(...)
		self:updateStatus('rejected');
		self.PromiseValue = {...};
		PromiseManager:Reject(self);
	end;
	process(resolve, reject);
end;

PromiseClass.updateStatus = function(self, status)
	self.PromiseStatus = status;
	self.class.name = 'Promise [['..status or 'Undefined'..']]';
end;

PromiseClass.to = function(self, process, error_process)
	local PromiseValue = self.PromiseValue;
	assert(PromiseValue, 'Promise Value not found');
	local PromiseStatus = self.PromiseStatus;
	if (PromiseStatus == 'fulfilled') then

	elseif (PromiseStatus == 'rejected') then
		
	end;

	return self;
end;

PromiseClass.catch = function(self, error_process)

end;

return PromiseClass;
