return ->
    shallowcopy = (obj) ->
        nobj = {}
        nobj[name] = value for name, value of obj
        nobj

    globalthis = this
    realglobals = shallowcopy globalthis

    packer = (value) -> if value.pack? then value.pack() else value

    # Material Stuff
    Material = (name) ->
        @name = name
        return

    Material::_get = ->
        realglobals.Material.Get @name
    Material::SetKeyValue = (key, value) ->
        realglobals.Material.SetKeyValue @_get(), key, value
    Material::Refresh = ->
        realglobals.Material.Refresh @_get()

    Material::Destroy = ->
        realglobals.Material.Destroy @name

    # Reference
    Reference = (pathA, pathB, pathC, pathD) ->
        @path = [pathA, pathB, pathC, pathD]
        return

    Reference::GetValue = ->
        realglobals.UI.GetValue @path[0], @path[1], @path[2], @path[3]
    Reference::GetString = ->
        realglobals.UI.GetString @path[0], @path[1], @path[2], @path[3]
    Reference::GetColor = ->
        RGBA.unpack realglobals.UI.GetColor @path[0], @path[1], @path[2], @path[3]

    Reference::SetValue = (value) ->
        realglobals.UI.SetValue @path[0], @path[1], @path[2], @path[3], value
    Reference::SetEnabled = (value) ->
        realglobals.UI.SetEnabled @path[0], @path[1], @path[2], @path[3], value
    Reference::SetColor = (rgba) ->
        realglobals.UI.SetColor @path[0], @path[1], @path[2], @path[3], packer rgba

    Reference::IsHotkeyActive = ->
        realglobals.UI.IsHotkeyActive @path[0], @path[1], @path[2], @path[3]
    Reference::ToggleHotkey = ->
        realglobals.UI.ToggleHotkey @path[0], @path[1], @path[2], @path[3]

    uielement_wrapper = (func) ->
        (name, arg1, arg2, arg3) ->
            func name, arg1, arg2, arg3
            new Reference "Misc", "JAVASCRIPT", "Script Items", name

    # Entity stuff

    Entity = (entityindex) -> 
        @entityindex = entityindex 
        return

    Entity::IsTeammate = -> realglobals.Entity.IsTeammate @entityindex
    Entity::IsEnemy = -> realglobals.Entity.IsEnemy @entityindex
    Entity::IsBot = -> realglobals.Entity.IsBot @entityindex
    Entity::IsLocalPlayer = -> realglobals.Entity.IsLocalPlayer @entityindex
    Entity::IsValid = -> realglobals.Entity.IsValid @entityindex
    Entity::IsAlive = -> realglobals.Entity.IsAlive @entityindex
    Entity::IsDormant = -> realglobals.Entity.IsDormant @entityindex

    Entity::GetClassID = -> realglobals.Entity.GetClassID @entityindex
    Entity::GetClassName = -> realglobals.Entity.GetClassName @entityindex
    Entity::GetName = -> realglobals.Entity.GetName @entityindex
    Entity::GetWeapon = -> new Entity realglobals.Entity.GetWeapon @entityindex
    Entity::GetWeapons = -> new Entity index for index in realglobals.Entity.GetWeapons @entityindex
    Entity::GetRenderOrigin = -> Vector3.unpack realglobals.Entity.GetRenderOrigin @entityindex

    Entity::GetRenderBox = -> 
        array = realglobals.Entity.GetRenderBox @entityindex
        [array[0], Vector2.unpack(array[1]), Vector2.unpack array[2]]

    Entity::GetProp = (classname, table, propname) -> realglobals.Entity.GetProp @entityindex, classname, table, propname
    Entity::SetProp = (classname, table, propname, value) -> realglobals.Entity.SetProp @entityindex, classname, table, propname, value
    Entity::GetHitboxPositions = (hitboxindex) -> Vector3.unpack realglobals.Entity.GetHitboxPosition @entityindex, hitboxindex
    Entity::GetEyePosition = -> Vector3.unpack realglobals.Entity.GetEyePosition @entityindex

    # Vectors/Angles

    Vector2 = (x, y) ->
        @x = x
        @y = y
        return

    Vector2::pack = -> [@x, @y]
    Vector2.unpack = (array) -> new Vector2 array[0], array[1]

    Vector3 = (x, y, z) ->
        @x = x
        @y = y
        @z = z
        return

    Vector3::pack = -> [@x, @y, @z]
    Vector3.unpack = (array) -> new Vector3 array[0], array[1], array[2]

    Angles = (pitch, yaw, roll) ->
        @pitch = pitch
        @yaw = yaw
        @roll = roll
        return

    Angles::pack = -> [@pitch, @yaw, @roll]
    Angles.unpack = (array) -> new Angles array[0], array[1], array[2]

    RGBA = (r, g, b, a) ->
        @r = r
        @g = g
        @b = b
        @a = a
        return

    RGBA::pack = -> [@r, @g, @b, @a]
    RGBA.unpack = (array) -> new RGBA array[0], array[1], array[2], array[3]

    globals =
        __reality: globalthis
        __filename: realglobals.__filename

        Reference: Reference
        Entity: Entity

        Vector2: Vector2
        Vector3: Vector3
        Angles: Angles
        RGBA: RGBA

        Globals: shallowcopy realglobals.Globals
        Sound: shallowcopy realglobals.Sound
        Cheat: shallowcopy realglobals.Cheat
        Local: shallowcopy realglobals.Local
        World: shallowcopy realglobals.World
        Input:
            GetCursorPosition: -> Vector2.unpack realglobals.Input.GetCursorPosition
            IsKeyPressed: realglobals.Input.IsKeyPressed
        Render:
            String: (x, y, align, text, color, size) ->
                if size?  # onetap doesn't like undefined as size
                    realglobals.Render.String x, y, align, text, packer(color), size
                else
                    realglobals.Render.String x, y, align, text, packer(color)
            TextSize: (text, size) -> Vector2.unpack realglobals.Render.TextSize text, size
            Line: (x1, y1, x2, y2, color) -> realglobals.Render.Line x1, y1, x2, y2, packer color
            Rect: (x, y, width, height, color) -> realglobals.Render.Rect x, y, width, height, packer color
            FilledRect: (x, y, width, height, color) -> realglobals.Render.FilledRect x, y, width, height, packer color
            GradientRect: (x, y, width, height, color1, color2) -> realglobals.Render.FilledRect x, y, width, height, packer(color1), packer color2
            Circle: (x, y, r, color) -> realglobals.Render.Circle x, y, r, packer color
            Polygon: (points, color) -> realglobals.Render.Polygon points, packer color
            WorldToScreen: (position) -> Vector2.unpack realglobals.Render.WorldToScreen packer position
            AddFont: realglobals.Render.AddFont
            FindFont: realglobals.Render.FindFont
            StringCustom: (x, y, align, text, color, font) -> realglobals.Render.StringCustom x, y, align, text, packer(color), font
            TexturedRect: realglobals.Render.TexturedRect
            AddTexture: realglobals.Render.AddTexture
            TextSizeCustom: realglobals.Render.TextSizeCustom
            GetScreenSize: -> Vector2.unpack realglobals.Render.GetScreenSize()
        UI:
            Reference: (pathA, pathB, pathC, pathD) ->
                new Reference pathA, pathB, pathC, pathD
            IsMenuOpen: realglobals.UI.IsMenuOpen
            AddCheckbox: uielement_wrapper realglobals.UI.AddCheckbox
            AddSliderInt: uielement_wrapper realglobals.UI.AddSliderInt
            AddSliderFloat: uielement_wrapper realglobals.UI.AddSliderFloat
            AddHotkey: uielement_wrapper realglobals.UI.AddHotkey
            AddLabel: uielement_wrapper realglobals.UI.AddLabel
            AddDropdown: uielement_wrapper realglobals.UI.AddDropdown
            AddMultiDropdown: uielement_wrapper realglobals.UI.AddMultiDropdown
            AddColorPicker: uielement_wrapper realglobals.UI.AddColorPicker
            AddTextbox: uielement_wrapper realglobals.UI.AddTextbox
        Convar: shallowcopy realglobals.Convar
        Event: shallowcopy realglobals.Event
        Entities:
            GetEntities: -> new Entity index for index in realglobals.Entity.GetEntities()
            GetEntitiesByClassID: (classid) -> new Entity index for index in realglobals.Entity.GetEntitiesByClassID classid
            GetPlayers: -> new Entity index for index in realglobals.Entity.GetPlayers()
            GetEnemies: -> new Entity index for index in realglobals.Entity.GetEnemies()
            GetTeammates: -> new Entity index for index in realglobals.Entity.GetTeammates()
            GetLocalPlayer: -> new Entity realglobals.Entity.GetLocalPlayer()
            GetGameRulesProxy: -> new Entity realglobals.Entity.GetGameRulesProxy()
            GetEntityFromUserID: (userid) -> new Entity realglobals.Entity.GetEntityFromUserID userid
        Trace: 
            Line: (entity, start, end) ->
                array = realglobals.Trace.Line entity.entityindex, start, end
                [new Entity(array[0]), array[1]]
            Bullet: realglobals.Trace.Bullet
        UserCMD: shallowcopy realglobals.UserCMD
        AntiAim: shallowcopy realglobals.AntiAim
        Exploit: shallowcopy realglobals.Exploit
        Ragebot:
            GetTarget: -> new Entity realglobals.Ragebot.GetTarget()
            IgnoreTarget: (ent) -> realglobals.Ragebot.IgnoreTarget ent.entityindex
            ForceTarget: (ent) -> realglobals.Ragebot.ForceTarget ent.entityindex
            ForceTargetSafety: (ent) -> realglobals.Ragebot.ForceTargetSafety ent.entityindex
            ForceTargetHitchance: (ent, hitchance) -> realglobals.Ragebot.ForceTargetHitchance ent.entityindex, hitchance
            ForceTargetMinimumDamage: (ent, minimum_damage) -> realglobals.Ragebot.ForceTargetMinimumDamage ent.entityindex, minimum_damage
            ForceHitboxSafety: realglobals.Globals.ForceHitboxSafety
        Materials:
            Create: (name) ->
                return false unless realglobals.Material.Create name
                new Material name
            Get: (name) -> new Material name

    globals.Cheat.PrintColor = (rgba, text) ->
        realglobals.Cheat.PrintColor packer(rgba), text
    globals.Cheat._callbacks = []
    globals.Cheat.RegisterCallback = (name, func) ->
        # This required hacking because onetap calls callback with a weird scope
        full_callback = "(function() { try { Cheat._callbacks[" + this._callbacks.length + "]() } catch (error) { Cheat.Print('[Onetap Re:Run] Error occured in " + name + " callback: \\n' + error.stack + '\\n') }})"
        this._callbacks.push func
        callback_wrapper_func = eval full_callback
        globalthis._callback_temp = callback_wrapper_func
        realglobals.Cheat.RegisterCallback name, "_callback_temp"
        globalthis._callback_temp = undefined

    globals.Local.GetViewAngles = ->
        Angles.unpack realglobals.Local.GetViewAngles()
    globals.Local.SetViewAngles = (angles) ->
        realglobals.Local.SetViewAngles packer angles

    globals.UserCMD.SetMovement = (movement) ->
        realglobals.UserCMD.SetMovement packer movement
    globals.UserCMD.GetMovement = ->
        Vector3.unpack realglobals.UserCMD.GetMovement
    globals.UserCMD.SetAngles = (angles) ->
        realglobals.UserCMD.SetAngles packer angles

    # overwrite globals now
    for name, value of this
        this[name] = undefined
    for name, value of globals
        this[name] = value

