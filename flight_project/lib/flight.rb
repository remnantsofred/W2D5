require_relative "./passenger.rb"

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number.upcase
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        elsif @passengers.length < @capacity
            return false
        end
    end

    def board_passenger(passenger)
        if !self.full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map { |passenger| passenger.name }
    end

    def [](index)
        return @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end