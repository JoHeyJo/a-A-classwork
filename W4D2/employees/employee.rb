class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary   
        @boss = boss
    end

    def boss=(boss)
        # @boss = boss
        boss.add_employee(self) unless boss == nil 
    end

    def bonus(num) 
        @salary * num
    end


end



class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employee(pawn)
        @employees << pawn
    end

end