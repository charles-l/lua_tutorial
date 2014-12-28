-- LUA TUTORIAL PART 4
-- http://youtube.com/thespastickangaroo
-- Feel free to use an redistribute this code
-- if you want to :)

print("Welcome to the game")

-- Explicitly set the input variable to an empty string
-- because it's used in the while loop.
input = ""

inv = {"coin", "sword", "armor"}

-- Prints out everything in our inventory
function get_inv()
    for i,v in pairs(inv) do
        print(i .. " " .. v)
    end
end

-- Adds a new item to our inventory
function push_inv(item)
    table.insert(inv, item)
end

-- Removes an item from our inventory that matches the item string
function pop_inv(item)
    for i, v in pairs(inv) do
        if v == item then
            table.remove(inv, i)
        end
    end
end

-- invalid command. Print error.
function err_command()
    print("You didn't write a valid command...")
end

-- Read input and return it.
function get_input()
    print("What do you want to do?")
    i = io.read() -- Get what the user types.
    return i
end

-- Create a room. exit_command is a string. exit_command will be the command
-- that cuases us to leave the room and break the loop.
-- t is a key/value list of commands possible and the printed response.
-- {'command' = 'response', 'command2' = 'response2'}
function room(exit_command, t)
    input = ""
    while input ~= exit_command do
        input = get_input()
        valid = false

        for k,v in pairs(t) do
            if input == k then
                print(v)
                valid = true
            end
        end

        if input == "inv" then
            get_inv()
        elseif valid == false then
            err_command()
        end
    end
end

room_com = {inspect = "You're in a cave. There is an exit.", exit = "You leave the cave."}
room("exit", room_com)

------------------------------------------------
-- THE FOLLOWING WILL BE UPDATED NEXT EPISODE --
------------------------------------------------

input = ""
while input ~= "follow path" do
    input = get_input()

    if input == "inspect" then
        print("There is a cave behind you. You're on a cliff. There is a pathway leading to the south.")
    elseif input == "follow path" then
        print("You follow the path")
        print("A troll appears wielding an ax")
        print("What do you want to do? (run away, attack)")
        tinput = io.read()
        if tinput == "attack" then
            print("You smack with you're sword and it falls dead")
        elseif tinput == "run away" then
            print("You cowardly turn your back to flee but it smacks and steals your coin")
            pop_inv("coin")
        else
            print("You stand there. It stabs you. You die. Game over")
            os.exit()
        end
    elseif input == "inv" then
        get_inv()
    else
        err_command()
    end
end

input = ""

-- A boolean value can only have two values: true or false
-- This works great for the 'have_key' variable, because
-- there are only two possibilities. You have the key or
-- you don't.
have_key = false

-- This statement means: while this statement: "input is equal to 'open gate' and have_key is true" is not met, loop.
while not (input == "open gate" and have_key == true) do
    input = get_input()

    if input == "inspect" then
        -- If we don't have the key, let us know that it's on the ground.
        if have_key == false then
            print("There is a path behind you. There is a locked gate in front of you. There is a key on the ground.")
        else
            -- If we do have the key, don't say there's a key on the ground.
            print("There is a path behind you. There is a locked gate in front of you.")
        end
    elseif input == "grab key" then
        -- We now have the key. Set the variable to true.
        have_key = true
        print("You got the key")
    elseif input == "open gate" then
        if have_key == false then
            print("It's locked")
        elseif have_key == true then
            print("You open the gate and leave.")
        end
    elseif input == "pick up magic" then
        print("You obtain magic")
        push_inv("MAGIC")
    elseif input == "inv" then
        get_inv()
    else
        err_command()
    end
end

-- VICTORY!
print("You escaped.")
