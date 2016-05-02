fuel = turtle.getFuelLevel()

function refuel(f)
  fuel = turtle.getFuelLevel()
  print("Fuel: ", fuel)
  while fuel < 500 do
    print("Fuel low")
    turtle.select(f)
    turtle.refuel(1)
    sleep(1)
    fuel = turtle.getFuelLevel()
    print("New fuel level: ", fuel)
  end
end

function checkinv()
  n = 1
  while n < 17 do
    turtle.select(n)
    itemcount = turtle.getItemCount(n)
    if itemcount > 0 then
      itemname = turtle.getItemDetail()
      print("slot ", n, ": (", itemcount, ") ", itemname.name)
      print()
      --else
      --print("slot ", n, " empty")
    end
    n = n + 1
    --sleep(1)
  end
  n = 1
  turtle.select(n)
end

function findblock()
  n = 1
  while n < 17 do
    turtle.select(n)
    itemname = turtle.getItemDetail()
    if itemname.name == "minecraft:cobblestone"
      then
      print("yay: ", n, "is cobble")
      break
    end
    n = n + 1 
  end
  return n
end

function findfuel()
  f = 1
  while f < 17 do
    turtle.select(f)
    itemname = turtle.getItemDetail()
    exist = turtle.getItemCount()
    if exist > 0 and itemname.name == "minecraft:blaze_rod"
        then
        break
    end
    
    f = f + 1 
  end
  return f
end

function mine(a)
	for i = 1, a do
		turtle.digUp()
		turtle.digDown()
		if turtle.detectDown == false
			then turtle.placeDown()
		end
		turtle.turnRight()
		turtle.dig()
		if turtle.forward() == false then break end
		if turtle.detectDown == false
			then turtle.placeDown()
		end
		turtle.digUp()
		turtle.turnRight()
		turtle.turnRight()
		if turtle.forward() == false then break end
		if turtle.detectDown == false
			then turtle.placeDown()
		end
		turtle.dig()
		if turtle.forward() == false then break end
		if turtle.detectDown == false
			then turtle.placeDown()
		end
		turtle.digUp()
		turtle.turnRight()
		turtle.turnRight()
		if turtle.forward() == false then break end
		if turtle.detectDown == false
			then turtle.placeDown()
		end		
		turtle.turnLeft()
		turtle.dig()
		if turtle.forward() == false then break end
		if turtle.detectDown == false
			then turtle.placeDown()
		end		
	end
end

--function returnToStart()
--end


-----------------------------------------------
--START--
print("how long do you want the tunnel? (number)")
a = io.read()
print("trying to tunnel: ", a)
--checks for fuel and refuels
findfuel()
print(f)
refuel(f)
--check inventory for neccesary building blocks
checkinv()
findblock()
print(n)
--invcheck and refuel complete
term.setTextColor(colors.orange)
print("-STARTING MINING PROCEDURE-")
mine(a)

sleep(10)