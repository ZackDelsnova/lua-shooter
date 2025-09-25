function love.config()
    love.window.setMode(1280, 720)
    love.window.setTitle("Shooter")
end

function love.load()
    love.config()
    player = {
    x = 400,
    y = 200,
    speed = 3,
    radius = 50
    }
end

function love.update(dt)
    local move = player.speed * dt * 100

    if love.keyboard.isDown("right") then player.x = player.x + move end
    if love.keyboard.isDown("left") then player.x = player.x - move end
    if love.keyboard.isDown("up") then player.y = player.y - move end
    if love.keyboard.isDown("down") then player.y = player.y + move end

end

function love.draw()
    DrawCircle()

end

function DrawCircle()
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", player.x, player.y, player.radius)
end

