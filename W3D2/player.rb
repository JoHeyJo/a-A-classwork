class Player
    def initialize(name)
        player = name
    end
    def guess
    input = gets.chomp
    self.alert_invalid_guess(input)
    input
    end

    def alert_invalid_guess(input)
        raise 'error' if input.length != 1
    end
end