class Item

    attr_reader :title, :deadline, :description

    def self.valid_date?(date_string)
        dates = date_string.split("-")
        if date_string.length != 10
            return false
        elsif dates.length != 3
            return false
        elsif !(dates.all? { |part| part.each_char { |char| "0123456789".include?(char) }} )
            return false
        elsif dates[0].length != 4 || dates[1].length != 2 || dates[2].length != 2
            return false
        elsif dates[1].to_i > 12
            return false
        elsif dates[2].to_i > 31
            return false
        end

        true
    end

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        if !Item.valid_date?(@deadline)
            raise 'error - invalid date'
        end
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise 'error - invalid date'
        else
            @deadline = new_deadline
        end
    end  

    def description=(new_description)
        @description = new_description
    end

end


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false


# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# )