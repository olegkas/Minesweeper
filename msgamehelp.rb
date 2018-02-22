module GameHelp

  WHEN_YOU_PLAY = [
      "Commands:",
      "",
      "fRC - flag cell at row R, column C",
      "      exmaple: fAB or fab",
      "sRC - show cell at row R, column C",
      "      exmaple: oAB or oab",
      "r   - replay the mine map",
      "n   - create new mine map",
      "e   - exit game",
      ""
  ]

  WHEN_YOU_LOST = [
      "\e[31m  #     #  ###   #   #\e[0m",
      "\e[31m   #   #  #   #  #   #\e[0m",
      "\e[31m    # #   #   #  #   #\e[0m",
      "\e[31m     #    #   #  #   #\e[0m",
      "\e[31m     #     ###    ### \e[0m",
      "",
      "\e[31m #      ###   #### ##### #\e[0m",
      "\e[31m #     #   # #     #     #\e[0m",
      "\e[31m #     #   #  ###  ###   #\e[0m",
      "\e[31m #     #   #     # #      \e[0m",
      "\e[31m #####  ###  ####  ##### #\e[0m",
      "",
      '',
      "Commands:",
      "",
      "r   - replay the mine map",
      "n   - create new mine map",
      "e   - exit game",
      ""
  ]

  WHEN_YOU_WON = [
      "\e[32m  #     #  ###   #   #\e[0m",
      "\e[32m   #   #  #   #  #   #\e[0m",
      "\e[32m    # #   #   #  #   #\e[0m",
      "\e[32m     #    #   #  #   #\e[0m",
      "\e[32m     #     ###    ### \e[0m",
      "",
      "\e[32m#         #  ###   ####   #\e[0m",
      "\e[32m #   #   #  #   #  #   #  #\e[0m",
      "\e[32m  # # # #   #   #  #   #  #\e[0m",
      "\e[32m   #   #    #   #  #   #   \e[0m",
      "\e[32m   #   #     ###   #   #  #\e[0m",
      "",
      '',
      "Commands:",
      "",
      "r   - replay the mine map",
      "n   - create new mine map",
      "e   - exit game",
      ""
  ]

end
