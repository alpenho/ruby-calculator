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
    it 'should call convert_to_float function' do
      expect(subject).to receive(:convert_to_float).with(['3']).and_return([3.0])
      subject.command('add 3')
    end

    it 'should run the command string and put that into history array' do
      expect(subject.command('add 3')).to eql(3.0)
      expect(subject.history).to eql(['add 3'])
      expect(subject.result).to eql(3.0)
    end

    context 'repeat' do
      it 'should call repeat function' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject).to receive(:repeat).with(2, nil)
        subject.command('repeat 2')
      end

      it 'should calculate correctly' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject.command('repeat 2')).to eql(16.0)
      end

      it 'should not put command string into history array' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject.command('repeat 2')).to eql(16.0)
        expect(subject.history).to eql(['add 3', 'add 5', 'repeat 2'])
      end

      it 'should calculate correctly with multiple repeat' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject.command('repeat 2')).to eql(16.0)
        expect(subject.command('add 2')).to eql(18.0)
        expect(subject.command('repeat 3')).to eql(33.0)
        expect(subject.command('repeat 4')).to eql(63.0)
      end
    end

    context 'cancel' do
      it 'should reset the result value and not put the command to history' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject.command('cancel')).to eql(0.0)
        expect(subject.history).to eql(['add 3', 'add 5'])
        expect(subject.result).to eql(0.0)
      end
    end
  end

  context 'convert_to_float' do
    it 'should return list of float number' do
      expect(subject.convert_to_float(['1', '2.4', '3'])).to eql([1.0, 2.4, 3.0])
    end

    it 'should return empty list when arguments is empty list' do
      expect(subject.convert_to_float([])).to eql([])
    end
  end
end