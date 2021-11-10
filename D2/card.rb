class Card
    attr_reader :face_up, :face_down

    def initialize(val)
        @face_up_val = val
        @face_down? = true
    end

    def hide
        @face_down = true
    end

    def reveal
        if  @face_down
    end


end