class TechnicalSkill
    attr_accessor :name

    def initialize(data)
        @name = data.fetch("name")
    end

    def self.get(data)
        data.map{|skill| new(skill)}
    end

    def self.display(technical_skills)
        puts "Technical Skills"
        technical_skills.each do |skill|
            skill.display_each
        end
    end

    def display_each
        puts "  * #{self.name}"
    end

end