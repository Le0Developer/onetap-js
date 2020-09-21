Onetap.com Javascript globals
=============================

This tries to cover all javascript globals of the Onetap V3 crack runtime.

All of these globals were collected/extracted with 
`a script <https://github.com/le0developer/onetap-js/blob/maater/scripts/dump_globals.coffee>`_ 
and documented by humans.


.. js:data:: __filename

    Filename of the running script.

Global
------

.. warning:: 

    The usage of this module is discouraged, please use the dedicated modules instead.

.. js:module:: Global

.. js:function:: Print()

    This is an alias for :js:func:`Cheat.Print`

.. js:function:: PrintChat()

    This is an alias for :js:func:`Cheat.PrintChat`

.. js:function:: PrintColor()

    This is an alias for :js:func:`Cheat.PrintColor`

.. js:function:: RegisterCallback()

    This is an alias for :js:func:`Cheat.RegisterCallback`

.. js:function:: ExecuteCommand()

    This is an alias for :js:func:`Cheat.ExecuteCommand`

.. js:function:: FrameStage()

    This is an alias for :js:func:`Cheat.FrameStage`

.. js:function:: Tickcount()

    This is an alias for :js:func:`Globals.Tickcount`

.. js:function:: Tickrate()

    This is an alias for :js:func:`Globals.Tickrate`

.. js:function:: Curtime()

    This is an alias for :js:func:`Globals.Curtime`

.. js:function:: Realtime()

    This is an alias for :js:func:`Globals.Realtime`

.. js:function:: Frametime()

    This is an alias for :js:func:`Globals.Frametime`

.. js:function:: Latency()

    This is an alias for :js:func:`Local.Latency`

.. js:function:: GetViewAngles()

    This is an alias for :js:func:`Local.GetViewAngles`

.. js:function:: SetViewAngles()

    This is an alias for :js:func:`Local.SetViewAngles`
    
.. js:function:: GetMapName()

    This is an alias for :js:func:`World.GetMapName`

.. js:function:: IsKeyPressed()

    This is an alias for :js:func:`Input.IsKeyPressed`

.. js:function::  GetScreenSize()

    This is an alias for :js:func:`Render.GetScreenSize`

.. js:function:: GetCursorPosition()

    This is an alias for :js:func:`Input.GetCursorPosition`

.. js:function:: PlaySound()

    This is an alias for :js:func:`Sound.Play`

.. js:function:: PlayMicrophone()

    This is an alias for :js:func:`Sound.PlayMicrophone`

.. js:function:: StopMicrophone()

    This is an alias for :js:func:`Sound.StopMicrophone`

.. js:function:: SetClantag()

    This is an alias for :js:func:`Local.SetClantag`

.. js:function:: GetUsername()

    This is an alias for :js:func:`Cheat.GetUsername`


Globals
-------

.. js:module:: Globals

.. js:function:: Tickcount()

    Returns the current tick.

    :returns: Current tick
    :return type: integer

.. js:function:: Tickrate()

    Returns the current tickrate, aka how many ticks the server is running per second.

    It is 64 in matchmaking and most community servers.

    :returns: Tickrate
    :return type: integer

.. js:function:: TickInterval()

    Returns the delay between each tick.

    Equivalent to:

    .. code:: js

        function TickInterval() {
            return 1 / Global.Tickrate();
        }

    :returns: Tickinterval in seconds
    :return type: float

.. js:function:: Curtime()

    Returns the current time of the server.

    :returns: Current time in seconds
    :return type: float

.. js:function:: Realtime()

    Returns the time in seconds since CS:GO was started.

    :returns: Time in seconds
    :return type: float

.. js:function:: Frametime()

    Returns the last frame took to render.

    :returns: Time in seconds
    :return type: float

Sound
-----

.. js:module:: Sound

.. js:function:: Play(filename[, duration[, volume]])

    Plays a sound from a `.wav` file, optionally you can set a duration and a volume ranging from 0 to 1.

    :param string filename: Filename of the sound
    :param float duration: Duration of the sound effect
    :param float volume: Volume of the sound between 0 and 1

.. js:function:: PlayMicrophone(filename, ?)

    Plays a sound from a `.wav` file over your microphone.

    :param string filename: Fileanme of the sound

.. js:function:: StopMicrophone()

    Interrupt the playing sound from :js:func:`Sound.PlayMicrophone`.


Cheat
-----

.. js:module:: Cheat

.. js:function:: GetUsername()

    Returns the onetap username, but in OTCv3 this is replaced by the steam name on injection.

    :returns: Onetap username or steam name
    :return type: string

.. js:function:: RegisterCallback(callback, name)

    Registers a callback, valid callbacks can be found `here <callbacks.html>`_.

    Example:

    .. code:: js

        function onCreateMove() {
            // gets called every tick
        }
        Global.RegisterCallback("CreateMove", "onCreateMove"); // the name of the function


    :param string callback: Name of the callback.
    :param string name: Name of the callback function.

.. js:function:: ExecuteCommand(command)

    Executes a command in the CS:GO console.

    :param string command: The command to execute.

.. js:function:: FrameStage()

    Returns the current frame stage.
    
    +---------+----------------------------------------+
    |  Stage  |  Meaning                               |
    +=========+========================================+
    |    0    |  Frame Start                           |
    +---------+----------------------------------------+
    |    1    |  Frame NetUpdate Start                 |
    +---------+----------------------------------------+
    |    2    |  Frame NetUpdate PostDataUpdate Start  |
    +---------+----------------------------------------+
    |    3    |  Frame NetUpdate PostDataUpdate End    |
    +---------+----------------------------------------+
    |    4    |  Frame NetUpdate End                   |
    +---------+----------------------------------------+
    |    5    |  Frame Render Start                    |
    +---------+----------------------------------------+
    |    6    |  Frame Render End                      |
    +---------+----------------------------------------+

    :returns: Current frame stage
    :return type: integer

    .. note::
        Can only be used during a :js:func:`FrameStageNotify` callback.

.. js:function:: Print(text)

    Prints text into the CS:GO console.

    :param string text: The text to print into the console.

.. js:function:: PrintChat(text)

    Prints colored text into the chat.

    :param string text: The text to print into the chat.

    .. note::
        The text is clientside, so only you can see the text.

.. js:function:: PrintColor(text)

    Prints colored text into the CS:GO console.

    :param string text: The text to print into the console.


Local
-----

.. js:module:: Local

.. js:function:: Latency()

    Returns your latency to the server.

    :returns: Latency in seconds.
    :return type: float

.. js:function:: GetViewAngles()

    Returns the current viewangles of yourself.

    Example:

    .. code:: js

        function onDraw() {
            const angles = Global.GetViewAngles();
            Render.String(5, 5, "Angles: pitch=" + angles[0] + " yaw=" + angles[1] + " roll=" + angles[2]);
        }
        Global.RegisterCallback("Draw", "onDraw");

    :returns: Current viewangles
    :return type: Vector3

.. js:function:: SetViewAngles(angles)

    Sets the current viewangles of yourself.

    :param Vector3 angles: New viewangles.

.. js:function:: SetClanTag(tag)

    Sets the current clantag.

    :param string tag: Clantag to change to.

.. js:function:: GetRealYaw()

    Returns the current yaw of your real.

    :returns: Absolute yaw of the real
    :return type: float

.. js:function:: GetFakeYaw()

    Returns the current yaw of your fake.

    :returns: Absolute yaw of the fake
    :return type: float

.. js:function:: GetSpread()

    Returns the **S P R E A D** of the current selected gun.

    :returns: Gun spread
    :return type: float

.. js:function:: GetInaccuracy()

    Returns the inaccuracy of the current selected gun with moving inaccuracy calculations.

    :returns: Shot inaccuracy
    :return type: float


World
-----

.. js:module:: World

.. js:function:: GetMapName()

    Returns the current map name.

    Examples:
    
        - `de_dust2`
        - `de_mirage`
        - `cs_office`

    :returns: Current map name
    :return type: string

.. js:function:: GetServerString()

    Returns the current server (ip, port, offline match, ...) as a string.
    This is used in the watermark.

    :returns: Current server as string
    :return type: string

Input
-----

.. js:module:: Input

.. js:function:: GetCursorPosition()

    Returns the current position of the cursor.

    :returns: Cursorposition
    :return type: Vector2

.. js:function:: IsKeyPressed(key)

    Returns if the key is currently pressed.

    :param integer key: `Virtual Key Codes <https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes>`_
    :returns: If the key is is pressed
    :return type: boolean


Render
------

.. js:module:: Render

.. note::
    Can only be used during a :js:func:`Draw` callback.

.. js:function:: String(x, y, text, color[, size])

    Renders the string `text` at x|y.

    :param string text: Text to write
    :param integer x: x position
    :param integer y: y position
    :param Color color: Color
    :param integer size: Size of the text

.. js:function:: TextSize(text[, size])

    Returns the size of the text.

    :param string text: Text to measure
    :param integer size: Size of the text
    :returns: Size the text would take
    :return type: Vector2

.. js:function:: Line(x1, y1, x2, y2, color)

    Renders a line from x1|y1 to x2|y2.

    :param integer x1: x position of the start
    :param integer y1: y position of the start
    :param integer x2: x position of the end
    :param integer y2: y position of the end
    :param Color color: Color

.. js:function:: Rect(x, y, width, height, color)

    Renders a rectangle from x|y with the width `width` and height `height`.

    :param integer x: x position
    :param integer y: y position
    :param integer width: width
    :param integer height: height
    :param Color color: Color

.. js:function:: FilledRect(x, y, width, height, color)

    Renders a rectangle from x|y with the width `width` and height `height` filled with `color`.

    :param integer x: x position
    :param integer y: y position
    :param integer width: width
    :param integer height: height
    :param Color color: Color

.. js:function:: GradientRect(x, y, width, height, color1, color2)

    Renders a rectangle from x|y with the width `width`.

    :param integer x: x position
    :param integer y: y position
    :param integer width: width
    :param integer height: height
    :param Color color: Color

.. js:function:: Circle(x, y, r, color)

    Renders a circle at x|y.

    :param integer x: x position
    :param integer y: y position
    :param integer r: radius of the circle
    :param Color color: Color

.. js:function:: Polygon(points, color)

    Renders a polygon/triangle, the 3 corners are in `points`.

    Example:

    .. code:: js

        function onDraw() {
            Render.Polygon([[50, 0], [25, 50], [75, 50]], [255, 0, 0, 255]);
        }
        Cheat.RegisterCallback("Draw", "onDraw");

    :param Sequence[Vector2] points: The 3 corners
    :param Color color: Color

.. js:function:: WorldToScreen(position)

    Returns screen position from world position.

    :param Vector3 position: Position in the world
    :returns: Position on screen
    :return type: Vector2

.. js:function:: AddFont(name, size, weight)

    Returns font object.

    :param string name: Name of the font
    :param integer size: Font size
    :param integer weight: Font weight

.. js:function:: FindFont(?)

    .. warning:: Undocumented function.

.. js:function:: StringCustom(x, y, align, text, color, font)

    Renders the string `text` at x|y with a custom font.

    :param integer x: x position
    :param integer y: y position
    :param integer align: How to align the text
    :param string text: Text to write
    :param Color color: Color
    :param Font font: Font

.. js:function:: TexturedRect(x, y, width, height, texture)

    Renders the texture `texture` at x|y with the width `width` and height `height`.

    :param integer x: x position
    :param integer y: y position
    :param integer width: with
    :param integer height: height
    :param Texture texture: Texture

.. js:function:: AddTexture(filename)

    Returns a texture loaded from a file.

    :param string filename: Filename of the image
    :returns: Texture from the file
    :return type: Texture

.. js:function:: TextSizeCustom(text, font)

    Returns the size of the text with a custom font.

    :param string text: Text
    :param Font font: Font
    :returns: Size of the text
    :return type: Vector2

.. js:function:: GetScreenSize()

    Returns the size of the screen.

    :returns: Screensize
    :return type: Vector2

UI
--

.. js:module:: UI

.. js:function:: GetValue(...path)

    Returns the value of the UI element at the specified path.

    Example:

    .. code:: js

        function GetFakelag() {
            if(!UI.GetValue("Anti-Aim", "Fake-Lag", "Enabled"))
                return 0; // fakelag disabled
            return UI.GetValue("Anti-Aim", "Fake-Lag", "Limit");
        }

    :param string ...path: Path of the element
    :returns: The value of the element
    :return type: Any

.. js:function:: SetValue(...path, value)

    Sets the value of the UI element at the specified path to value.

    Example:

    .. code:: js

        function disableFakelag() {
            UI.SetValue("Anti-Aim", "Fake-Lag", "Enabled", false);
        }
    
    :param string ...path: Path of the element
    :param Any value: New value

.. js:function:: AddCheckbox(name)

    Adds a checkbox element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the checkbox

.. js:function:: AddSliderInt(name[, min[, max])

    Adds a slider element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the slider
    :param integer min: Minimal value
    :param integer max: Maximal value

.. js:function:: AddSliderFloat(name[, min[, max])

    Adds a slider element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the slider
    :param float min: Minimal value
    :param float max: Maximal value


.. js:function:: AddHotkey(name)

    Adds a hotkey element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the hotkey

.. js:function:: AddLabel(text)

    Adds a label element to "Misc", "JAVASCRIPT", "Script Items".

    :param string text: The text to add

.. js:function:: AddDropdown(name, options)

    Adds a dropdown element to "Misc", "JAVASCRIPT", "Script Items".

    Example:

    .. code:: js

        UI.AddDropdown("sample dropdown", ["option 1", "option 2"])

        UI.GetValue("Misc", "JAVASCRIPT", "Script Items", "sample dropdown") == 0 // selected by default

    :param string name: Name of the dropdown
    :param Sequence[string] options: Sequence(array) of options

.. js:function:: AddMultiDropdown(name, options)

    Adds a multidropdown element to "Misc", "JAVASCRIPT", "Script Items".

    Example:

    .. code:: js

        UI.AddMultiDropdown("sample dropdown", ["option 1", "option 2"])

        UI.GetValue("Misc", "JAVASCRIPT", "Script Items", "sample dropdown") == [] // empty list because nothing is selected

    :param string name: Name of the multidropdown
    :param Sequence[string] options: Sequence(array) of options

.. js:function:: AddColorPicker(name)

    Adds a colorpicker element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the colorpicker

.. js:function:: AddTextbox(name)

    Adds a textbox element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the textbox

.. js:function:: SetEnabled(...path, value)

    Enables/disables the element at the specified path.

    :param string ...path: Path to the element
    :param boolean value: Whether to enable or disable

.. js:function:: GetString(...path)

    Returns the value of the textbox element at the specified path.

    :param string ...path: Path of the element
    :returns: The value of the element
    :return type: string

.. js:function:: GetColor(...path)

    Returns the value of the colorpicker element at the specified path.

    :param string ...path: Path of the element
    :returns: The value of the element
    :return type: Vector4

.. js:function:: SetColor(name, color)

    Sets the value of the colorpicker element at the specified path to the color.
    
    :param string ...path: Path of the element
    :param Vector4 color: New color

.. js:function:: ToggleHotkey(...path)

    Simulates pressing the hotkey for the element at the specified path.

    :param string ...path: Path of the element
    :returns: New state of the hotkey, 1 is active, 0 means inactive
    :return type: integer

.. js:function:: IsMenuOpen()

    Returns if the menu is opened.

    :returns: If the menu is opened
    :return type: boolean


Convar
------

.. js:module:: Convar

.. js:function:: GetInt(name)

    Returns the current value of the specified ConVar.

    :param string name: Name of the ConVar
    :returns: Value of the ConVar
    :return type: integer

.. js:function:: SetInt(name, value)

    Sets the value of the specified ConVar.

    :param string name: Name of the ConVar
    :param integer value: New value

.. js:function:: GetFloat(name)

    Returns the current value of the specified ConVar.

    :param string name: Name of the ConVar
    :returns: Value of the ConVar
    :return type: float

.. js:function:: SetFloat(name, value)

    Sets the value of the specified ConVar.

    :param string name: Name of the ConVar
    :param float value: New value

.. js:function:: GetString(name)

    Returns the current value of the specified ConVar.

    :param string name: Name of the ConVar
    :returns: Value of the ConVar
    :return type: string

.. js:function:: SetString(name, value)

    Sets the value of the specified ConVar.

    :param string name: Name of the ConVar
    :param string value: New value


Event
-----

.. js:module:: Event

.. note::
    Can only be used during a `CS:GO Event <callbacks.html#cs-go-events>`_ 
    and a `Special Cheat Event <callbacks.html#special-cheat-events>`_.

.. js:function:: GetInt(name)

    Returns the integer representation of the specified name.

    :returns: Value of the name
    :return type: integer

.. js:function:: GetFloat(name)

    Returns the floating point representation of the specified name.

    :returns: Value of the name
    :return type: float

.. js:function:: GetString(name)

    Returns the string representation of the specified name.

    :returns: Value of the name
    :return type: string


Entity
------

.. js:module:: Entity

.. js:function:: GetEntities()

    Returns all entities.

    :returns: All entities
    :return type: Sequence[Entity]

.. js:function:: GetEntitiesByClassID(classid)

    Returns all entities with a matching class id.

    :param integer classid: classid
    :returns: Index of all matching entities
    :return type: integer

.. js:function:: GetPlayers()

    Returns all players.

    :returns: All playerindexes
    :return type: Sequence[integer]

.. js:function:: GetEnemies()

    Returns all players in the enemy team.

    :returns: All enemyindexes
    :return type: Sequence[integer]

.. js:function:: GetTeammates()

    Returns all players your team.

    :returns: All teammateindexes
    :return type: Sequence[integer]

.. js:function:: GetLocalPlayer()

    Returns the index of yourself.

    :returns: Yourself
    :return type: integer

.. js:function:: GetGameRulesProxy()

    Returns entityindex of the game rules entity
    
    :returns: Entityindex
    :return type: integer

.. js:function:: GetEntityFromUserID(userid)

    Returns the player with the userid.

    :param string userid: Userid of the player to find
    :returns: Player matching the userid
    :return type: Entity

.. js:function:: IsTeammate(entityindex)

    Returns if the entity is a teammate.

    :param integer entityindex: Entityindex of the entity
    :returns: Entity is a teammate
    :return type: boolean

.. js:function:: IsEnemy(entityindex)

    Returns if the entity is an enemy.

    :param integer entityindex: Entityindex of the entity
    :returns: Entity is an enemy
    :return type: boolean

.. js:function:: IsBot(entityindex)

    Returns if the entity is a bot.

    :param integer entityindex: Entityindex of the entity
    :returns: Entity is a bot
    :return type: boolean

.. js:function:: IsLocalPlayer(entityindex)

    Returns if the entityindex matches yourself.

    :param integer entityindex: Entityindex of the entity
    :returns: Entity is yourself
    :return type: boolean

.. js:function:: IsValid(entityindex)

    Returns if the entityindex is valid.

    :param integer entityindex: Entityindex of the entity
    :returns: Entity is valid
    :return type: boolean

.. js:function:: IsAlive(entityindex)

    Returns if the entity is alive.

    :param integer entityindex: Entityindex of the entity
    :returns: Entity is alive
    :return type: boolean

.. js:function:: IsDormant(entityindex)

    Returns if the entity is dormant.

    :param integer entityindex: Entityindex of the entity
    :returns: Entity is dormant
    :return type: boolean

.. js:function:: GetClassID(entity)

    Returns the class id of the class the entity belongs to.

    :param Entity entity: Entity to inform about
    :returns: Class id of the entity
    :return type: integer

.. js:function:: GetClassName(entity)

    Returns the class name of the entity.

    :param Entity entity: Entity to inform about
    :returns: Class name of the entity
    :return type: string

.. js:function:: GetName(entityindex)

    Returns the name of the class the entity belongs to.

    :param integer entityindex: Entityindex of the entity
    :returns: Name of the entity
    :return type: string

.. js:function:: GetWeapon(entityindex)

    Returns the current helt weapon entity.

    :param integer entityindex: Entityindex of the entity
    :returns: Helt weapon
    :return type: Entity

.. js:function:: GetWeapons(entityindex)

    Returns all weapons the entity has.

    :param integer entityindex: Entityindex of the entity
    :returns: All weapons from the entity
    :return type: Entity

.. js:function:: GetRenderOrigin(entityindex)

    Returns position of the entity.

    :param integer entityindex: Entityindex of the entity
    :returns: Position of the entity
    :return type: Vector3

.. js:function:: GetRenderBox(entityindex)

    Returns the render box of the entity.

    :param integer entityindex: Entityindex of the entity
    :returns: An array comprising of: valid/invalid (boolean), min X, min Y, max X, max Y
    :return type: Array

.. js:function:: GetProp(entityindex, table, propname)

    Returns the value of the prop of the entity.
    `classname` must be the name of the entity's class, e.g. `CCSPlayer` for players.

    :param integer entityindex: Entityindex of the entity
    :param string table: Name of entity's class
    :param string propname: Name of the prop
    :returns: The value
    :return type: Any

.. js:function:: SetProp(entityindex, classname, propname, value)

    Sets the value of the prop of the entity.
    `classname` must be the name of the entity's class, e.g. `CCSPlayer` for players.

    :param integer entityindex: Entityindex of the entity
    :param string classname: Name of entity's class
    :param string propname: Name of the prop
    :param Any value: The value

.. js:function:: GetHitboxPosition(entityindex, hitboxindex)

    Returns position of the hitbox.

    :param integer entityindex: Entityindex of the entity
    :param integer hitgroup: Hitboxindex of the hitbox
    :returns: Position of the hitbox
    :return type: Vector3

.. js:function:: GetEyePosition(entityindex)

    Returns position of the eye hitbox.

    :param integer entityindex: Entityindex of the entity
    :returns: Position of the eye hitbox
    :return type: Vector3


Trace
-----

.. js:module:: Trace

.. js:function:: Line(?)

    .. warning:: Undocumented function.

.. js:function:: Bullet(?)

    .. warning:: Undocumented function.


UserCMD
-------

.. js:module:: UserCMD

.. note::
    Can only be used during a :js:func:`CreateMove` callback.

.. js:function:: SetMovement(movement)

    Sets the movement for the current move command.

    :param Vector3 movement: The new movement

.. js:function:: GetMovement()

    Returns the planned movement for the current move command.
    
    :returns: The movement
    :return type: Vector3

.. js:function:: SetAngles(angles)

    Sets the viewangles for the current move command.

    :param Vector3 angles: The angles

    .. note:: You can use :js:func:`Local.GetViewAngles` to get them.

.. js:function:: ForceJump(value)

    Forces the command to jump/not jump.

    :param boolean value: Whether to force jump or not

.. js:function:: ForceCrouch(value)

    Forces the command to crouch/not crouch.

    :param boolean value: Whether to force crouch or not


AntiAim
-------

.. js:module:: AntiAim

.. js:function:: GetOverride()

    Returns 1 if the antiaim is being managed by a script, 0 otherwise.

    :returns: If antiaim is mangaged by a script
    :return type: integer

.. js:function:: SetOverride(state)

    Enable/disable mangagment of the antiaim.

    :param boolean state: 1 to enable, 0 to disable

    .. note:: Booleans (true/false) are not supported!

.. js:function:: SetRealOffset(degree)

    Sets the real offset.

    :param integer degree: Real offset from yaw.

    .. note:: :js:func:`AntiAim.GetOverride` must return `1` before this affects anything.

.. js:function:: SetFakeOffset(degree)

    Offsets yaw offset by degree.

    :param integer degree: Offsets yaw.

    .. note:: :js:func:`AntiAim.GetOverride` must return `1` before this affects anything.

.. js:function:: SetLBYOffset(degree)

    Sets the fake offset.

    :param integer degree: Fake offset from yaw.

    .. note:: :js:func:`AntiAim.GetOverride` must return `1` before this affects anything.


Exploit
-------

.. js:module:: Exploit

.. js:function:: GetCharge()

    Returns the current doubletap charge percentage and `-1` when disabled.

    :returns: Doubletap charge in percent
    :return type: float

.. js:function:: Recharge()

    Forces the ragebot to recharge the doubletap asap.

.. js:function:: DisableRecharge()

    Disables automatic recharge.

.. js:function:: EnableRecharge(?)

    Re-enables automatic recharge.


Ragebot
-------

.. js:module:: Ragebot

.. js:function:: GetTarget()

    Returns the entity targetted by the ragebot.

    :returns: Current Ragebot target
    :return type: Entity

    .. note:: Can only be used during a :js:func:`ragebot_fire` callback.

.. js:function:: IgnoreTarget(?)

    .. warning:: Undocumented function.

.. js:function:: ForceTarget(entity)

    Forces the ragebot to shoot at the entity whenever possible.

    :param Entity entity: Entity to force

.. js:function:: ForceTargetSafety(?)

    .. warning:: Undocumented function.

.. js:function:: ForceTargetHitchance(entity, hitchance)

    Forces a minimum hitchance for entity.

    :param Entity entity: Entity to force
    :param integer hitchance: Hitchance to force

.. js:function:: ForceTargetMinimumDamage(entity, damage)

    Forces the minimum damage for entity.

    :param Entity entity: Entity to force
    :param integer minimumdamage: Damage to force

.. js:function:: ForceHitboxSafety(?)

    .. warning:: Undocumented function.


Material
--------

.. js:module:: Material

.. js:function:: Create(?)

    .. warning:: Undocumented function.

.. js:function:: Destroy(?)

    .. warning:: Undocumented function.

.. js:function:: Get(?)

    .. warning:: Undocumented function.

.. js:function:: SetKeyValue(?)

    .. warning:: Undocumented function.

.. js:function:: Refresh(?)

    .. warning:: Undocumented function.
