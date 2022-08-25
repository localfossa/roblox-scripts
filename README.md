<h1>Scripts</h1>

<h2>Table of Contents</h2>

<ul>
    <li><a href=#universal-auto-clicker>Universal Auto Clicker</a></li>
    <li><a href=#numacher-clicker>Numacher Clicker</a></li>
</ul>

<h2>Universal Auto Clicker</h2>

```lua
getgenv().Settings = {
    ["Auto Click Keybind"] = Enum.KeyCode.KeypadTwo, -- Use an UpperCase letter or KeyCode Enum. Ex: Enum.KeyCode.Semicolon
    ["Lock Mouse Position Keybind"] = Enum.KeyCode.KeypadFive,
    ["Right Click"] = false,
    ["GUI"] = true, -- A drawing gui that tells you what is going on with the autoclicker.
    ["Delay"] = 0 -- 0 for Heartbeat, other numbers go to regular task.wait timings.
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/localfossa/scripts/main/universal-auto-clicker/main.lua", true))()
```

<h2>Numacher Clicker</h2>
Game Link: https://www.roblox.com/games/10633843525/Numacher-Clicker

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/localfossa/scripts/main/numacher-clicker/main.lua", true))()
```
