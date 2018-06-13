require './lib/certs'

importer = Certs::Import.new(ARGV[0])
importer.run
puts importer.domains
