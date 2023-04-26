-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

-- Désactive le lissage en cas de scale
love.graphics.setDefaultFilter("nearest")

local Etoiles = require("etoiles")

local bulle = require("bulle")

Etoiles.CreeEtoiles()

function love.load()
    bulle.load()
end

function love.update(dt)
    dt = math.min(dt, 1 / 60)
    Etoiles.Scrolle(dt)
    bulle.update(dt)
end

function love.draw()
    Etoiles.Afficher()
    bulle.draw()
end

function love.keypressed(key)
    if key == "e" then
        if bulle.etat == 1 then
            bulle.etat = 2
        elseif bulle.etat == 2 then
            bulle.etat = 1
        end
    elseif key == "a" then
        if bulle.etat == 1 or bulle.etat == 2 then
            bulle.etat = 3
        elseif bulle.etat == 3 then
            bulle.etat = 1
        end
    end
end
