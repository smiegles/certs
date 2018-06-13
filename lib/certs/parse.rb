module Certs
  class Parse
    attr_reader :subject

    def initialize(path)
      @path = path
      raise "Can't read file #{path}" unless verify_path?
      @cert = OpenSSL::X509::Certificate.new File.read(@path)
      parse_subject
    end

    def domains
      alt_names.push(common_name).uniq
    end

    def common_name
      @subject['CN'] || []
    end

    def alt_names
      return [] unless @subject.include?('subjectAltName')
      altnames = []
      @subject['subjectAltName'].split(',').each do |string|
        key, value = string.split(':')
        altnames.push(value) if key == 'DNS'
      end
      altnames
    end

    private

    def parse_subject
      @subject = {}
      subject = @cert.subject.to_s.split('/')
      subject.each do |string|
        key, value = string.split('=')
        next if key.nil?
        @subject[key] = value
      end
    end

    def verify_path?
      File.file?(@path)
    end
  end
end
