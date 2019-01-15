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


end