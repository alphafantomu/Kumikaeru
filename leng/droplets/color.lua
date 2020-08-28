
color = dataType:extend('color', {
    r = 0;
    g = 0;
    b = 0;
    a = 1;
});

color.init = function(self, r, g, b, a)
    self.r, self.g, self.b, self.a = r or self.r, g or self.g, b or self.b, a or self.a;
end;

color.get = function(self)
    return self.r, self.g, self.b, self.a;
end;

color.toRGB = function(self)
    return self.r * 255, self.g * 255, self.b * 255, a;
end;