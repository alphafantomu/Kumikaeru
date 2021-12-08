
require('30log');

local object = class('test');

object.init = function(self)

end;

table.foreach(object().class, print);