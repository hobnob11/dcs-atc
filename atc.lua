dofile("lib.lua")
Kutasi = dofile("kutasi.lua")

function recurse(pos, target, already_searched)
    local path = {}
    table.insert(already_searched, pos)
    for k,v in pairs(pos) do
        if v == target then
            path[#path+1] = tostri(target)
            return path
        elseif type(v) == "table" and (not table.contains(already_searched, v)) and (not v.runway) then

            local ret = recurse(v, target, already_searched)
            if ret then
                path[1] = tostri(v)
                for I = 1,#ret do
                    path[#path+I] = ret[I]
                end
                return path
            end
        end
    end
end

function findPath(start, target)
    local ret = {}
    if type(start) == "number" then
        local reversed = recurse(target, start, {})
        local I = 0
        local count = 0
        for k,v in pairs(reversed) do count = count + 1 end
        for k,v in pairs(reversed) do
            ret[count - I] = v
            I = I + 1
        end
    else
        for k,v in pairs(recurse(start, target, {})) do
            ret[#ret+1] = v
        end
    end
    return ret
end

print("BoxATC v0.0.1")
local Callsign = "Stingray 2-3"
while true do
    print("Parking Spot:")
    local ParkingSpot = io.read("*n")
    print("Active Runway:")
    print("1. 07")
    print("2. 25")
    local Active = io.read("*n") == 1 and Kutasi.r7 or Kutasi.r25
    local Message = "~ " .. Callsign .. ", Kutasi Tower, Clered to taxi to runway " .. Active.runway .. " via: "
    local path = findPath(ParkingSpot, Active)
    for I = 2, #path do Message = Message .. path[I] .. ", " end
    Message = Message .. "hold short of runway " .. Active.runway
    print(Message)
    sleep(2)
end
