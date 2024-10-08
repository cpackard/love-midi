local midi = require "midi"

-- It is possible to read only a single track.
-- This will efficiently skip tracks using stream:seek().

local file = love.filesystem.newFile("short-tune.mid")
file:open("r")

-- First we need to find out how many tracks there are in total.
-- The callback is always optional and defaults to an empty function.
local tracks = midi.processHeader(file)
print("Found " .. tracks .. " midi tracks!")

-- Now that we know the track count, let's load just the last one.
-- The file already has been read partially, so we need to seek back or reopen the file altogether.
assert(file:seek(0))
midi.processTrack(file, print, tracks)

file:close()

--[[ Output:

Found 2 midi tracks!
header  1       2       480
track   2
sequencerOrTrackName    Piano
keySignature    0       C       major
noteOn  1       48      0.62992125984252
noteOn  1       52      0.62992125984252
deltatime       911
noteOn  1       48      0.0
noteOn  1       52      0.0
deltatime       49
noteOn  1       50      0.62992125984252
noteOn  1       57      0.62992125984252
deltatime       683
noteOn  1       50      0.0
noteOn  1       57      0.0
deltatime       37
noteOn  1       52      0.62992125984252
noteOn  1       55      0.62992125984252
noteOn  1       59      0.62992125984252
deltatime       227
noteOn  1       52      0.0
noteOn  1       55      0.0
noteOn  1       59      0.0
deltatime       1
endOfTrack

]]
