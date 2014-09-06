-- LUA TUTORIAL PART 2
-- http://youtube.com/thespastickangaroo
-- Feel free to use an redistribute this code
-- if you want to :)

print("Welcome to the game")

-- Explicitly set the input variable to an empty string
-- because it's used in the while loop.
input = ""

-- '~=' means 'not equal to'
while input ~= "exit" do
  print("What do you want to do?")
  input = io.read() -- Get what the user types.

  -- '==' means 'is equal to'
  if input == "inspect" then
    print("You're in a cave. There is an exit.")
  end

  if input == "exit" then
    print("You leave the cave.")
  end
end

input = ""
while input ~= "follow path" do
  print("What do you want to do?")
  input = io.read()

  if input == "inspect" then
    print("There is a cave behind you. You're on a cliff. There is a pathway leading to the south.")
  end

  if input == "follow path" then
    print("You follow the path")
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
  print("What do you want to do?")
  input = io.read()

  if input == "inspect" then
    -- If we don't have the key, let us know that it's on the ground.
    if have_key == false then
      print("There is a path behind you. There is a locked gate in front of you. There is a key on the ground.")
    end

    -- If we do have the key, don't say there's a key on the ground.
    if have_key == true then
      print("There is a path behind you. There is a locked gate in front of you.")
    end
  end

  if input == "grab key" then
    -- We now have the key. Set the variable to true.
    have_key = true
    print("You got the key")
  end

  if input == "open gate" then
    if have_key == false then
      print("It's locked")
    end

    if have_key == true then
      print("You open the gate and leave.")
    end
  end
end

-- VICTORY!
print("You escaped.")
