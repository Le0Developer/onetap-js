- performance:
  - now() -> float
      No description.

- Global:
  - Print(text: str)  
      Prints text into the cs:go console. Does not include a newline (\n)

  - PrintChat(text: str)  
      Prints text into the cs:go chat (only visible to you).
      Colors are supported by using `\xCODE`, where code can be everything between 01 and 0F.  
      Examples:
        ```js
        Global.PrintChat("\x02RED \x01WHITE");
        ```

  - PrintColor(text: str)  
      Prints text into the cs:go console. Does not include a newline (\n)
      Colors are supported by using `\xCODE`, where code can be everything between 01 and 0F.  
      Examples:
        ```js
        Global.PrintColor("\x02RED \x01WHITE");
        ```

  - RegisterCallback(callbackname: str, functioname: str)  
      Registers the function with the global name of `functioname` as callback for `callbackname`.

  - ExecuteCommand(command: str)  
      Executes a command in the cs:go console.

  - FrameStage() -> int  
      Returns the current stage of the frame.

      |  Stage  |  Meaning                               |
      | ------- | -------------------------------------- |
      |    0    |  Frame Start                           |
      |    1    |  Frame NetUpdate Start                 |
      |    2    |  Frame NetUpdate PostDataUpdate Start  |
      |    3    |  Frame NetUpdate PostDataUpdate End    |
      |    4    |  Frame NetUpdate End                   |
      |    5    |  Frame Render Start                    |
      |    6    |  Frame Render End                      |

  - Tickcount() -> int  
      Current tick of the server.

  - Tickrate() -> int  
      On how many ticks the server is running per second.
      e.g. 64/128

  - TickInterval() -> float  
      The interval of each tick.
      Equivalent to `1 / Global.Tickrate()`

  - Curtime() -> float  
      Current time of the server.

  - Realtime() -> float  
      Time since the cs:go was started.
      
  - Frametime() -> float  
      Time the last frame took.

  - Latency() -> float  
      Latency to the server in seconds.

  - GetViewAngles() -> Array  
      Returns the current view angle.
      You can use result[0], result[1] and result[2] to access them.

  - SetViewAngles(angles: Array)  
      Sets the current view angle.

  - GetMapName() -> str  
      Get the name of the current map.
      e.g. `de_dust2` or `de_mirage`

  - IsKeyPressed(key: int)  
      Returns if the key is pressed.
      Reference: https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes

  - GetScreenSize() -> Array  
      Returns the size of the screen
      Use result[0] and result[1] to access the size.

  - GetCursorPosition() -> Array  
      Returns the current position of the cursor.
      Use result[0] and result[1] to access the coordinates.

  - PlaySound(filename: str, duration: float, volume: float)  
      Plays a sound from a .wav file, optionally you can set a duration an a value from 0-1.

  - PlayMicrophone(?)  
      No description.

  - StopMicrophone(?)  
      No description.

  - GetUsername() -> str  
      Return the onetap username.
      In OTCv3 this is the current steam account name.

  - SetClanTag(tag: str)  
      Sets the current clantag.

- Globals:  
  - Tickcount(?)  
      No description.

  - Tickrate(?)  
      No description.

  - TickInterval(?)  
      No description.

  - Curtime(?)  
      No description.

  - Realtime(?)  
      No description.

  - Frametime(?)  
      No description.

- Sound:  
  - Play(?)  
      No description.

  - PlayMicrophone(?)  
      No description.

  - StopMicrophone(?)  
      No description.

- Cheat:  
    Another copy of Global.

  - GetUsername() -> str  
      Return the onetap username.
      In OTCv3 this is the current steam account name.

  - RegisterCallback(callbackname: str, functioname: str)  
      Registers the function with the global name of `functioname` as callback for `callbackname`.

  - ExecuteCommand(command: str)  
      Executes a command in the cs:go console.

  - FrameStage(?)  
      No description.

  - Print(text: str)  
      Prints text into the cs:go console. Does not include a newline (\n)

  - PrintChat(text: str)  
      Prints text into the cs:go chat (only visible to you).
      Colors are supported by using `\xCODE`, where code can be everything between 01 and 0F.
      Examples:
        Global.PrintChat("\x02RED \x01WHITE");

  - PrintColor(?)  
      No description.

- Local:  
  - Latency() -> float  
      Latency to the server in seconds.
      Already in Global...

  - GetViewAngles(?)  
      No description.
      Already in Global...

  - SetViewAngles(?)  
      No description.
      Already in Global...

  - SetClanTag(tag: str)  
      Sets the current clantag.
      Already in Global...

  - GetRealYaw(?)  
      No description.

  - GetFakeYaw(?)  
      No description.

  - GetSpread() -> float  
      Returns the spread of the current gun.

  - GetInaccuracy() -> float  
      Returns the inaccuracy of the current gun + other factors such as velocity.

- World:  
  - GetMapName() -> str  
      Get the name of the current map.
      e.g. `de_dust2` or `de_mirage`
      Already in Global...

  - GetServerString() -> str  
      Returns the current server as a string, this is displayed in the watermark.

- Input:  
  - GetCursorPosition() -> object  
      Returns the current position of the cursor.
      Use result[0] and result[1] to access the coordinates.
      Already in Global...

  - IsKeyPressed(?)  
      No description.
      Already in Global...

- Render:  
  - String(x: int, y: int, text: str, color: Sequence[int, int, int, int], size: int)  
      Writes the string `text` at x|y with the color `color`.
      Size can be MEDIUM (0 and 1), SMALL (2), VERY SMALL (3) or BIG (4)

  - TextSize(?)  
      No description.

  - Line(?)  
      No description.

  - Rect(?)  
      No description.

  - FilledRect(?)  
      No description.

  - GradientRect(?)  
      No description.

  - Circle(?)  
      No description.

  - FilledCircle(?)  
      No description.

  - Polygon(?)  
      No description.

  - WorldToScreen(?)  
      No description.

  - AddFont(?)  
      No description.

  - FindFont(?)  
      No description.

  - StringCustom(?)  
      No description.

  - TexturedRect(?)  
      No description.

  - AddTexture(?)  
      No description.

  - TextSizeCustom(?)  
      No description.

  - GetScreenSize() -> object  
      Returns the size of the screen
      Use result[0] and result[1] to access the size.

- UI:  
  - GetValue(?)  
      No description.

  - SetValue(?)  
      No description.

  - AddCheckbox(?)  
      No description.

  - AddSliderInt(?)  
      No description.

  - AddSliderFloat(?)  
      No description.

  - AddHotkey(?)  
      No description.

  - AddLabel(?)  
      No description.

  - AddDropdown(?)  
      No description.

  - AddMultiDropdown(?)  
      No description.

  - AddColorPicker(?)  
      No description.

  - AddTextbox(?)  
      No description.

  - SetEnabled(?)  
      No description.

  - GetString(?)  
      No description.

  - GetColor(?)  
      No description.

  - SetColor(?)  
      No description.

  - IsHotkeyActive(?)  
      No description.

  - ToggleHotkey(?)  
      No description.

  - IsMenuOpen(?)  
      No description.

- Convar:  
  - GetInt(name: str) -> int  
      Returns the current value of the specified ConVar.

  - SetInt(name: str, value: int)  
      Sets the value of the specified ConVar.

  - GetFloat(name: str) -> float  
      Returns the current value of the specified ConVar.

  - SetFloat(name: str, value: float)  
      Sets the value of the specified ConVar.

  - GetString(name: str) -> str  
      Returns the value of the specified ConVar.

  - SetString(name: str, value: str)  
      Sets the value of the specified ConVar.

- Event:  
  - GetInt(?)  
      No description.

  - GetFloat(?)  
      No description.

  - GetString(?)  
      No description.

- Entity:  
  - GetEntities() -> Sequence[object]  
      Returns all entities.

  - GetEntitiesByClassID(?)  
      No description.

  - GetPlayers() -> Sequence[object]  
      Returns all players.

  - GetEnemies() -> Sequence[object]  
      Returns all enemy players.

  - GetTeammates() -> Sequence[object]  
      Returns all friendly players.

  - GetLocalPlayer() -> object  
      Returns yourself.

  - GetGameRulesProxy(?)  
      No description.

  - GetEntityFromUserID(userid: int) -> object  
      Returns the player matching the userid.

  - IsTeammate(entity: object) -> bool  
      Returns if the entity is a teammate.

  - IsEnemy(entity: object) -> bool  
      Returns if the entity is an enemy.

  - IsBot(entity: object) -> bool  
      Returns if the entity is a bot.

  - IsLocalPlayer(entity: object)  
      Returns if the entity is yourself.

  - IsValid(entitiy: object) -> bool  
      Returns if the entity is valid (no idea what it means).

  - IsAlive(entitiy: object) -> bool  
      Returns if the entitiy is alive.

  - IsDormant(entity: object) -> bool  
      Returns if the entity is dormant.

  - GetClassID(entity: object) -> int  
      Returns the class id of the entity.

  - GetClassName(entity: object) -> str  
      Returns the class name of the entitiy.

  - GetName(entity: object) -> str  
      Returns the name of the entitiy.

  - GetWeapon(entity: object) -> object  
      Returns the current held weapon of the entitiy.

  - GetWeapons(entity: object) -> Sequence[object]  
      Returns all weapon of the entity.

  - GetRenderOrigin(?)  
      No description.

  - GetRenderBox(?)  
      No description.

  - GetProp(?)  
      No description.

  - SetProp(?)  
      No description.

  - GetHitboxPosition(?)  
      No description.

  - GetEyePosition(?)  
      No description.

- Trace:  
  - Line(?)  
      No description.

  - Bullet(?)  
      No description.

- UserCMD:  
  - SetMovement(?)  
      No description.

  - GetMovement(?)  
      No description.

  - SetAngles(?)  
      No description.

  - ForceJump(?)  
      No description.

  - ForceCrouch(?)  
      No description.

- AntiAim:  
  - GetOverride() -> int  
      Returns 1 if the antiaim is being managed by a script, 0 otherwise.

  - SetOverride(state: int)  
      Override the antiaim tab if set to 1.
      Must be an integer. True/false are not accepted.

  - SetRealOffset(degree: int)  
      Set the real offset.
      Min is -58 and max is 58.

  - SetFakeOffset(degree: int)  
      Set the yaw offset. 0 = backwards

  - SetLBYOffset(degree: int)  
      Sets the fake offset.
      Min is -58 and max is 58.

- Exploit:  
  - GetCharge(?)  
      No description.

  - Recharge(?)  
      No description.

  - DisableRecharge(?)  
      No description.

  - EnableRecharge(?)  
      No description.

- Ragebot:  
  - GetTarget(?)  
      No description.

  - IgnoreTarget(?)  
      No description.

  - ForceTarget(?)  
      No description.

  - ForceTargetSafety(?)  
      No description.

  - ForceTargetHitchance(?)  
      No description.

  - ForceTargetMinimumDamage(?)  
      No description.

  - ForceHitboxSafety(?)  
      No description.

- Material:  
  - Create(?)  
      No description.

  - Destroy(?)  
      No description.

  - Get(?)  
      No description.

  - SetKeyValue(?)  
      No description.

  - Refresh(?)  
      No description.

- __filename (string)  
    Filename of the .js that is executing.

