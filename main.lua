
return function(Table)
	local Search = {}
	
	if Table then
		for Index, Value in next, Table do
			local Characters = string.split(string.lower(Index), "")

			local Table = Search
			for _, Character in next, Characters do
				rawset(Table, Character, rawget(Table, Character) or {Value})
				Table = rawget(Table, Character)
			end
		end
	end
	
	return setmetatable(Search, {
		__index = function(self, Index)
			local Characters = string.split(string.lower(Index), "")
			
			if #Characters == 1 then
				return rawget(rawget(Search, Characters[1]), 1)
			end
			
			local Value = Search
			
			for _, Character in next, Characters do
				if rawget(Value, Character) then
					Value = rawget(Value, Character)
				else
					return nil
				end
			end
			
			return Value[1]
		end,
		__newindex = function(self, Index, Value)
			local Characters = string.split(string.lower(Index), "")

			local Table = Search
			for _, Character in next, Characters do
				rawset(Table, Character, rawget(Table, Character) or {Value})
				Table = rawget(Table, Character)
			end
		end
	})
end
