require_relative 'msgamehelp'
require_relative 'msgameboard'

class GameFlow
  include GameHelp

  def initialize(size, density)
    @size = size
    @density = density
    @mygame = GameBoard.new(@size, @density)
  end

  def parse_command(cmd, ingame)
    tocheck = cmd.strip.upcase

    return true, tocheck[0] if ['R','N','E'].include?(tocheck[0])

    if ingame && ['F','S'].include?(tocheck[0])
      return false, "> Command #{cmd} has wrong format" if cmd.length < 3

      srow = tocheck[1]
      irow = srow.ord - 'A'.ord
      return false, "> There is no such row #{srow}" if irow < 0 || irow >= @size

      scol = tocheck[2]
      icol = scol.ord - 'A'.ord
      return false, "> There is no such column #{scol}" if icol < 0 || icol >= @size

      return true, tocheck[0], irow, srow, icol, scol
    end

    return false, "> #{tocheck}? - not now, baby!"
  end

  def game_loop
    while true

      context =  WHEN_YOU_PLAY
      if @mygame.you_won?
        context =  WHEN_YOU_WON
      elsif @mygame.you_loose?
        context =  WHEN_YOU_LOST
      end

      @mygame.draw {|iline, total|  "    " + context[iline - total + context.length].to_s if iline > total - context.length-1}

      iscorrect = false
      while !iscorrect
        print "> Type your command, then press <Enter>: "
        iscorrect, todo, irow, srow, icol, scol = parse_command(STDIN.gets.chomp, context == WHEN_YOU_PLAY)
        puts todo if !iscorrect
      end

      case todo
      when 'F'
        is_flagged = @mygame.flag_cell(irow, icol)
        puts " #{todo}#{srow}#{scol} => #{is_flagged ? "Set flag" : "Remove the flag"} on cell #{srow},#{scol}"
      when 'S'
        @mygame.show_cell(irow, icol)
        puts "  #{todo}#{srow}#{scol} => Show cell #{srow},#{scol}"
      when 'R'
        @mygame.reset
        puts " #{todo} => Game restart"
      when 'N'
        @mygame = GameBoard.new(@size, @density)
        puts " #{todo} => New mine map has been created"
      when 'E'
        puts " #{todo} => Exit game, Bye!"
        break
      end
    end
  end
end
