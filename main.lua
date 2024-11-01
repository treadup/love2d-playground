-- This is a small Löve2D experiment.

player = {x=1024/2, y=768/2, health=100}
tank_width = 40
tank_height = 40


-- Change the screen to fullscreen mode and hide the cursor.
function love.load()
  love.window.setMode(1024, 768, {fullscreen=true})
  love.mouse.setVisible(false)
end

-- Draw a "tank" at the players current position.
function love.draw()
  love.graphics.clear(255,255,255)
  love.graphics.setColor(0,0,0)
  x = player.x
  y = player.y
  love.graphics.polygon('line', {
    x-tank_width/2, y-tank_height/2,
    x+tank_width/2, y-tank_height/2,
    x+tank_width/2, y+tank_height/2,
    x-tank_width/2, y+tank_height/2})
end

-- Use the a,w,s,d keys to move the player around the world.
function love.update(dt)
  speedX = 0
  speedY = 0
  if love.keyboard.isDown('a') then
    speedX = speedX - 100
  end
  if love.keyboard.isDown('d') then
    speedX = speedX + 100
  end
  if love.keyboard.isDown('w') then
    speedY = speedY - 100
  end
  if love.keyboard.isDown('s') then
    speedY = speedY + 100
  end

  player.x = player.x + speedX*dt
  player.y = player.y + speedY*dt
end

-- Exit the game if the user presses the Escape key.
function love.keyreleased(key)
  if key == "escape" then
    love.event.quit()
  end
end
