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
        puts "  * #{education.institution_name} - #{education.type} \n    #{education.year_of_passing}"
    end
end
