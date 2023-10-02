describe RubyCalculator do
  context 'initialize' do
    it 'should have result decimal zero' do
      expect(subject.result).to eql(0.0)
    end

    it 'should have empty history array command' do
      expect(subject.history).to be_an_instance_of(Array)
      expect(subject.history).to be_empty
    end
  end

  context 'command' do
    it 'should put command string into history array' do
      expect(subject.command('add 3')).to eql(3.0)
      expect(subject.history).to eql(['add 3'])
    end
  end

  context 'convert_to_float' do
    it 'should return list of float number' do
      expect(subject.convert_to_float!(['1', '2.4', '3'])).to eql([1.0, 2.4, 3.0])
    end

    it 'should return empty list when arguments is empty list' do
      expect(subject.convert_to_float!([])).to eql([])
    end
  end
end