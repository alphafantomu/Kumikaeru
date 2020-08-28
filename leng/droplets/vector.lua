
vector = dataType:extend('vector', {x = 0; y = 0;});

vector.init = function(self, x, y)
    self.x, self.y = x or self.x, y or self.y;
end;