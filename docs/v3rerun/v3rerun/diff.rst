
Differences: Onetap v3 vs Onetap v3 Re:Run
===========================================

The Onetap v3 **Re**\ mastered **Run**\ time is a project to make the onetap 
runtime better, remove code, simplify code and make it more intuitive.


Re:Run removes the `Global` module
-----------------------------------

The usage of the `Global` module was discouraged in our documentation and has 
been removed in Re:Run to simplify the runtime.


Re:Run adds proper Classes
---------------------------

Re:Run adds classes because `Entity`, `Ragebot`, or `UI` always need annoying 
arguments.


- :js:class:`Reference`

    An instance of a :js:class:`Reference` class is a reference to an element 
    in the Onetap UI and greatly removes unneeded code.

    .. code:: js

        // Normal runtime
        UI.AddCheckbox("Hello World");
        UI.GetValue("Misc", "JAVASCRIPT", "Script Items", "Hello World");  // -> true

        // Re:Run
        reference = UI.AddCheckbox("Hello World");
        reference.GetValue(); // -> true

        // reference to existing element
        reference = new Reference("Anti-Aim", "Fake-Lag", "Enabled");

- :js:class:`Entity`

    An instance of an :js:class:`Entity` class is a reference to an entityindex.

    .. code:: js

        // Normal runtime
        players = Entity.GetPlayers();
        for (i = 0, len = ref.length; i < len; i++) {
            player = players[i];
            Cheat.Print(Entity.GetName(player));
        }

        // Re:Run
        players = Entities.GetPlayers();
        for (i = 0, len = ref.length; i < len; i++) {
            player = players[i];
            Cheat.Print(player.GetName());
        }

        // from entityindex
        player = new Entity(index);
        Cheat.Print(player.GetName());

    .. note:: The original `Entity` module has been renamed to `Entities`

- :js:class:`Material`

    An instance of a :js:class:`Material` class is a reference to a material.

    .. code:: js

        // Normal runtime
        Material.Create("test");
        index = Material.Get("test");
        Material.SetKeyValue(index, "test", "test");
        Material.Refresh(index);
        Material.Destroy("test");

        // Re:Run
        material = Materials.Create("test")
        material.SetKeyValue("test", "test");
        material.Refresh();
        material.Destroy();

        // without Create()
        // both are equivalent
        material = new Material("test");
        material = Materials.Get("test");

- :js:class:`Vector2`, :js:class:`Vector3`, :js:class:`Angles`, :js:class:`RGBA`

    All functions will return the appropiate instance of either 
    :js:class:`Vector2`, :js:class:`Vector3`, :js:class:`Angles` or 
    :js:class:`RGBA` if it makes sense.


Re:Run simplifies Callbacks
----------------------------

Instead of having to create your callback function as a global variable, why 
not give it directly to `Cheat.RegisterCallback` ?

.. code:: js

    // Normal runtime
    function onCreateMove() {
        // called every tick
    };
    Cheat.RegisterCallback("CreateMove", "onCreateMove");

    // Re:Run
    Cheat.RegisterCallback("CreateMove", function() {
        // called every tick
    })


Re:Run also includes an exception handler for callbacks, because Onetap 
silently eats all errors in callbacks.

.. code:: js

    // Normal runtime
    function onCreateMove() {
        throw new Error("Hello World");  // throw an error
    };
    Cheat.RegisterCallback("CreateMove", "onCreateMove");
    // silently eats all errors

    // Re:Run
    Cheat.RegisterCallback("CreateMove", function() {
        throw new Error("Hello World");  // throw an error
    })
    // in console: [Onetap Re:Run] Error occured in CreateMove callback: Hello World
