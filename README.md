
```lua
local Search = SearchTable({
	["Meow"] = "🐈",
	["mario"] = "its a me!"
})

Search["apple"] = "🍎"
Search["append"] = "📁"

print(Search["app"]) --> 🍎
print(Search["ApPLe"]) --> 🍎
print(Search["appe"]) -- > "📁"

print(Search["M"]) --> 🐈
print(Search["MARIO"]) --> its a me!
```
