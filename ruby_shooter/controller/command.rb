class Command
  attr_reader :executed

  def initialize(subject)
    @subject = subject
    @executed = false
  end
end

class MoveCannonUpCommand < Command
  def execute
    @subject.move_cannon_up
    @executed = true
  end
end

class MoveCannonDownCommand < Command
  def execute
    @subject.move_cannon_down
    @executed = true
  end
end

class AimCannonUpCommand < Command
  def execute
    @subject.aim_cannon_up
    @executed = true
  end
end

class AimCannonDownCommand < Command
  def execute
    @subject.aim_cannon_down
    @executed = true
  end
end

class FireCannonCommand < Command
  def execute
    @subject.fire_cannon
    @executed = true
  end
end

class CannonForceUpCommand < Command
  def execute
    @subject.cannon_force_up
    @executed = true
  end
end

class CannonForceDownCommand < Command
  def execute
    @subject.cannon_force_down
    @executed = true
  end
end

class StopCommand < Command
  def execute
    @subject.stop
    @executed = true
  end
end
