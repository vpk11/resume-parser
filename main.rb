class Main

    def initialize
        @resume_data = File.read('resume.json')
        build_hash_from_json
        @resume = Resume.new(@resume_data)
    end

    private

    def build_hash_from_json
        @resume_data = @resume_data.gsub(':', '=>')
        @resume_data = eval(@resume_data)
    end

end