
require './lib/certs'

begin
  importer = Certs::Import.new(ARGV[0])
  importer.run
  importer.domains.each { |domain| puts domain }
rescue; end # When importing you don't want to have a rescue in your logs.