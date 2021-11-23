    require 'sqlite3'
    require 'singleton'

class QuestionsDatabase < SQLite3::Database
    inlcude Singleton

    def initialize
        super('./questions.db')
        self.type_translate = true
        self.results_as_hash = true
    end

end

class Question

    def self.all    
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id
        
    end
    
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        user_id = options['user_id']
    end


end

class Users


    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']

    end

    def self.find_by_name(fname, lname)
    
    end

    def self.fname

    end

end