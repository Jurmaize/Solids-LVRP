createBlip(1181.1982421875, -1324.736328125, 13.585506439209, 22, 2, 255, 0, 0, 255, 0, 300) -- All Saints General hospital
--createBlip(2034.26953125, -1406.837890625, 17.198354721069, 22, 2, 255, 0, 0, 255, 0, 300) -- County General hospital
createBlip(1685.8994140625, -2334.8125, 13.546875, 5, 2, 255, 0, 0, 255, 0, 300) -- LSIA
--createBlip(597.318359375, -1249.3232421875, 18.298223495483, 45, 2, 255, 0, 0, 255, 0, 300) -- Dupont HQ
createBlip(606.5908203125, -1458.8427734375, 14.387252807617, 45, 2, 255, 0, 0, 255, 0, 300) -- Dupont HQ
createBlip(597.3662109375, -1249.3681640625, 18.300771713257, 52, 2, 255, 0, 0, 255, 0, 300) -- Bank

addEventHandler("onClientResourceStart", getRootElement(),
    function (startedRes)
        exports.customblips:createCustomBlip(1111.220703125, -1795.310546875, 20, 20, "blips/csdd.png", 300)-- DMV
        exports.customblips:createCustomBlip(2687.7431640625, -2520.814453125, 20, 20, "blips/tow-truck.png", 300) -- LSAK
        exports.customblips:createCustomBlip(841.302734375, -1596.6552734375, 20, 20, "blips/book.png", 300) -- The Book Emporium, Marina
        exports.customblips:createCustomBlip(1477.732421875, -1765.380859375, 20, 20, "blips/dome.png", 300) -- city hall
        exports.customblips:createCustomBlip(1552.333984375, -1674.943359375, 20, 20, "blips/police.png", 300) -- LSPD pershing square
    end
);


--Next three are San Tortuguilla runway blips
--[[
createBlip(3877.3061523438, 2360.6823730469, 10.945187568665, 56, 2, 255, 0, 0, 255, 0, 800)
createBlip(3877.3061523438, 2278.6823730469, 10.945187568665, 56, 2, 255, 0, 0, 255, 0, 800)
createBlip(3877.3061523438, 2202.6823730469, 10.945187568665, 56, 2, 255, 0, 0, 255, 0, 800)
--]]