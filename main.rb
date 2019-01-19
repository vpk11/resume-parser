require_relative('resume.rb')
class Main

    #Build resume data as hash from string of json from resume.json
    def self.build_hash_from_json
        @resume_data = @resume_data.gsub(':', '=>')
        @resume_data = eval(@resume_data)
    end

    #Save modified resume data back to resume.json file
    def self.save_resume_data
        personal_details_data = {"name" => @resume.personal_details.name, "dob" => @resume.personal_details.dob, "maritalStatus" => @resume.personal_details.marital_status, "mobileNumber" => @resume.personal_details.mobile_number, "email" => @resume.personal_details.email}
        work_experiences_data = @resume.work_experiences.map{|work_experience| {"experience" => work_experience.experience, "companyName" => work_experience.company_name}}
        projects_data = @resume.projects.map{|project| {"name" => project.name, "description" => project.description}}
        technical_skills_data = @resume.technical_skills.map{|technical_skill| {"name" => technical_skill.name} }
        educations_data = @resume.educations.map{|education| {"institutionName" => education.institution_name, "yearOfPassing" => education.year_of_passing, "type" => education.type} }
        data_hash = {"personalDetails" => personal_details_data, "workExperiences" => work_experiences_data, "projects" => projects_data, "technicalSkills" => technical_skills_data, "education" => educations_data}
        data_hash = data_hash.to_s.gsub("=>", ":")
        File.write('resume.json', data_hash)
    end

    #Starting point of execution
    #Reads the resume.json file
    #Builds resume object from the data obtained from resume.json
    #Saves the data back to resume.json
    def self.start
        @resume_data = File.read('resume.json')
        build_hash_from_json
        @resume = Resume.new(@resume_data)
        @resume.show_menu
        save_resume_data
    end

    start
end