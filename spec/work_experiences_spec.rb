require 'spec_helper'
require './work_experiences'

describe WorkExperience do

    describe ".get" do
        it "returns array of work experience objects" do
            expr = [{"experience" => "2 years", "companyName" => "XYZ Technologies"}, {"experience" => "3 years", "companyName" => "YXZ Technologies"}, {"experience" => "4 years", "companyName" => "ZXY Technologies"}]
            work_experiences = WorkExperience.get(expr)
            expect(work_experiences.class.to_s).to eq("Array")
        end
    end

    describe "#display_each" do
        it "displays each work experience" do
            work_experience = WorkExperience.new({"experience" => "2 years", "companyName" => "XYZ Technologies"})
            work_experience.display_each
            expect{ work_experience.display_each }.to output("  * 2 years experience at XYZ Technologies\n").to_stdout
        end
    end
    describe ".display" do
        it "displays each work experiences" do
            expr = [{"experience" => "2 years", "companyName" => "XYZ Technologies"}, {"experience" => "3 years", "companyName" => "YXZ Technologies"}, {"experience" => "4 years", "companyName" => "ZXY Technologies"}]
            work_experiences = WorkExperience.get(expr)
            WorkExperience.display(work_experiences)
            expect{ WorkExperience.display(work_experiences) }.to output("Work Experiences\n  * 2 years experience at XYZ Technologies\n  * 3 years experience at YXZ Technologies\n  * 4 years experience at ZXY Technologies\n").to_stdout
        end
    end
end
 