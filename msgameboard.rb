require_relative 'mscell'

class Hash
  def method_missing(m, *args, &block)
    #puts "method:#{m}, args:#{args} len=#{args.length}"
    return self[m] if self.key?(m)

    if m.to_s.end_with?('=') && args.length > 0
      item = m.to_s.chop.to_sym
      return self[item]=args[0] if self.key?(item)
    end

    raise NoMethodError.new("Undefined method '#{m}' for #{self.to_s}:#{self.class}")
  end
end

class GameBoard

  def initialize(size, density)
    @size = size
    @density = density
    @data = @size.times.to_a.collect { @size.times.to_a.map { EmptyMineCell.new } }

    count = (@size*@size*@density).round
    if count == 0
      count += 1
    elsif count == @size*@size
      count -= 1
    end

    while count > 0
      i, j = rand(@size), rand(@size)
      if @data[i][j].class == EmptyMineCell
        @data[i][j] = ExplosiveMineCell.new
        count -= 1
      end
    end

    @size.times do |irow|
      @size.times do |icol|
        if @data[irow][icol].class == EmptyMineCell
          secret = neighbours_around(irow, icol).select{|pt| @data[pt.x][pt.y].class == ExplosiveMineCell}.length
          @data[irow][icol].secret = secret > 0 ? secret.to_s : ' '
        end
      end
    end
  end


  def neighbours_around(irow, icol)
    [
      {x:-1, y:-1}, {x:-1, y:0}, {x:-1, y:1},
      {x: 0, y:-1},              {x: 0, y:1},
      {x: 1, y:-1}, {x: 1, y:0}, {x: 1, y:1}
    ]
    .collect{|pt| {x:(pt.x + irow), y:(pt.y + icol)}}
    .select{|pt| pt.x >=0 && pt.x < @size && pt.y >= 0 && pt.y < @size}
  end


  def draw
    lines = []
    lines <<  '     ' + @size.times.to_a.map{ |val| ('A'.ord + val).chr }.join('   ') + '     '
    lines <<  "   #{"+---"*@size}+   "

    @size.times do |irow|
      lines <<  " #{('A'.ord + irow).chr} |" + @data[irow].map(&:to_s).join('|') + "| #{('A'.ord + irow).chr} "
      lines <<  "   #{"+---"*@size}+   "
    end

    lines <<  '     ' + @size.times.to_a.map{ |val| ('A'.ord + val).chr}.join('   ') + '     '

    puts ''
     lines.length.times do |iline|
       info = yield(iline, lines.length) if block_given?
       puts info.nil? ? lines[iline] : lines[iline] + info
     end
     puts ''
  end


  def is_cell_flagged?(irow, icol)
    @data[irow][icol].is_flagged?
  end


  def flag_cell(irow, icol)
    @data[irow][icol].flag
  end


  def is_cell_shown?(irow, icol)
    @data[irow][icol].is_shown?
  end


  def show_cell(irow, icol)
    if !@data[irow][icol].is_shown?
      @data[irow][icol].show

      if @data[irow][icol].class == ExplosiveMineCell
        @data.each{|row| row.select{|cell| cell.class == ExplosiveMineCell }.each{|cell| cell.show}}
      elsif @data[irow][icol].class == EmptyMineCell && @data[irow][icol].secret == ' '
        neighbours_around(irow, icol).each{|pt| show_cell(pt.x, pt.y)}
      end
    end
  end


  def reset
      @data.each{|row| row.each {|cell| cell.hide}}
  end


  def you_loose?
      @data.reduce(0){|total, row| total + row.select{|cell| cell.class == ExplosiveMineCell && cell.is_shown?}.length } > 0
  end


  def you_won?
      @data.reduce(0){|total, row| total + row.select{|cell| cell.class == EmptyMineCell && !cell.is_shown?}.length} == 0
  end

end
