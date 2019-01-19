require 'spec_helper'
require './personal_details'

describe PersonalDetail do
    describe "#display" do
      it "prints the attributes of personal details" do
        personal_details = PersonalDetail.get({"name"=>"Vyga", "dob"=>"1st January 1994", "maritalStatus"=>"Single", "mobileNumber"=>"9876543210", "email"=>"vyga@email.com"})  
        personal_details.display
        expect{ personal_details.display }.to output("Personal Details\n  Name : Vyga\n  Date of Birth : 1st January 1994\n  Marital Status : Single\n  Mobile Number : 9876543210\n  Email : vyga@email.com\n").to_stdout  
      end
    end

    describe "#display" do
      it "prints nothing if an attribute is not present" do
        personal_details = PersonalDetail.get({"name"=>"Vyga", "maritalStatus"=>"Single", "mobileNumber"=>"9876543210", "email"=>"vyga@email.com"})  
        personal_details.display
        expect{ personal_details.display }.to output("Personal Details\n  Name : Vyga\n  Date of Birth : \n  Marital Status : Single\n  Mobile Number : 9876543210\n  Email : vyga@email.com\n").to_stdout
      end
    end

  end