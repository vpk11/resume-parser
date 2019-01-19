class Project
    attr_accessor :name, :description

    def initialize(data)
        @name = data["name"] || ""
        @description = data["description"] || ""
    end

    #params => 
    #  data: array of hash
    #returns => 
    #  array of objects of Project
    def self.get(data)
        (data == nil) ? [] : data.map{|project| Project.new(project)}
    end

    #params => 
    #  projects: array of objects of Project 
    def self.display(projects)
        puts "Projects"
        projects.each do |project|
            project.display_each
        end
    end

    #Displays the current project attributes
    def display_each
        puts "  * #{self.name}: #{self.description}"
    end

    #params => 
    #  projects: array of objects of Project 
    #returns => 
    #  projects: updated array of objects of Project 
    def add_to(projects)
        ch = "1"
        until ch == "2" do
            puts "\n1 => Add new project\n2 => Go back"
            ch = gets.chomp
            case ch
            when "1"
                print " Name : "
                name = gets.chomp
                print " Description : "
                description = gets.chomp
                projects << Project.new({"name" => name, "description" => description}) if name != "" and description != "" 
            when "2"
                # TODO
            else
                puts "Wrong Choice"
            end
        end
        projects
    end

    #params => 
    #  projects: array of objects of Project 
    #returns => 
    #  projects: updated array of objects of Project
    def self.delete_from(projects)
        exit = false
        until exit do
            puts "\nSelect project to delete"
            length = projects.length
            projects.each_with_index do |project, index|
                puts " #{index+1} => #{project.name}"
                puts " #{index+2} => Go back" if index+1 == length
            end
            ch = gets.chomp
            ch = ch.to_i
            if ch <= length
                projects = projects - [projects[ch-1]]
                puts "Successfull.."
            elsif ch == length+1
                exit = true
            else
                puts "Wrong Choice"
            end
        end
        projects
    end

end