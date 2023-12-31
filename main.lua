
return function(Table)
	local Search = {}
	local Metatable = {}

	if Table then
		for Index, Value in next, Table do
			rawset(Metatable, Index, Value)
			local Characters = string.split(string.lower(tostring(Index)), "")

			local Table = Search
			for _, Character in next, Characters do
				rawset(Table, Character, rawget(Table, Character) or {Value})
				Table = rawget(Table, Character)
			end

			local Children = rawget(Table, 2)

			if Children then
				rawset(Children, #Children + 1, Value)
			else
				rawset(Table, 2, {Value})
			end
		end
	end

	return setmetatable(Metatable, {
		__call = function(self, Index)
			local Characters = string.split(string.lower(tostring(Index)), "")
			local Value = Search

			for _, Character in next, Characters do
				if rawget(Value, Character) then
					Value = rawget(Value, Character)
				else
					return nil
				end
			end

			return Value[2]
		end,
		__index = function(self, Index)
			local Characters = string.split(string.lower(tostring(Index)), "")

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
			rawset(self, tostring(Index), Value)
			local Characters = string.split(string.lower(tostring(Index)), "")

			local Table = Search
			for _, Character in next, Characters do
				rawset(Table, Character, rawget(Table, Character) or {Value})
				Table = rawget(Table, Character)

				local Children = rawget(Table, 2)

				if Children then
					rawset(Children, #Children + 1, Value)
				else
					rawset(Table, 2, {Value})
				end
			end
		end
	})
end
