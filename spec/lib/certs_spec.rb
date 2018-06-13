require_relative '../../lib/certs'

Parse = Certs::Parse

describe Parse do
  describe 'VERSION' do
    it 'returns the version number' do
      expect(Certs::VERSION).to eq('0.0.1')
    end
  end

  describe '.domains' do
    it '.der cert with alternative domains' do
      parser = Certs::Parse.new('./spec/samples/alt_names_cert.der')
      expect(parser.domains).to eq(['cs-stage-home02.qwilt.com', 'cs-stage-home02.op.qwilt.com'])
    end

    it '.der cert with no alternative domains' do
      parser = Certs::Parse.new('./spec/samples/cert.der')
      expect(parser.domains).to eq(['*.pype.tech'])
    end
  end
end
