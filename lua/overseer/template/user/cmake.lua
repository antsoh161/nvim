return {
   name = "overseer cmake",
   builder = function(params)
      return {
         cmd = { params.my_var }
      }
   end,
   desc = "cmake tasks",
   params = {
      my_var = {
         type = "enum",
         name = "my choice",
         order = 1,
         choices = { "CMakeBuild", "CMakeClean" },
      },
   },
   condition = {
      callback = function()
         return vim.fn.filereadable("CMakeLists.txt") == 1
      end,
   },
}
