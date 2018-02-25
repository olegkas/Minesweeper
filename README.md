# Minesweeper (in Text mode)

# Language: Ruby

#Main file (file to run):
  minesweeper.rb

#Minesweeper parameters:

 /size=<number>, defines the size of the game map, must be in range 5 - 26, defult value is 8
        example: size=10 - will set number of rows and columns to 10

 /density=<number>, defines the percentage of explosive cells, must be in range 1 - 99, default value is 30
        example: density=20 - will make explosive 20% of cells

 /help or /h - shows this help

#Look and feel:
(Text below contains tables in text mode, you might need to switch to Raw mode to see them prpperely)

> Type your command, then press <Enter>: saa
  SAA => Show cell A,A

     A   B   C   D   E   F   G   H
   +---+---+---+---+---+---+---+---+
 A | 1 | # | # | # | 1 |   |   |   | A
   +---+---+---+---+---+---+---+---+
 B | # | # | # | # | 1 |   |   |   | B
   +---+---+---+---+---+---+---+---+
 C | 1 | 2 | # | 2 | 1 |   |   |   | C
   +---+---+---+---+---+---+---+---+
 D |   | 1 | # | 1 |   |   |   |   | D
   +---+---+---+---+---+---+---+---+       Commands:
 E |   | 1 | 1 | 1 |   |   |   |   | E
   +---+---+---+---+---+---+---+---+       fRC - flag cell at row R, column C
 F |   |   |   |   |   |   |   |   | F           exmaple: fAB or fab
   +---+---+---+---+---+---+---+---+       sRC - show cell at row R, column C
 G |   |   | 1 | 1 | 2 | 1 | 2 | 1 | G           exmaple: oAB or oab
   +---+---+---+---+---+---+---+---+       r   - replay the mine map
 H |   |   | 1 | # | # | # | # | # | H     n   - create new mine map
   +---+---+---+---+---+---+---+---+       e   - exit game
     A   B   C   D   E   F   G   H

> Type your command, then press <Enter>: sbb
  SBB => Show cell B,B

     A   B   C   D   E   F   G   H           #     #  ###   #   #
   +---+---+---+---+---+---+---+---+          #   #  #   #  #   #
 A | 1 | # | # | # | 1 |   |   |   | A         # #   #   #  #   #
   +---+---+---+---+---+---+---+---+            #    #   #  #   #
 B | # | * | # | * | 1 |   |   |   | B          #     ###    ###
   +---+---+---+---+---+---+---+---+
 C | 1 | 2 | # | 2 | 1 |   |   |   | C      #      ###   #### ##### #
   +---+---+---+---+---+---+---+---+        #     #   # #     #     #
 D |   | 1 | * | 1 |   |   |   |   | D      #     #   #  ###  ###   #
   +---+---+---+---+---+---+---+---+        #     #   #     # #
 E |   | 1 | 1 | 1 |   |   |   |   | E      #####  ###  ####  ##### #
   +---+---+---+---+---+---+---+---+
 F |   |   |   |   |   |   |   |   | F
   +---+---+---+---+---+---+---+---+       Commands:
 G |   |   | 1 | 1 | 2 | 1 | 2 | 1 | G
   +---+---+---+---+---+---+---+---+       r   - replay the mine map
 H |   |   | 1 | * | # | * | # | * | H     n   - create new mine map
   +---+---+---+---+---+---+---+---+       e   - exit game
     A   B   C   D   E   F   G   H

> Type your command, then press <Enter>:
