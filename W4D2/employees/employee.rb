class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary   
        @boss = Manager.new(boss)
        @boss.employees << self
    end

    def bonus(num) 
        @salary * num
    end


end



class Manager < Employee
    attr_accessor :employees

    def initialize(name)
        @name = name
        @employees = []
    end

end