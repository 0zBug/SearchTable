
```lua
local SearchTable = loadstring(game:HttpGet("http://🔍.glitch.me"))()

local Players = game:GetService("Players")

local Player = SearchTable({
	me = Players.LocalPlayer
})

for _, Instance in Players:GetPlayers() do
	Player[Instance.Name] = Instance
	Player[Instance.DisplayName] = Instance
end

Players.PlayerAdded:Connect(function(Instance)
	Player[Instance.Name] = Instance
	Player[Instance.DisplayName] = Instance
end)

local function Lookup(Table)
	local Lookup = SearchTable()
	
	for Index, Value in next, Table do
		Lookup[Value] = Index
	end
	
	return Lookup
end

local LookupPlayer = Lookup(Player)

print(LookupPlayer[Players.LocalPlayer]) --> 4DBug
print(Player["4d"].Character.Head) --> Head
print(Player["me"]) --> 4DBug
```
