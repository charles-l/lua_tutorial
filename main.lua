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

function room(t)
    room_exit = false
    input = ""
    while not room_exit do
        input = get_input()
        valid = false

        for k,v in pairs(t) do
            if input == string.gsub(k, "_", " ") then
                if type(v) == "string" then
                    print(v)
                else
                    v()
                end
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

room_com = {inspect = "You're in a cave. There is an exit.",
exit = function()
    print("You leave the cave.")
    room_exit = true
end}
room(room_com)

room_com2 = {
    inspect = "There is a cave behind you. You're on a cliff. There is a pathway leading to the south.",
    follow_path = function()
        print("You follow the path")
        print("A troll appears wielding an ax")
        print("What do you want to do? (run away, attack)")
        tinput = io.read()
        if tinput == "attack" then
            print("You smack with you're sword and it falls dead")
            room_exit = true
        elseif tinput == "run away" then
            print("You cowardly turn your back to flee but it smacks and steals your coin")
            pop_inv("coin")
            room_exit = true
        else
            print("You stand there. It stabs you. You die. Game over")
            os.exit()
        end
    end
}

room(room_com2)

have_key = false
room_com3 = {
    inspect = function()
        if have_key == false then
            print("There is a path behind you. There is a locked gate in front of you. There is a key on the ground.")
        else
            -- If we do have the key, don't say there's a key on the ground.
            print("There is a path behind you. There is a locked gate in front of you.")
        end
    end,
    grab_key = function()
        have_key = true
        print("You got the key")
    end,
    open_gate = function()
        if have_key == false then
            print("It's locked")
        elseif have_key == true then
            print("You open the gate and leave.")
            room_exit = true
        end
    end
}

room(room_com3)

-- VICTORY!
print("You escaped.")
