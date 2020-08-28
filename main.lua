
--[[
    Tree goes like this:
    
    Root                                                      Switch
      |
      --------------------
      |            |                                              
      object      data Type --------------------------
      |                             |           |
      --------------------------    vector     color
      |           |            |
      ui        physics       



      The issue is that if we have any init() lower in the tree than the init() higher in the tree, the lower init() will be prioritized.
          The issue above is fixed by having root have a function that forces the object to forcefully initialize superclasses.
      
]]

local leng = require'leng';
local package = leng.package;
package.load('winter');

leng.enum:set('test');
leng.enum:set('tesaa', 'tester');

print(leng.enum.test, leng.enum.tesaa.tester);

local Block = block:new();
print(Block.position, Block.internal);

function love.draw()
    love.graphics.push()   -- stores the coordinate system
    love.graphics.scale(0.5, 0.5)   -- reduce everything by 50% in both X and Y coordinates
    love.graphics.print("Scaled text", 50, 50)   -- print half-sized text at 25x25
    love.graphics.pop()   -- return to stored coordinated
    love.graphics.print("Normal text", 50, 50)
 end
