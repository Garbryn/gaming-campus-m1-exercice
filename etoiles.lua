local Etoiles = {}

--X Créer les données pour 100 étoiles à des coordonnées aléatoires sur l'écran
--  Faire scroller les étoiles
--  Créer un module "bulle"
--  Ce module affiche une bulle qui rebondit sur les côtés de l'écran à l'infini (logo DVD)

local listeEtoiles = {}

function Etoiles.CreeEtoiles()
    for n = 1, 100 do
        local etoile = {}

        etoile.x = love.math.random(1, love.graphics.getWidth())
        etoile.y = love.math.random(1, love.graphics.getHeight())

        table.insert(listeEtoiles, etoile)
    end
end

function Etoiles.Afficher()
    for k, v in ipairs(listeEtoiles) do
        love.graphics.circle("fill", v.x, v.y, 2)
        --love.graphics.print(tostring(k), v.x, v.y)
    end
end

function Etoiles.Scrolle(dt)
    for k, v in ipairs(listeEtoiles) do
        v.x = v.x - 200 * dt
        if v.x < 0 - 2 then
            v.x = love.graphics.getWidth() + 2
        end
    end
end

return Etoiles
