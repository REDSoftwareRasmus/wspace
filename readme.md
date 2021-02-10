
# wspace - Workspace automator
## About
CLI to store frequently visited websites and workspace setups in presets. 
Divide setups into "browser" or "workspace" presets. Every preset contains either a list of website URLs or workspace setup commands. 

## Install
- Download or clone repository
- Run `source deploy.sh` in `/wspace` directory
- This will add `wspace` to your `~/.bash_profile` along with the path to the `wspace` executable as environment variable `$WSPACE`

## Use
Workspace presets are divided into two categories: "workspaces" or "browsers".

### Workspace
In progress!

### Browser
Add `-b` or `--browser` flag to `$ wspace` call.

 ##### Add
- Workspace:  `wspace -b add [PRESET_NAME]`
- Workspace URL:  `wspace -b add [PRESET_NAME] [URL]`

 ##### Remove
- Workspace:  `wspace -b remove [PRESET_NAME]`
- Workspace URL:  `wspace -b remove [PRESET_NAME] [URL]`

##### List
- Workspaces:  `wspace -b list`
- Workspace URLs:  `wspace -b list [PRESET_NAME]`




More features coming soon! <3
