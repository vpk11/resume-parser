class PersonalDetail
    
    attr_accessor :name, :dob, :marital_status, :mobile_number, :email 

    def initialize(data)
        @name = data.fetch("name")
        @dob = data.fetch("dob")
        @marital_status = data.fetch("maritalStatus")
        @mobile_number = data.fetch("mobileNumber")
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

    def update(options)
        self.name = options.fetch(:name) if options[:name] != nil
        self.dob = options.fetch(:dob) if options[:dob] != nil
        self.marital_status = options.fetch(:marital_status) if options[:marital_status] != nil
        self.mobile_number = options.fetch(:mobile_number) if options[:mobile_number] != nil
        self.email = options.fetch(:email) if options[:email] != nil
    end

    def edit
        puts "\nSelect field to edit  in Personal Details"
        ch = "1"
        until ch == "6" do
            puts " 1 => Name\n 2 => Date Of Birth\n 3 => Marital Status\n 4 => Mobile Number\n 5 => Email\n 6 => Exit"
            ch = gets.chomp
            case ch
            when "1"
                print " Name : "
                name = gets.chomp
                update({:name => name}) unless name == ""
            when "2"
                print " Date Of Birth : "
                dob = gets.chomp
                update({:dob => dob}) unless dob == ""
            when "3"
                print " Marital Status : "
                marital_status = gets.chomp
                update({:marital_status => marital_status}) unless marital_status == ""
            when "4"
                print " Mobile Number : "
                mobile_number = gets.chomp
                update({:mobile_number => mobile_number}) unless mobile_number == ""
            when "5"
                print " Email : "
                email = gets.chomp
                update({:email => email}) unless email == ""
            when "6"
                # TODO
            else
                puts "Wrong Choice"
            end
        end
    end

end