
```lua
local Search = SearchTable({
	["Meow"] = "🐈",
	["mario"] = "its a me!"
})

Search["apple"] = "🍎"
Search["append"] = "📁"

Search["Variable_1"] = "var 1"
Search["Variable_2"] = "var 2"

print(Search["Var"]) --> var 1
print(Search["Variable_2"])
print(table.unpack(Search("Var"))) --> var 1 var 2

print(Search["app"]) --> 🍎
print(Search["ApPLe"]) --> 🍎
print(Search["appe"]) -- > "📁"

print(Search["M"]) --> 🐈
print(Search["MARIO"]) --> its a me!
```
