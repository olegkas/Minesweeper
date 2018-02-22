
class GenericMineCell
  CELL_STATE_HIDE = 0
  CELL_STATE_FLAG = 1
  CELL_STATE_SHOW = 2

  attr_accessor :secret
  attr_accessor :hideby

  def initialize(secret, hideby, state)
    @hideby = hideby
    @secret = secret
    @state = state
  end

  def draw
    print  self.to_s
  end

  def to_s
    case @state
    when CELL_STATE_HIDE
      " #{@hideby} "
    when CELL_STATE_FLAG
      " \e[33mF\e[0m "
    when CELL_STATE_SHOW
      " #{@secret} "
    else
      ' ? '
    end
  end

  def is_shown?; @state == CELL_STATE_SHOW; end

  def is_flagged?; @state == CELL_STATE_FLAG; end

  def hide; @state = CELL_STATE_HIDE; end

  def show; @state = CELL_STATE_SHOW; end


  def flag
    @state = (@state == CELL_STATE_HIDE) ? CELL_STATE_FLAG : CELL_STATE_HIDE
    @state == CELL_STATE_FLAG
  end

end

class EmptyMineCell < GenericMineCell
  def initialize(state = CELL_STATE_HIDE)
    super(' ', '#', state)
  end

  def to_s
    case @state
    when CELL_STATE_SHOW
      " \e[32m#{@secret}\e[0m "
    else
      super
    end
  end
end

class ExplosiveMineCell < GenericMineCell
  def initialize(state = CELL_STATE_HIDE)
    super('*', '#', state)
  end

  def to_s
    case @state
    when CELL_STATE_SHOW
      " \e[31m#{@secret}\e[0m "
    else
      super
    end
  end
end
