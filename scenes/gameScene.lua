-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: May 15
--
-- This programs links scenes and physics
-----------------------------------------------------------------------------------------

-- Variables for requirements
local composer = require( "composer" )
local physics = require('physics')
local json = require('json')
local tiled = require('com.ponywolf.ponytiled')

local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    physics.start()
    physics.setGravity(0, 10)
    physics.setDrawMode('hybrid')

    -- Load map to the game
    local filename = './assets/maps/level0.json'
    local mapData = json.decodeFile(system.pathForFile(filename, system.ResourceDirectory))
    map = tiled.new(mapData, 'assets/maps')
    map.xScale, map.yScale = 0.85, 0.85

    -- Load character
    local character = display.newImageRect('./assets/sprites/summer/objects/Mushroom2.png', 400, 400)
    character.x = display.contentCenterX * 0.5
    character.y = display.contentCentery
    character.id = 'character'
    physics.addBody(character, 'dynamic', {
        friction = 0.5,
        bounce = 0.3
        })
    character.isFixedRotation = true

    -- Insert elements
    sceneGroup:insert(map)
    sceneGroup:insert(character)
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene