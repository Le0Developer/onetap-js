Onetap v3 Re:Run Javascript globals
====================================

.. js:data:: __filename

    Filename of the running script.

    :type: string


Classes
--------

.. js:class:: Reference(...path)

    :param string ...path: Path to the javascript element

.. js:attribute:: Reference.path

    :type: Array[string]

.. js:method:: Reference.GetValue()

    Returns the value of this UI element.

    Example:

    .. code:: js

        FAKELAG_ENABLED = new Reference("Anti-Aim", "Fake-Lag", "Enabled")
        FAKELAG_LIMIT = new Reference("Anti-Aim", "Fake-Lag", "Limit")
        function GetFakelag() {
            if(!FAKELAG_ENABLED.GetValue())
                return 0; // fakelag disabled
            return FAKELAG_LIMIT.GetValue();
        }

    :returns: The value of the element
    :return type: Any

.. js:method:: Reference.SetValue(value)

    Sets the value of this UI element.

    Example:

    .. code:: js

        FAKELAG_ENABLED = new Reference("Anti-Aim", "Fake-Lag", "Enabled")
        function disableFakelag() {
            FAKELAG_ENABLED.SetValue(false);
        }
    
    :param string ...path: Path of the element
    :param Any value: New value

.. js:method:: Reference.SetEnabled(value)

    Enables/disables this element.

    :param boolean value: Whether to enable or disable

.. js:method:: Reference.GetString()

    Returns the value of this textbox element.

    :returns: The value of the element
    :return type: string

.. js:method:: Reference.GetColor()

    Returns the value of this colorpicker element.

    :returns: The value of the element
    :return type: :js:class:`RGBA`

.. js:method:: Reference.SetColor(value)

    Sets the value of the colorpicker element at the specified path to the color.
    
    :param string ...path: Path of the element
    :param color: New color
    :type color: :js:class:`RGBA`

.. js:method:: Reference.IsHotKeyActive()

    Returns if the hotkey of this element is being held/pressed.

    :returns: If the hotkey is being held/pressed
    :return type: boolean

.. js:method:: Reference.ToggleHotkey()

    Simulates pressing the hotkey for this element.

    :returns: New state of the hotkey, 1 is active, 0 means inactive
    :return type: integer


.. js:class:: Entity(entityindex)

    :param integer entityindex: Entityindex of the entity

.. js:attribute:: Entity.entityindex

    :type: integer

.. js:method:: Entity.IsTeammate()

    Returns if this entity is a teammate.

    :returns: Entity is a teammate
    :return type: boolean

.. js:method:: Entity.IsEnemy()

    Returns if this entity is an enemy.

    :returns: Entity is an enemy
    :return type: boolean

.. js:method:: Entity.IsBot()

    Returns if this entity is a bot.

    :returns: Entity is a bot
    :return type: boolean

.. js:method:: Entity.IsLocalPlayer()

    Returns if this entity matches yourself.

    :returns: Entity is yourself
    :return type: boolean

.. js:method:: Entity.IsValid()

    Returns if this entity is valid.

    :returns: Entity is valid
    :return type: boolean

.. js:method:: Entity.IsAlive()

    Returns if this entity is alive.

    :returns: Entity is alive
    :return type: boolean

.. js:method:: Entity.IsDormant()

    Returns if this entity is dormant.

    :returns: Entity is dormant
    :return type: boolean

.. js:method:: Entity.GetClassID()

    Returns the class id of the class this entity belongs to.

    :returns: Class id of the entity
    :return type: integer

.. js:method:: Entity.GetClassName()

    Returns the name of the class this entity belongs to.

    :returns: Class name of the entity
    :return type: string

.. js:method:: Entity.GetName()

    Returns the name of this entity.

    :returns: Name of the entity
    :return type: string

.. js:method:: Entity.GetWeapon()

    Returns the current held weapon entity.

    :returns: Held weapon
    :return type: :js:class:`Entity`

.. js:method:: Entity.GetWeapons()

    Returns all weapons this entity has.

    :returns: All weapons of this entity
    :return type: Array[:js:class:`Entity`]

.. js:method:: Entity.GetRenderOrigin()

    Returns position of this entity.

    :returns: Position of this entity
    :return type: Vector3

.. js:method:: Entity.GetRenderBox()

    Returns the render box of this entity.

    :returns: An array comprising of: valid/invalid (boolean), min X, min Y, max X, max Y
    :return type: Array


.. js:method:: Entity.GetProp(table, propname)

    Returns the value of the prop of this entity.
    `table` is most of the time the name of the entity's class, e.g. `CCSPlayer` for players.

    :param string table: Name of entity's class
    :param string propname: Name of the prop
    :returns: The value
    :return type: Any

.. js:method:: Entity.SetProp(table, propname, value)

    Sets the value of the prop of this entity.
    `table` is most of the time the name of the entity's class, e.g. `CCSPlayer` for players.

    :param string table: Name of entity's class
    :param string propname: Name of the prop
    :param Any value: The value

.. js:method:: Entity.GetHitboxPositions(hitboxindex)

    Returns position of the hitbox.

    :param integer hitgroup: Hitboxindex of the hitbox
    :returns: Position of the hitbox
    :return type: :js:class:`Vector3`

.. js:method:: Entity.GetEyePosition()

    Returns position of the eye hitbox.

    :returns: Position of the eye hitbox
    :return type: :js:class:`Vector3`


.. js:class:: Material(material)

    :param string material: Name of the material


.. js:attribute:: Material.name

    Name of the material

    :type: string

.. js:method:: Material.SetKeyValue(key, value)

    Overrides values.

    .. note::
        See also:

            - https://developer.valvesoftware.com/wiki/Category:List_of_Shader_Parameters
            - https://developer.valvesoftware.com/wiki/VertexLitGeneric

    .. note::
        Can only be used during a :js:func:`Material` callback.

    :param string key: Key
    :param string value: value

.. js:method:: Material.Refresh()

    Refreshes the material with the new values from :js:meth:`Material.SetKeyValue`.

    .. note::
        Can only be used during a :js:func:`Material` callback.


.. js:class:: Vector2(x, y)

    A 2d vector

    :param number x: x position
    :param number y: y position

.. js:method:: Vector2.pack()

.. js:function:: Vector2.unpack(array)


.. js:class:: Vector3(x, y, z)

    A 3d vector

    :param number x: x position
    :param number y: y position
    :param number z: z position

.. js:method:: Vector3.pack()

.. js:function:: Vector3.unpack(array)


.. js:class:: Angles(pitch, yaw, roll)

    An angle.

    :param number pitch: pitch
    :param number yaw: yaw
    :param number roll: roll

.. js:method:: Angles.pack()

.. js:function:: Angles.unpack(array)


.. js:class:: RGBA(r, g, b, a)

    A RGBA color.

    :param integer r: red channel
    :param integer g: green channel
    :param integer b: blue channel
    :param integer a: alpha (transparency)

.. js:method:: RGBA.pack()

.. js:function:: RGBA.unpack(array)


Globals
--------

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
------

.. js:module:: Sound

.. js:function:: Play(filename)

    Plays a sound from a `.wav` file.

    :param string filename: Filename of the sound

.. js:function:: PlayMicrophone(filename)

    Plays a sound from a `.wav` file over your microphone.

    :param string filename: Fileanme of the sound

.. js:function:: StopMicrophone()

    Interrupt the playing sound from :js:func:`Sound.PlayMicrophone`.


Cheat
------

.. js:module:: Cheat

.. js:function:: GetUsername()

    Returns the onetap username, but in OTCv3 this is replaced by the steam name on injection.

    :returns: Onetap username or steam name
    :return type: string

.. js:function:: RegisterCallback(callback, function)

    Registers a callback, valid callbacks can be found `here <callbacks.html>`_.

    Example:

    .. code:: js

        Global.RegisterCallback("CreateMove", function() {
            // gets called every tick
        });


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

    You can use special bytes to change the color.

    +---------+-----------------+-+---------+-----------------+-+---------+-----------------+-+---------+-----------------+
    |  Byte   |  Color          | |  Byte   |  Color          | |  Byte   |  Color          | |  Byte   |  Color          |
    +=========+=================+=+=========+=================+=+=========+=================+=+=========+=================+
    |  \\x01  |  White          | |  \\x05  |  Lighter green  | |  \\x09  |  Gold           | |  \\x0D  |  Dark purple    |
    +---------+-----------------+-+---------+-----------------+-+---------+-----------------+-+---------+-----------------+
    |  \\x02  |  Dark red       | |  \\x06  |  Light green    | |  \\x0A  |  Gray           | |  \\x0E  |  Light purple   |
    +---------+-----------------+-+---------+-----------------+-+---------+-----------------+-+---------+-----------------+
    |  \\x03  |  Purple         | |  \\x07  |  Red            | |  \\x0B  |  Aqua           | |  \\x0F  |  Light red      |
    +---------+-----------------+-+---------+-----------------+-+---------+-----------------+-+---------+-----------------+
    |  \\x04  |  Green          | |  \\x08  |  Gray           | |  \\x0C  |  Blue           | |  \\xA0  |  N/A            |
    +---------+-----------------+-+---------+-----------------+-+---------+-----------------+-+---------+-----------------+

    :param string text: The text to print into the chat.

    .. note::
        The text is clientside, so only you can see the text.

.. js:function:: PrintColor(color, text)

    Prints colored text into the CS:GO console.

    :param color: The color for the text
    :type color: :js:class:`RGBA`
    :param string text: The text to print into the console.


Local
------

.. js:module:: Local

.. js:function:: Latency()

    Returns your latency to the server.

    :returns: Latency in seconds.
    :return type: float

.. js:function:: GetViewAngles()

    Returns the current viewangles of yourself.

    Example:

    .. code:: js

        Global.RegisterCallback("Draw", function() {
            const angles = Global.GetViewAngles();
            Render.String(5, 5, 0, "Angles: pitch=" + angles.pitch + " yaw=" + angles.yaw + " roll=" + angles.roll, [255, 0, 0, 255]);
        });

    :returns: Current viewangles
    :return type: :js:class:`Angles`

.. js:function:: SetViewAngles(angles)

    Sets the current viewangles of yourself.

    :param angles: New viewangles.
    :type angles: :js:class:`Angles`

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
------

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
------

.. js:module:: Input

.. js:function:: GetCursorPosition()

    Returns the current position of the cursor.

    :returns: Cursorposition
    :return type: :js:class:`Vector2`

.. js:function:: IsKeyPressed(key)

    Returns if the key is currently pressed.

    :param integer key: `Virtual Key Codes <https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes>`_
    :returns: If the key is is pressed
    :return type: boolean


Render
-------

.. js:module:: Render

.. note::
    Can only be used during a :js:func:`Draw` callback.

.. js:function:: String(x, y, align, text, color[, size])

    Renders the string `text` at x|y.
    Align 0 is left-aligned and everything else is centered.

    :param string text: Text to write
    :param integer x: x position
    :param integer y: y position
    :param color: Color
    :type color: :js:class:`RGBA`
    :param integer size: Size of the text

.. js:function:: TextSize(text[, size])

    Returns the size of the text.

    :param string text: Text to measure
    :param integer size: Size of the text
    :returns: Size the text would take
    :return type: :js:class:`Vector2`

.. js:function:: Line(x1, y1, x2, y2, color)

    Renders a line from x1|y1 to x2|y2.

    :param integer x1: x position of the start
    :param integer y1: y position of the start
    :param integer x2: x position of the end
    :param integer y2: y position of the end
    :param color: Color
    :type color: :js:class:`RGBA`

.. js:function:: Rect(x, y, width, height, color)

    Renders a rectangle from x|y with the width `width` and height `height`.

    :param integer x: x position
    :param integer y: y position
    :param integer width: width
    :param integer height: height
    :param color: Color
    :type color: :js:class:`RGBA`

.. js:function:: FilledRect(x, y, width, height, color)

    Renders a rectangle from x|y with the width `width` and height `height` filled with `color`.

    :param integer x: x position
    :param integer y: y position
    :param integer width: width
    :param integer height: height
    :param color: Color
    :type color: :js:class:`RGBA`

.. js:function:: GradientRect(x, y, width, height, color1, color2)

    Renders a rectangle from x|y with the width `width`.

    :param integer x: x position
    :param integer y: y position
    :param integer width: width
    :param integer height: height
    :param color1: First color
    :type color1: :js:class:`RGBA`
    :param color2: Second color
    :type color2: :js:class:`RGBA`

.. js:function:: Circle(x, y, r, color)

    Renders a circle at x|y.

    :param integer x: x position
    :param integer y: y position
    :param integer r: radius of the circle
    :param color: Color
    :type color: :js:class:`RGBA`

.. js:function:: Polygon(points, color)

    Renders a polygon/triangle, the 3 corners are in `points`.

    Example:

    .. code:: js

        Cheat.RegisterCallback("Draw", function() {
            Render.Polygon([[50, 0], [25, 50], [75, 50]], [255, 0, 0, 255]);
        });

    :param points: The 3 corners
    :type points: Array[:js:class:`Vector2`]
    :param color: Color
    :type color: :js:class:`RGBA`

.. js:function:: WorldToScreen(position)

    Returns screen position from world position.

    :param position: Position in the world
    :type position: :js:class:`Vector3`
    :returns: Position on screen
    :return type: :js:class:`Vector2`

.. js:function:: AddFont(name, size, weight)

    Returns font object.

    :param string name: Name of the font
    :param integer size: Font size
    :param integer weight: Font weight
    :returns: Font object
    :return type: Any

.. js:function:: FindFont(name, size, weight)

    Returns font object.

    :param string name: Name of the font
    :param integer size: Font size
    :param integer weight: Font weight
    :returns: Font object
    :return type: Any

.. js:function:: StringCustom(x, y, align, text, color, font)

    Renders the string `text` at x|y with a custom font.

    :param integer x: x position
    :param integer y: y position
    :param integer align: How to align the text
    :param string text: Text to write
    :param color: Color
    :type color: :js:class:`RGBA`
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
    :return type: :js:class:`Vector2`

.. js:function:: GetScreenSize()

    Returns the size of the screen.

    :returns: Screensize
    :return type: :js:class:`Vector2`

UI
---

.. js:module:: UI

.. js:function:: AddCheckbox(name)

    Adds a checkbox element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the checkbox
    :returns: A Reference to the element
    :return type: :js:class:`Reference`

.. js:function:: AddSliderInt(name[, min[, max])

    Adds a slider element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the slider
    :param integer min: Minimal value
    :param integer max: Maximal value
    :returns: A Reference to the element
    :return type: :js:class:`Reference`

.. js:function:: AddSliderFloat(name[, min[, max])

    Adds a slider element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the slider
    :param float min: Minimal value
    :param float max: Maximal value
    :returns: A Reference to the element
    :return type: :js:class:`Reference`


.. js:function:: AddHotkey(name)

    Adds a hotkey element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the hotkey

.. js:function:: AddLabel(text)

    Adds a label element to "Misc", "JAVASCRIPT", "Script Items".

    :param string text: The text to add
    :returns: A Reference to the element
    :return type: :js:class:`Reference`

.. js:function:: AddDropdown(name, options)

    Adds a dropdown element to "Misc", "JAVASCRIPT", "Script Items".

    Example:

    .. code:: js

        reference = UI.AddDropdown("sample dropdown", ["option 1", "option 2"])
        reference.GetValue() == 0 // selected by default

    :param string name: Name of the dropdown
    :param options: Array of options
    :type options: Array[options]
    :returns: A Reference to the element
    :return type: :js:class:`Reference`

.. js:function:: AddMultiDropdown(name, options)

    Adds a multidropdown element to "Misc", "JAVASCRIPT", "Script Items".

    Example:

    .. code:: js

        reference = UI.AddMultiDropdown("sample dropdown", ["option 1", "option 2"])
        reference.GetValue() == [] // empty list because nothing is selected

    :param string name: Name of the multidropdown
    :param options: Array of options
    :type options: Array[options]

.. js:function:: AddColorPicker(name)

    Adds a colorpicker element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the colorpicker

.. js:function:: AddTextbox(name)

    Adds a textbox element to "Misc", "JAVASCRIPT", "Script Items".

    :param string name: Name of the textbox

.. js:function:: IsMenuOpen()

    Returns if the menu is opened.

    :returns: If the menu is opened
    :return type: boolean


Convar
-------

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
------

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


Entities
---------

.. js:module:: Entities

.. js:function:: GetEntities()

    Returns all entities.

    :returns: All entities
    :return type: Array[:js:class:`Entity`]

.. js:function:: GetEntitiesByClassID(classid)

    Returns all entities with a matching class id.

    :param integer classid: classid
    :returns: All matching entities
    :return type: :js:class:`Entity`

.. js:function:: GetPlayers()

    Returns all players.

    :returns: All players
    :return type: Array[:js:class:`Entity`]

.. js:function:: GetEnemies()

    Returns all players in the enemy team.

    :returns: All enemies
    :return type: Array[:js:class:`Entity`]

.. js:function:: GetTeammates()

    Returns all players your team.

    :returns: All teammates
    :return type: Array[:js:class:`Entity`]

.. js:function:: GetLocalPlayer()

    Returns the index of yourself.

    :returns: Yourself
    :return type: integer

.. js:function:: GetGameRulesProxy()

    Returns the game rules entity
    
    :returns: Entity of the game rules
    :return type: :js:class:`Entity`

.. js:function:: GetEntityFromUserID(userid)

    Returns the player with the userid.

    :param string userid: Userid of the player to find
    :returns: Entity matching the userid
    :return type: :js:class:`Entity`


Trace
------

.. js:module:: Trace

.. js:function:: Line(entityindex, start, end)

    Traces a line between start and end

    :param integer entityindex: Entityindex of the entity
    :param start: Start of the trace
    :type start: :js:class:`Vector3`
    :param end: End of the trace
    :type end: :js:class:`Vector3`
    :returns: What it hit
    :return type: Array[target, fraction]

.. js:function:: Bullet(?)

    .. warning:: Undocumented function.


UserCMD
--------

.. js:module:: UserCMD

.. note::
    Can only be used during a :js:func:`CreateMove` callback.

.. js:function:: SetMovement(movement)

    Sets the movement for the current move command.

    :param movement: The new movement
    :type movement: :js:class:`Vector3`

.. js:function:: GetMovement()

    Returns the planned movement for the current move command.
    
    :returns: The movement
    :return type: :js:class:`Vector3`

.. js:function:: SetAngles(angles)

    Sets the viewangles for the current move command.

    :param angles: The angles
    :type angles: :js:class:`Angles`

    .. note:: You can use :js:func:`Local.GetViewAngles` to get them.

.. js:function:: ForceJump(value)

    Forces the command to jump/not jump.

    :param boolean value: Whether to force jump or not

.. js:function:: ForceCrouch(value)

    Forces the command to crouch/not crouch.

    :param boolean value: Whether to force crouch or not


AntiAim
--------

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
--------

.. js:module:: Exploit

.. js:function:: GetCharge()

    Returns the current doubletap charge percentage and `-1` when disabled.

    :returns: Doubletap charge in percent
    :return type: float

.. js:function:: Recharge()

    Forces the ragebot to recharge the doubletap asap.

.. js:function:: DisableRecharge()

    Disables automatic recharge.

.. js:function:: EnableRecharge()

    Re-enables automatic recharge.


Ragebot
--------

.. js:module:: Ragebot

.. js:function:: GetTarget()

    Returns the entity targetted by the ragebot.

    :returns: Entityindex of ragebot target
    :return type: integer

.. js:function:: IgnoreTarget(entityindex)

    Ignores the entity matching entityindex.

    .. note::
        Only active for one tick and must be called in a :js:func:`CreateMove` callback.

    :param integer entityindex: Entityindex of the entity

.. js:function:: ForceTarget(entityindex)

    Forces the ragebot to shoot at the entity whenever possible.

    .. note::
        Only active for one tick and must be called in a :js:func:`CreateMove` callback.
        
    :param integer entityindex: Entityindex of the entity

.. js:function:: ForceTargetSafety(entityindex)

    Forces safety on a specific entity. (safepoint)

    .. note::
        Only active for one tick and must be called in a :js:func:`CreateMove` callback.
    
    :param integer entityindex: Entityindex of the entity

.. js:function:: ForceTargetHitchance(entityindex, hitchance)

    Forces a minimum hitchance for entity.

    .. note::
        Only active for one tick and must be called in a :js:func:`CreateMove` callback.

    :param integer entityindex: Entityindex of the entity
    :param integer hitchance: Hitchance to force

.. js:function:: ForceTargetMinimumDamage(entityindex, minimum_damage)

    Forces the minimum damage for entity.

    .. note::
        Only active for one tick and must be called in a :js:func:`CreateMove` callback.

    :param integer entityindex: Entityindex of the entity
    :param integer minimum_damage: Damage to force

.. js:function:: ForceHitboxSafety(hitboxindex)

    Forces safety on a specific hitbox. (safepoint)

    .. note::
        Only active for one tick and must be called in a :js:func:`CreateMove` callback.

    :param integer hitboxindex: Hitboxindex of the hitbox


Materials
----------

.. js:module:: Materials

.. js:function:: Create(name)

    Creates a material.

    :param string name: Name of the material
    :returns: If the creation was successful
    :return type: :js:class:`Material`

.. js:function:: Get(name)

    Returns the material index.

    .. note::
        Can only be used during a :js:func:`Material` callback.

    :param string name: Name of the material
    :returns: Materialindex
    :return type: :js:class:`Material`
