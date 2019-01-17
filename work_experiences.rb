class WorkExperience
    attr_accessor :experience, :company_name

    def initialize(data)
        @experience = data.fetch("experience")
        @company_name = data.fetch("companyName")
    end

    def self.get(data)
        data.map{|work_experience| new(work_experience)}
    end

    def self.display(work_experiences)
        puts "Work Experiences"
        work_experiences.each do |work_experience|
            work_experience.display_each
        end
    end

    def display_each
        puts "  * #{self.experience} experience at #{self.company_name}"
    end

    def self.add_to(work_experiences)
        ch = "1"
        until ch == "2" do
            puts "\n1 => Add new work experience\n2 => Go back"
            ch = gets.chomp
            case ch
            when "1"
                print " Experience : "
                experience = gets.chomp
                print " Company Name : "
                company_name = gets.chomp
                work_experiences << new({"experience" => experience, "companyName" => company_name}) if experience != "" and company_name != "" 
            when "2"
                # TODO
            else
                puts "Wrong Choice"
            end
        end
        work_experiences
    end

    def self.delete_from(work_experiences)
        exit = false
        until exit do
            puts "\nSelect work experience to delete"
            length = work_experiences.length
            work_experiences.each_with_index do |work_experience, index|
                puts " #{index+1} => #{work_experience.company_name}"
                puts " #{index+2} => Go back" if index+1 == length
            end
            ch = gets.chomp
            ch = ch.to_i
            if ch <= length
                work_experiences = work_experiences - [work_experiences[ch-1]]
                puts "Successfull.."
            elsif ch == length+1
                exit = true
            else
                puts "Wrong Choice"
            end
        end
        work_experiences
    end


end