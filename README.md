# Paradox Fire Dispatch - The premiere fire system
This is an original fire script developed by JnKTechstuff(Jake K #2217) with some code from Albo1125's previous fire script. The code has been commented and credited and prior permission granted from Albo1125.


## Primary goals for this project
- Bring fire to every server and allow pull requests to improve it

## Paradox Gaming
This script was developed for Paradox Gaming. A public RP community co-founded by myself and E1Gamer.

If you are looking for a server give ours a try:
[Paradox Gaming](https://www.paradoxgaming.co/)

## Using

Be warned that ParadoxFireDispatch is in ALPHA stages and is **not** ready for production use.

If you want to use job limits and other things you **must** either adapt the script for ESX or use [ExM](https://github.com/extendedmode/extendedmode)

If you are **not** using any of the job stuff or a different framework **remove** this line in **fxmanifest.lua**:

```lua
shared_script '@extendedmode/imports.lua'
```


## Links & Read more

- [Paradox Gaming](http://discord.paradoxgaming.co/)
- [Extendedmode Github](https://github.com/extendedmode/extendedmode)
- [FiveM Native Reference](https://runtime.fivem.net/doc/reference.html)
- [Albo1125's Fire Script](https://github.com/Albo1125/FireScript)
- [FiveM Forum Post]() (Coming soon!)


## Features

- Server synchronized fires
- Fade-in/fade-out effect
- After effects
- Dynamic fire spawning based on player events
- No floating fires

## Commands
*if enabled in config*
- `/startfire <number of flames> <radius of fire>`

## Requirements

- A working brain and if you want jobs then Extendedmode (works out of the box) or some other framework

## Planned Features:

- If no random fires in `x` amount of time start a fire from a defined table of coords
- Multiple fires
- Fire spreading

## Contributing

1) Fork this repository to your own account, then check out the "development" branch.
2) Write your changes.
3) Test your changes against your own server.
4) Create a pull request against the "development" branch.

When contributing code, it's important to include a short summary of what the code does in your pull request so it can be reviewed quickly.

## Legal

### Licenses

#### Paradox Fire Dispatch - The premiere fire system

Copyright (C) 2020 Jake K #2217

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
