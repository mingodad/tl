local assert = require("luassert")
local util = require("spec.util")

describe("tl completion", function()
   it("prints bash code completion", function()
      local pd = io.popen(util.tl_cmd("completion", "bash") .. "2>&1", "r")
      local output = pd:read("*a")
      util.assert_popen_close(0, pd:close())
      assert.match("_tl%(%) {", output)
   end)
   it("throws error for invalid shell", function()
      local pd = io.popen(util.tl_cmd("completion", "foo") .. "2>&1", "r")
      local output = pd:read("*a")
      util.assert_popen_close(1, pd:close())
      assert.match("Error:", output)
   end)
end)
