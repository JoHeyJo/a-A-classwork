class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary   
        @boss = boss
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) unless boss == nil 
    end

    def bonus(num) 
        @salary * num
    end


end



class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss=nil)
        super
        @employees = []
    end

    def add_employee(pawn)
        @employees << pawn
    end

    def bonus(multiplier)
        bfs * multiplier

    end

    def bfs
        total = -self.salary
        queue = [self]

        until queue.empty?
            node = queue.shift
            queue.concat(node.employees) if node.is_a?(Manager) 
            total += node.salary
        end
        total 
    end

end

ceo = Manager.new('Ned','founder', 1000000)
manager = Manager.new('Darren', 'founder', 78000, ceo)
employee_1  = Employee.new('david', 'TA', 10000, manager)
employee_2 = Employee.new('shawna', 'TA', 12000, manager)

p manager.bonus(4)
p ceo.bonus(5)