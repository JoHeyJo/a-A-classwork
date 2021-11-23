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