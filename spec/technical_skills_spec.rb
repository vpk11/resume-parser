require 'spec_helper'
require './technical_skills'

describe TechnicalSkill do

    describe ".get" do
        it "returns array of technical skill objects" do
            tech_skills_array_hash = [{"name" => "Ruby"}, {"name" => "Java"}]
            technical_skills = TechnicalSkill.get(tech_skills_array_hash)
            expect(technical_skills.class.to_s).to eq("Array")
        end
    end

    describe "#display_each" do
        it "displays a technical skill object" do
            technical_skill = TechnicalSkill.new({"name" => "Ruby"})
            technical_skill.display_each
            expect{ technical_skill.display_each }.to output("  * Ruby\n").to_stdout
        end
    end
    describe ".display" do
        it "displays each technical skill" do
            tech_skills_array_hash = [{"name" => "Ruby"}, {"name" => "Java"}]
            technical_skills = TechnicalSkill.get(tech_skills_array_hash)
            TechnicalSkill.display(technical_skills)
            expect{ TechnicalSkill.display(technical_skills) }.to output("Technical Skills\n  * Ruby\n  * Java\n").to_stdout
        end
    end
end
 