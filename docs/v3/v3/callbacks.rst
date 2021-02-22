
Onetap v3 Javascript callbacks
===============================

Callbacks that can be registered using :js:func:`Cheat.RegisterCallback`.

Cheat Events
-------------

.. js:function:: CreateMove()

    Called everytime a move command is sent to the server.

    :js:mod:`UserCMD` can be used during this callback.

.. js:function:: Draw()

    Called everytime a frame is rendered.

    :js:mod:`Render` can be used during this callback.

.. js:function:: FrameStageNotify()

    Called everytime the frame stage changes.

    :js:func:`Cheat.FrameStage` can be used during this callback.

.. js:function:: Unload()

    Called when the javascript is unloaded.

.. js:function:: Material()

    .. warning:: Undocumented callback.


CS:GO Events
-------------

You can use all `CS:GO events <https://wiki.alliedmods.net/Counter-Strike:_Global_Offensive_Events>`_ as callbacks.

:js:mod:`Event` can be used during these callbacks.

Example:

.. code:: js

    function on_player_death() {
        entity = Entity.GetEntityFromUserID(Event.GetInt("userid"));
        Cheat.PrintChat("\x02" + Entity.GetName(entity) + " \x01died!");
    }
    Cheat.RegisterCallback("player_death", "on_player_death");


Special Cheat Events
---------------------

Cheat events which use :js:mod:`Event` to distribute their settings.

.. js:function:: ragebot_fire()

    Called everytime the ragebot shoots at an enemy.

    Structure:

        +----------------+-----------+-----------------------------------------+
        |  Name          |  Type     |  Description                            |
        +================+===========+=========================================+
        |  exploit       |  integer  |  0 = no dt, 1 = not charged dt, 2 = dt  |
        +----------------+-----------+-----------------------------------------+
        |  target_index  |  integer  |  Entityindex of the target              |
        +----------------+-----------+-----------------------------------------+
        |  hitchance     |  integer  |  Hitchance of the shot  (0-100)         |
        +----------------+-----------+-----------------------------------------+
        |  safepoint     |  integer  |  Targetting a safepoint                 |
        +----------------+-----------+-----------------------------------------+
        |  hitbox        |  integer  |  Targetted Hitboxindex                  |
        +----------------+-----------+-----------------------------------------+

    Example:


    .. code:: js

        var names = ["disabled", "not charged", "used"]
        function on_ragebot_fire() {
            var exploit = Event.GetInt("exploit");
            var target = Event.GetInt("target_index");
            Cheat.Print("ragebot shot at " + Entity.GetName(target) + ", doubletap was " + names[exploit] + "\n");
        }
        Cheat.RegisterCallback("ragebot_fire", "on_ragebot_fire");
