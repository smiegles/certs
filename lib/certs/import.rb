module Certs
  class Import
    def initialize(input)
      @input = input
      file_exists?(@input)
    end

    def run
      @cert = Certs::Parse.new(@input)
    end

    def domains
      @cert.domains
    end

    private

    def file_exists?(file)
      raise "File #{file} doesn't exist." unless File.file?(file)
    end
  end
end
