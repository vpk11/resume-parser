require 'spec_helper'
require './educations'

describe Education do

    describe ".get" do
        it "returns array of education objects" do
            educations_array_hash = [{"institutionName" => "XYZ School ", "yearOfPassing" => "2011", "type" => "Secondary"}, {"institutionName" => "YXZ School", "yearOfPassing" => "2013", "type" => "Higher Secondary"}]
            educations = Education.get(educations_array_hash)
            expect(educations.class.to_s).to eq("Array")
        end
    end

    describe "#display_each" do
        it "displays an education object" do
            education = Education.new({"institutionName" => "XYZ School", "yearOfPassing" => "2011", "type" => "Secondary"})
            education.display_each
            expect{ education.display_each }.to output("  * XYZ School - Secondary \n    2011\n").to_stdout
        end
    end
    describe ".display" do
        it "displays each education" do
            educations_array_hash = [{"institutionName" => "XYZ School", "yearOfPassing" => "2011", "type" => "Secondary"}, {"institutionName" => "YXZ School", "yearOfPassing" => "2013", "type" => "Higher Secondary"}]
            educations = Education.get(educations_array_hash)
            Education.display(educations)
            expect{ Education.display(educations) }.to output("Education\n  * XYZ School - Secondary \n    2011\n  * YXZ School - Higher Secondary \n    2013\n").to_stdout
        end
    end
end
 