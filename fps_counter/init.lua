fps_counter = {}

function fps_counter:new(dat)
    local obj = dat or {}

    obj.accumulator = 0
    obj.fps = 0
    obj.lastTime = os.time()
    obj.currentTime = 0

    setmetatable(obj, { __index = fps_counter })
    return obj
end

function fps_counter:update()
    self.accumulator = self.accumulator + 1
    self.currentTime = os.time()
    if self.currentTime > self.lastTime then
        self.fps = self.accumulator
        self.accumulator = 0
        self.lastTime = self.currentTime
    end
end

function fps_counter:getFPS()
    return self.fps
end