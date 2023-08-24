minetest.register_chatcommand("findnode", {
    params = "<node> <radius>",
    func = function(message)
        local nodename = message:split(" ")[1]
        local radius = tonumber(message:split(" ")[2])
        if not nodename or not radius then
            print(minetest.colorize("orange","Please enter a nodename and a radius."))
            return
        end
        if radius > 200 then
            print(minetest.colorize("orange","Maximum radius is 200, radius set to 200."))
            radius = 200
        end
        playerpos = (core.camera:get_pos():offset(0,-1.5,0))
        local searchnodes = (core.find_node_near(playerpos, radius, {nodename}))
        if searchnodes ~= nil then
            print(minetest.colorize("orange", nodename .. " is at position " .. tostring(searchnodes) .. ", " .. tostring(math.sqrt(math.pow((searchnodes.x-playerpos.x),2)+math.pow((searchnodes.y-playerpos.y),2)+math.pow((searchnodes.z-playerpos.z),2))) .. " blocks away."))
        else
            print(minetest.colorize("orange", nodename .. " not found."))
        end
    end,
})
