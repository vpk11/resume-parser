require_relative('personal_details.rb')
require_relative('work_experiences.rb')
require_relative('projects.rb')
require_relative('technical_skills.rb')
require_relative('educations.rb')
class Resume

    attr_accessor :personal_details, :work_experiences, :projects, :technical_skills, :educations

    def initialize(data)
        @personal_details = PersonalDetail.get(data.fetch("personalDetails"))
        @work_experiences = WorkExperience.get(data.fetch("workExperiences"))
        @projects = Project.get(data.fetch("projects"))
        @technical_skills = TechnicalSkill.get(data.fetch("technicalSkills"))
        @educations = Education.get(data.fetch("education"))
    end

    def show_menu
        exit = false
        until exit do
            puts "1 => View Resume"
            puts "2 => Modify Resume"
            puts "3 => Save Changes(if any) and Exit"
            print "Enter your choice : "
            choice = gets.chomp
            if choice == "1"
                print_resume
            elsif choice == "2" 
                modify_resume
            elsif choice == "3"
                puts "Thank You! Have a great day"
                exit = true
            else
                puts "Wrong Choice Try again"
            end
        end
    end

    private

    def print_resume
        # Personal Details
        @personal_details.display
        # Work Experiences
        WorkExperience.display(@work_experiences)
        # Projects
        Project.display(@projects)
        #Technical Skills
        TechnicalSkill.display(@technical_skills)
        # Education
        Education.display(@educations)
    end

    def modify_resume
        choice = "1"
        until choice == "3" do
            puts "Modify : "
            puts "Select Operation: 1 => Add/Edit, 2 => Delete or 3 => Go back to main menu"
            choice = gets.chomp
            if choice == "1"
                add_or_edit
            elsif choice == "2"
                
            elsif choice == "3"

            else
                puts "Wrong Choice"
            end
        end
    end

    def add_or_edit
        puts "Select the segment to which add new details"
        c = "1"
        until c == "6" do
            add_or_edit_menu
            c = gets.chomp
            case c
            when "1"
                @personal_details.edit
            when "2"
                @work_experiences = WorkExperience.add_to(@work_experiences)
            when "3"
                @projects = Project.add_to(@projects)
            when "4"
                @technical_skills = TechnicalSkill.add_to(@technical_skills)
            when "5"
                @educations = Education.add_to(@educations)
            when "6"
                
            else
                puts "Wrong Choice"
            end
        end        
    end

    def add_or_edit_menu
        puts "  1 => Personal Details"
        puts "  2 => Work Experience"
        puts "  3 => Projects"
        puts "  4 => Technical Skills"
        puts "  5 => Education"
        puts "  6 => Exit"
    end

    def delete
        puts "Select the segment to delete new details"
        c = "1"
        until c == "5" do
            delete_menu
            c = gets.chomp
            case c
            when "1"
                @work_experiences = WorkExperience.delete_from(@work_experiences)
            when "2"
                @projects = Project.delete_from(@projects)
            when "3"
                @technical_skills = TechnicalSkill.delete_from(@projects)
            when "4"
                @educations = Education.delete_from(@educations)
            when "5"

            else
                puts "Wrong Choice"
            end
        end
    end

    def delete_menu
        puts "  1 => Work Experience"
        puts "  2 => Projects"
        puts "  3 => Technical Skills"
        puts "  4 => Education"
        puts "  5 => Exit"
    end

end