class Resume
    def initialize(data)
        @personal_details = PersonalDetail.get(resume_data.fetch("personalDetails"))
        @work_experiences = WorkExperience.get(resume_data.fetch("workExperiences"))
        @projects = Project.get(resume_data.fetch("projects"))
        @technical_skills = TechnicalSkill.get(resume_data.fetch("technicalSkills"))
        @educations = Education.get(resume_data.fetch("education"))
        show_menu
    end

    private
    def show_menu
        exit = false
        until exit do
            puts "1 => View Resume"
            puts "2 => Modify Resume"
            puts "3 => Exit"
            print "Enter your choice(1 or 2) : "
            choice = gets
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
        until exit do
            puts "Modify : "
            puts "Select Operation: 1 => Add, 2 => Delete or 3 => Go back to main menu"
            choice = gets
            if choice == "1"
                puts "Select the segment to which add new details"
                part_menu
                c = gets

            elsif choice == "2"
                part_menu
            else

            end
        end
    end

    def part_menu
        puts "  1 => Personal Details"
        puts "  2 => Work Experience"
        puts "  3 => Projects"
        puts "  4 => Technical Skills"
        puts "  5 => Education"
    end

end