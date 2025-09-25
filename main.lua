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
        size = 50,
        color = {0, 0, 1}
    }

    bullet_info = {
        size = 5,
        color = {0, 1, 0}
    }
    bullets = {}
end

function love.mousepressed(x, y, button)
    if button == 1 then
        table.insert(bullets, {
            x = player.x,
            y = player.y,
            speed = 300
        })
    end
end

function love.update(dt)
    local move = player.speed * dt * 100

    if love.keyboard.isDown("d") then player.x = player.x + move end
    if love.keyboard.isDown("a") then player.x = player.x - move end
    if love.keyboard.isDown("w") then player.y = player.y - move end
    if love.keyboard.isDown("s") then player.y = player.y + move end

    for i=#bullets, 1, -1 do
        local b = bullets[i]
        b.y = b.y - b.speed * dt
        if b.y < 0 then
            table.remove(bullets, i)
        end
    end

end

function love.draw()
    DrawCircle()
    DrawBullet()
end

function DrawCircle()
    love.graphics.setColor(player.color)
    love.graphics.circle("fill", player.x, player.y, player.size)
end

function DrawBullet()
    love.graphics.setColor(bullet_info.color)

    for _,b in ipairs(bullets) do
        love.graphics.circle("fill", b.x, b.y, bullet_info.size)
    end
end

