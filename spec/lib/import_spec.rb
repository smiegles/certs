require_relative '../../lib/certs'

Import = Certs::Import

describe Import do
  describe '.initialize' do
    it 'Raises an error because the file doesn\'t exist' do
      expect { Import.new('1') }.to raise_error(RuntimeError)
    end

    it 'Raises no error because the file does exist' do
      expect { Import.new('./spec/samples/cert.der') }.to_not raise_error(RuntimeError)
    end
  end

  describe '.run' do
    it 'runs the file' do
      import = Import.new('./spec/samples/cert.der')
      import.run
    end
  end

  describe '.domains' do

    let(:alternative_domains) { ['cs-stage-home02.qwilt.com', 'cs-stage-home02.op.qwilt.com'] }
    let(:no_alternative_domains) { ['*.pype.tech'] }

    it 'runs a file with alternative names' do
      import = Import.new('./spec/samples/alt_names_cert.der')
      import.run
      expect(import.domains).to eq(alternative_domains)
    end

    it 'runs a file with no alternative names' do
      import = Import.new('./spec/samples/cert.der')
      import.run
      expect(import.domains).to eq(no_alternative_domains)
    end
  end
end
