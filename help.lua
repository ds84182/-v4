help={"component.doc(address:string, method:string):string Returns the documentation string for the method with the specified name of the component with the specified address, if any.",
"component.invoke(address:string, method:string[, ...]):... Calls the method with the specified name on the component with the specified address, passing the remaining arguments as arguments to that method.",
"component.list([filter:string]):function Returns an iterator over all components currently attached to the computer, providing tuples of address and component type.",
"component.proxy(address:string):table Gets a 'proxy' object for a component that provides all methods the component provides as fields, so they can be called more directly (instead of via invoke).",
"component.type(address:string):string Get the component type of the component with the specified address.",
"component.get(address: string[, componentType: string]):string | (nil, string) Tries to resolve an abbreviated address to a full address. Returns the full address on success, or nil and an error message otherwise.",
"component.isAvailable(componentType: string):boolean Checks if there is a primary component of the specified component type.",
"component.getPrimary(componentType: string):table Gets the proxy for the primary component of the specified type. Throws an error if there is no primary component of the specified type.",
"component.setPrimary(componentType: string, address: string) Sets a new primary component for the specified component type. The address may be abbreviated, but must be valid if it is not nil.",
"component.list([filter: string]):function Returns an iterator which returns pairs of address, type for each component connected to the computer. It optionally takes a filter - if specified this will only return those components for which the filter is a substring of the component type.",
"computer.address():string The component address of this computer.",
"computer.romAddress():string The component address of the computer's ROM file system, used for mounting it on startup.",
"computer.tmpAddress():string The component address of the computer's temporary file system (if any), used for mounting it on startup.",
"computer.freeMemory():number The amount of memory currently unused, in bytes. If this gets close to zero your computer will probably soon crash with an out of memory error.",
"computer.totalMemory():number The total amount of memory installed in this computer, in bytes.",
"computer.energy():number The amount of energy currently available in the network the computer is in. For a robot this is the robot's own energy / fuel level.",
"computer.maxEnergy():number The maximum amount of energy that can be stored in the network the computer is in. For a robot this is the size of the robot's internal buffer (what you see in the robot's GUI).",
"computer.isRobot():boolean This method is deprecated, it will be removed soon. Use component.isAvailable(\"robot\") instead.",
"computer.uptime():number The time in real world seconds this computer has been running, measured based on the world time that passed since it was started - meaning this will not increase while the game is paused, for example.",
"computer.shutdown([reboot: boolean]) Shuts down the computer. Optionally reboots the computer, if reboot is true, i.e. shuts down, then starts it again automatically.",
"computer.users():string,... A list of all users registered on this computer, as a tuple. See .help users",
"computer.addUser(name: string):boolean or nil, string Registers a new user with this computer. See .help users",
"computer.removeUser(name: string):boolean Unregisters a user from this computer. Returns true if the user was removed. See .help users",
"computer.pushSignal(name: string[, ...]) Pushes a new signal into the queue. Signals are processed in a FIFO order. The signal has to at least have a name. Arguments to pass along with it are optional.",
"computer.pullSignal([timeout: number]):name,... Tries to pull a signal from the queue, waiting up to the specified amount of time before failing and returning nil. Use event.pull instead.",
"event.listen(name: string, callback: function):boolean Register a new event listener that should be called for events with the specified name.",
"event.ignore(name: string, callback: function):boolean Unregister a previously registered event listener. Returns true if the event listener was removed, false if the listener was not registered.",
"event.timer(interval: number, callback:function[, times: number]):number Starts a new timer that will be called after the time specified in interval. Per default, timers only fire once. Pass times with a value larger than one to have it fire as often as that number specifies.",
"event.cancel(timerId: function):boolean Cancels a timer previously created with event.timer. Returns true if the timer was stopped, false if there was no timer with the specified ID.",
"event.pull([timeout: number], [name: string], ...):string,... This, besides os.sleep() should be the primary way for programs to \"yield\". This function can be used to await signals from the queue, while having unrelated signals dispatched as events.",
"event.shouldInterrupt():boolean This function is called by event.pull after each signal was processed, to check whether it should abort early. If this returns true, event.pull will throw an interrupted error.",
"event.onError(message: any) Global event callback error handler. If an event listener throws an error, we handle it in this function to avoid it bubbling into unrelated code (that only triggered the execution by calling event.pull).",
"filesystem.isAutorunEnabled():boolean Returns whether autorun is currently enabled. If this is true, newly mounted file systems will be checked for a file named autorun[.lua] in their root directory.",
"filesystem.setAutorunEnabled(value: boolean) Sets whether autorun files should be ran on startup.",
"filesystem.canonical(path: string): string Returns the canonical form of the specified path, i.e. a path containing no \"indirections\" such as . or ...",
"filesystem.concat(pathA: string, pathB: string[, ...]):string Concatenates two or more paths. Note that all paths other than the first are treated as relative paths, even if they begin with a slash.",
"filesystem.path(path: string):string Returns the path component of a path to a file, i.e. everything before the last slash in the canonical form of the specified path.",
"filesystem.name(path: string):string Returns the file name component of a path to a file, i.e. everything after the last slash in the canonical form of the specified path.",
"filesystem.proxy(filter: string):table | nil, string This is similar to component.proxy, except that the specified string may also be a file system component's label. We check for the label first, if no file system has the specified label we fall back to component.proxy",
"filesystem.mount(fs: table or string, path: string): boolean | nil, string Mounts a file system at the specified path. The first parameter can be either a file system component's proxy, its address or its label.",
"filesystem.mounts():function -> table, string Returns an iterator function over all currently mounted file system component's proxies and the paths at which they are mounted.",
"filesystem.umount(fsOrPath: table or string):boolean Unmounts a file system. The parameter can either be a file system component's proxy or (abbreviated) address.",
"filesystem.get(path: string):table, string or nil, string Gets the file system component's proxy that contains the specified path.",
"filesystem.exists(path: string):boolean Checks whether a file or folder exist at the specified path.",
"filesystem.size(path: string):number Gets the file size of the file at the specified location. Returns 0 if the path points to anything other than a file.",
"filesystem.isDirectory(path: string):boolean Gets whether the path points to a directory. Returns false if not, either because the path points to a file, or file.exists(path) is false.",
"filesystem.lastModified(path: string):number Returns the real world unicode timestamp of the last time the file at the specified path was modified. For directories this is usually the time of their creation.",
"filesystem.list(path: string):function -> string or nil, string Returns an iterator over all elements in the directory at the specified path. Returns nil and an error messages if the path is invalid or some other error occurred.",
"filesystem.makeDirectory(path: string):boolean or nil, string Creates a new directory at the specified path. Creates any parent directories that do not extist yet, if necessary.",
"filesystem.remove(path: string):boolean or nil, string Deletes a file or folder. If the path specifies a folder, deletes all files and subdirectories in the folder, recursively.",
"filesystem.rename(oldPath: string, newPath: string):boolean or nil, string Renames a file or folder. If the paths point to different file system components this will only work for files, because it actually perform a copy operation, followed by a deletion if the copy succeeds.",
"filesystem.copy(fromPath: string, toPath: string):boolean or nil, string Copies a file to the specified location. The target path has to contain the target file name. Does not support folders.",
"filesystem.open(path: string[, mode: string]):table or nil, string Opens a file at the specified path for reading or writing. If mode is not specified it defaults to \"r\".",
"internet.isHttpEnabled():boolean Returns whether HTTP requests are allowed on the server (config setting).",
"internet.request(url: string[, data: string or table]):function Sends an HTTP request to the specified URL, with the specified POST data, if any. If no data is specified, a GET request will be made.",
"internet.isTcpEnabled():boolean Returns whether TCP sockets are allowed on the server (config setting).",
"keyboard.isAltDown():boolean Checks if one of the Alt keys is currently being held by some user.",
"keyboard.isControl(char: number):boolean Checks if the specified character (from a keyboard event for example) is a control character as defined by Java's Character class. Control characters are usually not printable.",
"keyboard.isControl(char: number):boolean Checks if the specified character (from a keyboard event for example) is a control character as defined by Java's Character class. Control characters are usually not printable.",
"keyboard.isKeyDown(charOrCode: any):boolean Checks if a specific key is currently being by some user. If a number is specified it is assumed it's a key code.",
"keyboard.isShiftDown():boolean Checks if one of the Shift keys is currently being held by some user.",
"process.load(path:string[, env:table[, init:function[, name:string]]]):coroutine Loads a Lua script from the specified absolute path and sets it up as a process. It will be loaded with a custom environment, to avoid cluttering the callers/global environment.",
"process.running([level: number]):string, table, string Returns the path to the currently running program (i.e. the last process created via process.load). The level can optionally be provided to get parent processes.",
"robot.level():number Gets the current level of the robot, with the fractional part being the percentual progress towards the next level.",
"robot.detect():boolean, string Tests if there is something in front of the robot. Returns true if there is something that would block the robot's movement, false otherwise. The second value can be: entity, solid, replaceable, liquid and air.",
"robot.detectUp():boolean, string Like robot.detect, but for the block above the robot.",
"robot.detectDown():boolean, string Like robot.detect, but for the block below the robot.",
"robot.select([slot: number]):number Selects the inventory slot with the specified index, which is an integer in the interval [1, 16].",
"robot.count([slot: number]):number Gets the number of item in the specified inventory slot. If no slot is specified returns the number of items in the selected slot.",
"robot.space([slot: number]):number Gets how many more items can be put into the specified slot, which depends on the item already in the slot (for example, buckets only stack up to 16, so if there are 2 buckets in the slot this will return 14).",
"robot.compareTo(slot: number):boolean Compares the item in the currently selected slot to the item in the specified slot. Returns true if the items are equal (i.e. the stack size does not matter), false otherwise.",
"robot.transferTo(slot: number[, count: number]):boolean Moves items from the selected slot into the specified slot. If count is specified only moves up to this number of items.",
"robot.compare():boolean Compares the item in the currently selected inventory slot to the block in front of the robot. Returns true if the block is equivalent to the item at the selected slot, false otherwise.",
"robot.compareUp():boolean Like robot.compare, but for the block above the robot.",
"robot.compareDown():boolean Like robot.compare, but for the block below the robot.",
"robot.drop([count: number]):boolean Drops items from the selected inventory slot. If count is specified only drops up to that number of items. If the robot faces a block with an inventory, such as a chest, it will try to insert the items into that inventory.",
"robot.dropUp([count: number]):boolean Like robot.drop, but drops into inventories or the block above the robot.",
"robot.dropDown([count: number]):boolean Like robot.drop, but drops into inventories or the block below the robot.",
"robot.place([side: number[, sneaky: boolean]]):boolean Places a block from the selected inventory slot in front of the robot. Returns true on success, false otherwise. The side parameter determines the \"surface\" on which to try to place the block. If it is omitted the robot will try all surfaces.",
"robot.placeUp([side: number[, sneaky: boolean]]):boolean Like robot.place, but for placing blocks above the robot.",
"robot.placeDown([side: number[, sneaky: boolean]]):boolean Like robot.place, but for placing blocks below the robot.",
"robot.suck([count: number]):boolean Sucks at maximum one stack into the selected slot, or the first free slot after the selected slot. Returns true if one or more items were picked up, false otherwise.",
"robot.suckUp([count: number]):boolean Like robot.suck, but for inventories or items lying above the robot.",
"robot.suckDown([count: number]):boolean Like robot.suck, but for inventories or items lying below the robot.",
"robot.durability():number or nil, string If the robot has a tool equipped, this can be used to check the remaining durability of that tool. Returns the remaining durability, if the tool has durability, nil and a reason otherwise.",
"robot.swing([side: number]):boolean[, string] Makes the robot perform a \"left click\", using the currently equipped tool, if any. The result of this action depends on what is in front of the robot.",
"robot.swingUp([side: number]):boolean[, string] Like robot.swing, but towards the area above the robot.",
"robot.swingDown([side: number]):boolean[, string] Like robot.swing, but towards the area below the robot.",
"robot.use([side: number[, sneaky:boolean[, duration: number]]]):boolean[, string] Makes the robot perform a \"right click\", using the currently equipped tool, if any. The result on this action depends on what is in front of the robot. Returns true if something happened, false otherwise.",
"robot.useUp([side: number[, sneaky:boolean[, duration: number]]]):boolean[, string] Like robot.use, but towards the area above the robot.",
"robot.useDown([side: number[, sneaky:boolean[, duration: number]]]):boolean[, string] Like robot.use, but towards the area below the robot.",
"robot.forward():boolean[, string] Makes the robot try to move into the block in front of it. Returns true if the robot moved successfully, nil and a reason otherwise. The reason string will be one of the blocking results from the robot.detect function.",
"robot.back():boolean[, string] Like robot.forward, but makes the robot try to move into the block behind it.",
"robot.up():boolean[, string] Like robot.forward, but makes the robot try to move into the block above it.",
"robot.down():boolean[, string] Like robot.forward, but makes the robot try to move into the block below it.",
"robot.turnLeft() Makes the robot turn by 90 degrees to its left.",
"robot.turnRight() Makes the robot turn by 90 degrees to its right.",
"robot.turnAround() Makes the robot turn around by 180 degrees.",
"serialization.serialize(value: any except functions[, pretty:boolean]):string Generates a string from an object that can be parsed again using serialization.unserialize. The generated output is Lua code.",
"serialization.unserialize(value: string):... Restores an object previously saved with serialization.serialize.",
"shell.getAlias(alias: string):string Gets the value of a specified alias, if any. If there is no such alias returns nil.",
"shell.setAlias(alias: string, value: string or nil) Defines a new alias or updates an existing one. Pass nil as the value to remove an alias. Note that aliases are not limited to program names, you can include parameters as well. For example, view is a default alias for edit -r.",
"shell.aliases():function Returns an iterator over all known aliases.",
"shell.getWorkingDirectory(): string Gets the path to the current working directory. This is an alias for os.getenv(\"PWD\").",
"shell.setWorkingDirectory(dir: string) Sets the current working directory. This is a checked version of os.setenv(\"PWD\", dir).",
"shell.getPath():string Gets the search path used by shell.resolve. This can contain multiple paths, separated by colons (:). This is an alias for os.getenv(\"PATH\").",
"shell.setPath(value: string) Sets the search path. Note that this will replace the previous search paths. To add a new path to the search paths, do this: shell.setPath(shell.getPath() .. \":/some/path\")",
"shell.resolve(path: string[, ext: string]):string Tries to \"resolve\" a path, optionally also checking for files with the specified extension, in which case path would only contain the name.",
"shell.execute(command: string, env: table[, ...]):boolean ... Runs the specified command. This runs the default shell (see os.getenv(\"SHELL\")) and passes the command to it. env is the environment table to use for the shell.",
"shell.parse(...):table, table Utility methods intended for programs to parse their arguments. Will return two tables, the first one containing any \"normal\" parameters, the second containing \"options\".",
"shell.running([level: number]):string Deprecated, use \"process.running\".",
"term.isAvailable():boolean Returns whether the term API is available for use, i.e. whether a primary GPU an screen are present. In other words, whether term.read and term.write will actually do something.",
"term.getCursor():number, number Gets the current position of the cursor.",
"term.setCursor(col: number, row: number) Sets the cursor position to the specified coordinates.",
"term.getCursorBlink():boolean Gets whether the cursor blink is currently enabled, i.e whether the cursor alternates between the actual \"pixel\" displayed at the cursor position and a fully white block every half second.",
"term.setCursorBlink(enabled: boolean) Sets whether cursor blink should be enabled or not.",
"term.clear() Clears the complete screen and resets the cursor position to (1, 1).",
"term.clearLine() Clears the line the cursor is currently on and resets the cursor's horizontal position to 1.",
"term.read([history: table]):string Read some text from the terminal, i.e. allow the user to input some text. For example, this is used by the shell and Lua interpreter to read user input.",
"term.write(value: string[, wrap: boolean]) Allows writing optionally wrapped text to the terminal starting at the current cursor position, updating the cursor accordingly.",
"text.detab(value: string, tabWidth: number):string Converts tabs in a string to spaces, while aligning the tags at the specified tab width. This is used for formatting text in term.write, for example.",
"text.padRight(value: string, length: number):string Pads a string with whitespace on the right up to the specified length.",
"text.padLeft(value: string, length: number):string Pads a string with whitespace on the left up to the specified length.",
"text.trim(value: string):string Removes whitespace characters from the start and end of a string.",
"text.serialize(value: any except functions):string Deprecated, use \"serialization.serialize\".",
"text.unserialize(value: string):... Deprecated, use \"serialization.unserialize\".",
"unicode.char(value: number, ...):string UTF-8 aware version of string.char. The values may be in the full UTF-8 range, not just ASCII.",
"unicode.len(value: string):number UTF-8 aware version of string.len. For example, for Ümläüt it'll return 6, where string.len would return 9.",
"unicode.lower(value: string):string UTF-8 aware version of string.lower.",
"unicode.reverse(value: string):string UTF-8 aware version of string.reverse. For example, for Ümläüt it'll return tüälmÜ, where string.reverse would return tälm.",
"unicode.sub(value: string, i:number[, j:number]):string UTF-8 aware version of string.sub.",
"unicode.upper(value: string):string UTF-8 aware version of string.upper.",
}
local o={}
local alias={
	["filesystem"]="fs",
	["robot"]="turtle",
}
for k,v in pairs(help) do
	local func=v:match("^[^%(]+"):lower()
	o[func]=v
	for n,l in pairs(alias) do
		if func:match("^"..n.."%.") then
			o[func:gsub(n,l)]=v
		end
	end
end
help=o