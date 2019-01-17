class Education
    attr_accessor :institution_name, :year_of_passing, :type

    def initialize(data)
        @institution_name = data.fetch("institutionName")
        @year_of_passing = data.fetch("yearOfPassing")
        @type = data.fetch("type")
    end

    def self.get(data)
        data.map{|education| new(education)}
    end

    def self.display(educations)
        puts "Education"
        educations.each do |education|
            education.display_each            
        end
    end

    def display_each
        puts "  * #{self.institution_name} - #{self.type} \n    #{self.year_of_passing}"
    end

    def add_to(educations)
        ch = "1"
        until ch == "2" do
            puts "\n1 => Add new education\n2 => Go back"
            ch = gets.chomp
            case ch
            when "1"
                print " Institution Name : "
                institution_name = gets.chomp
                print " Year Of Passing : "
                year_of_passing = gets.chomp
                print " Type : "
                type = gets.chomp
                educations << Education.new({"institutionName" => institution_name, "yearOfPassing" => year_of_passing, "type" => type}) if institution_name != "" and year_of_passing != "" and type != ""
            when "2"
                # TODO
            else
                puts "Wrong Choice"
            end
        end
        educations
    end

    def self.delete_from(educations)
        exit = false
        until exit do
            puts "\nSelect project to delete"
            length = educations.length
            educations.each_with_index do |education, index|
                puts " #{index+1} => #{education.name}"
                puts " #{index+2} => Go back" if index+1 == length
            end
            ch = gets.chomp
            ch = ch.to_i
            if ch <= length
                educations = educations - [educations[ch-1]]
                puts "Successfull.."
            elsif ch == length+1
                exit = true
            else
                puts "Wrong Choice"
            end
        end
        educations
    end

end
