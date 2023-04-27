local bulle = {}

-- Exercice
-- Ajouter un état pour activer un bouclier pendant 5 secondes
ETAT_ROUGE = 1
ETAT_VERT = 2
ETAT_BOUCLIER = 3

bulle.x = 0
bulle.y = 0
bulle.rayon = 0
bulle.speed = 0
bulle.etat = 1

timer = 0

function bulle.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    bulle.rayon = 50
    bulle.x = width / 2
    bulle.y = height / 2
    bulle.speed_x = 150
    bulle.speed_y = 150

    timer = 5
end

function bulle.update(dt)
    if bulle.etat == 3 then
        timer = timer - dt

        if timer <= 0 then
            bulle.etat = 1
        end
        if bulle.etat == 1 or bulle.etat == 2 then
            timer = 5
        end
    end

    bulle.x = bulle.x + bulle.speed_x * dt
    bulle.y = bulle.y + bulle.speed_y * dt

    if bulle.x + bulle.rayon >= width then
        bulle.speed_x = -bulle.speed_x
        bulle.x = width - bulle.rayon
    elseif bulle.y + bulle.rayon >= height then
        bulle.speed_y = -bulle.speed_y
        bulle.y = height - bulle.rayon
    elseif bulle.x - bulle.rayon <= 0 then
        bulle.speed_x = -bulle.speed_x
        bulle.x = 0 + bulle.rayon
    elseif bulle.y - bulle.rayon <= 0 then
        bulle.speed_y = -bulle.speed_y
        bulle.y = 0 + bulle.rayon
    end
end

function bulle.draw()
    if bulle.etat == 1 then
        love.graphics.setColor(1, 0, 0, .3)
    elseif bulle.etat == 2 then
        love.graphics.setColor(0, 1, 0, .3)
    elseif bulle.etat == 3 then
        love.graphics.setColor(0, 0, 1, 0.3)
        love.graphics.circle("fill", bulle.x, bulle.y, bulle.rayon * 2)
    end
    love.graphics.circle("fill", bulle.x, bulle.y, bulle.rayon)
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.circle("line", bulle.x, bulle.y, bulle.rayon)

    if bulle.etat == 3 then
        love.graphics.print(math.ceil(timer), 1, 1)
    end
end

return bulle
