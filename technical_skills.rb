class TechnicalSkill
    attr_accessor :name

    def initialize(data)
        @name = data["name"] || ""
    end

    #params => 
    #  data: array of hash
    #returns => 
    #  array of objects of TechnicalSkill
    def self.get(data)
        (data == nil) ? [] : data.map{|skill| new(skill)}
    end

    #params => 
    #  technical_skills: array of objects of TechnicalSkill 
    def self.display(technical_skills)
        puts "Technical Skills"
        technical_skills.each do |skill|
            skill.display_each
        end
    end

    
    #Displays the current technical skill attributes
    def display_each
        puts "  * #{self.name}"
    end

    #params => 
    #  technical_skills: array of objects of TechnicalSkill 
    #returns => 
    #  technical_skills: updated array of objects of TechnicalSkill
    def add_to(technical_skills)
        ch = "1"
        until ch == "2" do
            puts "\n1 => Add new technical skill\n2 => Go back"
            ch = gets.chomp
            case ch
            when "1"
                print " Name : "
                name = gets.chomp
                technical_skills << TechnicalSkill.new({"name" => name}) if name != ""
            when "2"
                # TODO
            else
                puts "Wrong Choice"
            end
        end
        technical_skills
    end

    #params => 
    #  technical_skills: array of objects of TechnicalSkill 
    #returns => 
    #  technical_skills: updated array of objects of TechnicalSkill
    def self.delete_from(technical_skills)
        exit = false
        until exit do
            puts "\nSelect technical skills to delete"
            length = technical_skills.length
            technical_skills.each_with_index do |technical_skill, index|
                puts " #{index+1} => #{technical_skill.name}"
                puts " #{index+2} => Go back" if index+1 == length
            end
            ch = gets.chomp
            ch = ch.to_i
            if ch <= length
                technical_skills = technical_skills - [technical_skills[ch-1]]
                puts "Successfull.."
            elsif ch == length+1
                exit = true
            else
                puts "Wrong Choice"
            end
        end
        technical_skills
    end

end