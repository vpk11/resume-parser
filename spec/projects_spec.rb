require 'spec_helper'
require './projects'

describe Project do

    describe ".get" do
        it "returns array of project objects" do
            projects_array_hash = [{"name" => "Project XYZ", "description" => "Some description"}, {"name" => "Project YXZ", "description" => "Some other description"}]
            projects = Project.get(projects_array_hash)
            expect(projects.class.to_s).to eq("Array")
        end
    end

    describe "#display_each" do
        it "displays a project object" do
            project = Project.new({"name" => "Project XYZ", "description" => "Some description"})
            project.display_each
            expect{ project.display_each }.to output("  * Project XYZ: Some description\n").to_stdout
        end
    end
    describe ".display" do
        it "displays each project" do
            projects_array_hash = [{"name" => "Project XYZ", "description" => "Some description"}, {"name" => "Project YXZ", "description" => "Some other description"}]
            projects = Project.get(projects_array_hash)
            Project.display(projects)
            expect{ Project.display(projects) }.to output("Projects\n  * Project XYZ: Some description\n  * Project YXZ: Some other description\n").to_stdout
        end
    end
end
 