module Observable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def add_observers(observers)
    @observers + observers
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |o| o.update }
  end
end
