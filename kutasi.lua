local r7 = {["runway"] = 7}
local r25 = {["runway"] = 25}

local a = {["taxiway"] = "alpha"}
local b = {["taxiway"] = "bravo"}
local c = {["taxiway"] = "charlie"}
local d = {["taxiway"] = "delta"}
local e = {["taxiway"] = "echo"}
local n = {["taxiway"] = "november"}
local r = {["taxiway"] = "romeo"}
local s = {["taxiway"] = "siera"}
local w = {["taxiway"] = "whiskey"}

--connections

table.insert(r7, a) --taxiway
table.insert(r7, w) --taxiway

table.insert(r25, d) --taxiway
table.insert(r25, e) --taxiway

table.insert(a, r7) --runway
table.insert(a, n) --taxiway
for I = 13,16 do table.insert(a,I) end --parking spots

--table.insert(b, r7) --runway --TODO: understand runway length
table.insert(b, n) --taxiway

--table.insert(c, r25) --runway
table.insert(c, n) --taxiway

table.insert(d, r25) --runway
table.insert(d, n) --taxiway

table.insert(e, r25) --runway
table.insert(e, s) --taxiway

table.insert(n, a) --taxiway
table.insert(n, b) --taxiway
table.insert(n, r) --taxiway
table.insert(n, c) --taxiway
table.insert(n, d) --taxiway
for I = 1,12 do table.insert(n,I) end --parking spots
for I = 22,58 do table.insert(n,I) end --parking spots

table.insert(r, n) --taxiway

table.insert(s, e) --taxiway
table.insert(s, w) --taxiway

table.insert(w, r7) --runway
table.insert(w, s) --taxiway
for I = 17,21 do table.insert(w,I) end --parking spots

return {["r7"] = r7, ["r25"] = r25, ["a"] = a, ["b"] = b, ["c"] = c, ["d"] = d, ["e"] = e, ["n"] = n, ["r"] = r, ["s"] = s, ["w"] = w}