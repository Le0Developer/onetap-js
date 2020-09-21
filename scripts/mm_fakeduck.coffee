# Matchmaking "fake"duck, basically full ducks and unducks for a few ticks with fakelag
# Makes it impossible to hit you while unducking, EXCEPT onshot

UI.AddHotkey "MM Fakeduck"

isPressed = ->
    UI.IsHotkeyActive "Script Items", "MM Fakeduck"
isDebug = ->
    false

fakelag_original = null # store original values here
fakelag_overrides = 
    Enabled: false
    Limit: 6
    Jitter: 0
    "Trigger limit": 0

fakelag_override = ->
    fakelag_original = {}
    for name, value of fakelag_overrides
        fakelag_original[name] = UI.GetValue "Anti-Aim", "Fake-Lag", name
        UI.SetValue "Anti-Aim", "Fake-Lag", name, value
    return undefined

fakelag_recover = ->
    for name, value of fakelag_original
        UI.SetValue "Anti-Aim", "Fake-Lag", name, value        
    fakelag_original = null


onCreateMove = ->
    if not isPressed()
        fakelag_recover() if fakelag_original?
        return
    
    duck = Entity.GetProp Entity.GetLocalPlayer(), "CCSPlayer", "m_flDuckAmount"
    if not fakelag_original? and duck != 0.875 # enabled fd but isnt fully ducked
        UserCMD.ForceCrouch()
        return

    fakelag_override() unless fakelag_original?

    tc = Globals.Tickcount() % (Globals.Tickrate() / 2)

    should_choke = tc <= 7
    should_duck = not (4 >= tc >= 1)

    if isDebug()
        Cheat.Print "[OT-FD] tick: " + tc + " choking: " + should_choke + " ducking: " + should_duck + " duck: " + duck + "\n"

    UI.SetValue "Anti-Aim", "Fake-Lag", "Enabled", should_choke
    if should_duck
        UserCMD.ForceCrouch()

onUnload = ->
    fakelag_recover() if fakelag_original? # recover fakelag when disabling while fakeducking

Cheat.RegisterCallback "CreateMove", "onCreateMove"
Cheat.RegisterCallback "Unload", "onUnload"
