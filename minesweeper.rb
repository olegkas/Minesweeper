require_relative 'msgameflow'


APP_DEFAULTS = {
    size: 8,
    density: 30
}

app_params = APP_DEFAULTS

ARGV.each do |param|
  parts = param.downcase.split('=')

  case parts[0]
  when "/size"
    newval = parts[1].to_i
    if newval > 4 && newval < 27
      app_params[:size] = newval
    else
      puts "WARNING: Size is out of expected range 5 - 26, value #{app_params[:size]} will be used"
    end
  when "/density"
    newval = parts[1].to_i
    if newval > 0 && newval < 100
      app_params[:density] = newval
    else
      puts "WARNING: Density is out of expected range 1 - 99, value #{app_params[:density]} will be used"
    end
  when "/help", "/h"
    puts "\n Minesweeper help:"
    puts "\n /size=<number>, defines the size of the game map, must be in range 5 - 26, defult value is 8"
    puts "\texample: size=10 - will set number of rows and columns to 10"
    puts "\n /density=<number>, defines the percentage of explosive cells, must be in range 1 - 99, default value is 30"
    puts "\texample: density=20 - will make explosive 20% of cells "
    puts "\n /help or /h - shows this help"
    exit(0)
  end
end

puts ''
puts "Map size:\t#{app_params[:size]}x#{app_params[:size]}"
puts "Mine density:\t#{app_params[:density]}%"

mygame = GameFlow.new(app_params[:size], app_params[:density]/100.0)
mygame.game_loop
