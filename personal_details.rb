class PersonalDetail
    
    attr_accessor :name, :dob, :maritalStatus, :mobile_number, :email 

    def initialize(data)
        @name = data.fetch("name")
        @dob = data.fetch("dob")
        @marital_status = data.fetch("maritalStatus")
        @mobile_number = data.fetch("mobile_number")
        @email = data.fetch("email")
    end

    def self.get(data)
        new(data)
    end

    def display
        puts "Personal Details"
        puts "  Name : #{self.name}"
        puts "  Date of Birth : #{self.dob}"
        puts "  Marital Status : #{self.marital_status}"
        puts "  Mobile Number : #{self.mobile_number}"
        puts "  Email : #{self.email}"
    end

end