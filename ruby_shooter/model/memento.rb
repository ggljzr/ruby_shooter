class Memento
    def initialize(model)
        @state = Marshal.dump(model)
    end

    def restore
        Marshal.load(@state)
    end
end