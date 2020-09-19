# Dump all Javascript globals

dump = (object, dept) ->
    for key, value of object
        type = typeof value

        Cheat.Print "  ".repeat(dept) + "- " + key + " (" + type + ")"
        if(type == "object")
            Cheat.Print ":\n"
            dump value, dept + 1
        else
            Cheat.Print "\n"

dump(this, 0)
