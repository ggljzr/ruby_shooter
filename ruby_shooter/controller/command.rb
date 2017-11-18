class Command
  attr_reader :executed

  def initialize(subject)
    @subject = subject
    @executed = false
  end

  protected

  def exec_method(action)
    @subject.send(action) unless @executed
    @executed = true
  end
end

class MoveCannonUpCommand < Command
  def execute
    exec_method(:move_cannon_up)
  end
end

class MoveCannonDownCommand < Command
  def execute
    exec_method(:move_cannon_down)
  end
end

class AimCannonUpCommand < Command
  def execute
    exec_method(:aim_cannon_up)
  end
end

class AimCannonDownCommand < Command
  def execute
    exec_method(:aim_cannon_down)
  end
end

class FireCannonCommand < Command
  def execute
    exec_method(:fire_cannon)
  end
end

class CannonForceUpCommand < Command
  def execute
    exec_method(:cannon_force_up)
  end
end

class CannonForceDownCommand < Command
  def execute
    exec_method(:cannon_force_down)
  end
end

class StopCommand < Command
  def execute
    exec_method(:stop)
  end
end
