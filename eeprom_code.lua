local invoke = component.invoke

local gpu = component.list("gpu")()
local screen = component.list("screen")()
local state = 0
local text = "¯\\_(ツ)_/¯"

if not gpu or not screen then error("¯\\_(ツ)_/¯") end
invoke(gpu, "bind", screen)
invoke(gpu, "setResolution", 50,16)

local resx, resy = invoke(gpu, "getResolution")
local startx = (resx / 2 - #text / 2) + 1
local starty = resy / 2

function Sleep(timeout)
  local deadline = computer.uptime() + timeout
  repeat
    computer.pullSignal(deadline - computer.uptime())
  until computer.uptime() >= deadline
end

while true do
  if state == 0 then
    invoke(gpu, "setBackground", 0x002b36)
    invoke(gpu, "setForeground", 0x8cb9c5)
    state = 1
  else
    invoke(gpu, "setBackground", 0x002b36)
    invoke(gpu, "setForeground", 0x8cb9c5)
    state = 0
  end

  invoke(gpu, "fill", 1,1, resx,resy, " ")
  invoke(gpu, "set", startx, starty, text)
  computer.beep()

  Sleep(1)
end
