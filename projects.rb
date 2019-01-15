class Project
    attr_accessor :name, :description

    def initialize(data)
        @name = data.fetch("name")
        @description = data.fetch("description")
    end

    def self.get(data)
        data.map{|project| Project.new(project)}
    end

    def self.display(projects)
        puts "Projects"
        projects.each do |project|
            project.display_each
        end
    end

    def display_each
        puts "  * #{self.name}: #{self.description}"
    end
end