
Onetap.com Javascript callbacks
===============================

Callbacks that can be registered using :js:func:`Cheat.RegisterCallback`.

Cheat Events
------------

.. js:function:: CreateMove()

    Called everytime a move command is sent to the server.

    :js:mod:`UserCMD` can be used during this callback.

.. js:function:: Draw()

    Called everytime a frame is rendered.

    :js:mod:`Render` can be used during this callback.

.. js:function:: FrameStageNotify()

    Called everytime the frame stage changes.

    :js:func:`Cheat.FrameStage` can be used during this callback.


CS:GO Events
------------

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
--------------------

Cheat events which use :js:mod:`Event` to distribute their settings.

.. js:function:: ragebot_fire()

    Called everytime the ragebot shoots at an enemy.

    Structure:

        +----------------+-----------+-----------------------+
        |  Name          |  Type     |  Description          |
        +================+===========+=======================+
        |  exploit       |  integer  |  N/A                  |
        +----------------+-----------+-----------------------+
        |  hitgroup      |  integer  |  Hitgroup             |
        +----------------+-----------+-----------------------+
        |  hc            |  integer  |  Hitchance            |
        +----------------+-----------+-----------------------+
        |  safepoint     |  integer  |  Safepoint            |
        +----------------+-----------+-----------------------+
        |  target_index  |  integer  |  Index of the target  |
        +----------------+-----------+-----------------------+

    Example:


    .. code:: js

        function on_ragebot_fire() {
            var hitgroup = Event.GetInt("hitgroup");
            var hitchance = Event.GetInt("hc");
            var safepoint = Event.GetInt("safepoint");
            var expoit = Event.GetInt("exploit");
            Cheat.Print("Shot hitgroup " + hitgroup + " with a chance of " + hitchance + "% safepoint=" + safepoint + " exploit=" + exploit);
        }
        Cheat.RegisterCallback("ragebot_fire", "on_ragebot_fire");
