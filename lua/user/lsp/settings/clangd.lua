return {
  cmd = {
    "clangd",
    "--query-driver=/home/anton/projects/**/cxx-wrapper",--/home/anton/Downloads/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-g++",
    -- "--query-driver=/home/anton/projects/cpp-projects/toolchain-testing/cxx-wrapper",
    "--enable-config",
    "--log=verbose",
    "--pretty",
    "--j=4",
  }
}
