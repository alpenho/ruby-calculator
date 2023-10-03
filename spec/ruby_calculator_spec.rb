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

    context 'ArgumentError raised' do
      it 'should rescue the error and return error message' do
        expect { subject.command('add 3 4') }.not_to raise_error
        expect(subject.command('add 3 4')).to eql('wrong number of arguments (given 3, expected 2)')
      end

      it 'should not put the command to history and result will still be the same as previous value' do
        expect(subject.command('add 3')).to eql(3.0)
        subject.command('add 3 4')
        expect(subject.history).to eql(['add 3'])
        expect(subject.result).to eql(3.0)
      end
    end

    context 'ZeroDivisionError raised' do
      it 'should rescue the error and return error message' do
        expect(subject.command('add 3')).to eql(3.0)
        expect { subject.command('divide 0') }.not_to raise_error
        expect(subject.command('divide 0')).to eql(SimpleMathOperation::ZERO_DIVISION_CUSTOM_ERROR)
      end

      it 'should not put the command to history and result will still be the same as previous value' do
        expect(subject.command('add 3')).to eql(3.0)
        subject.command('divide 0')
        expect(subject.history).to eql(['add 3'])
        expect(subject.result).to eql(3.0)
      end
    end

    context 'Math::DomainError raised' do
      it 'should rescue the error and return error message' do
        expect(subject.command('subtract 9')).to eql(-9.0)
        expect { subject.command('sqrt') }.not_to raise_error
        expect(subject.command('sqrt')).to eql('Numerical argument is out of domain - sqrt')
      end

      it 'should not put the command to history and result will still be the same as previous value' do
        expect(subject.command('subtract 9')).to eql(-9.0)
        subject.command('sqrt')
        expect(subject.history).to eql(['subtract 9'])
        expect(subject.result).to eql(-9.0)
      end
    end

    context 'NoMethodError raised' do
      it 'should rescue the error and return custom error message' do
        expect { subject.command('asd 3') }.not_to raise_error
        expect(subject.command('asd 3')).to eql(RubyCalculator::NO_METHOD_CUSTOM_MESSAGE)
      end

      it 'should not put the command to history and result will still be the same as previous value' do
        expect(subject.command('add 3')).to eql(3.0)
        subject.command('asd 3')
        expect(subject.history).to eql(['add 3'])
        expect(subject.result).to eql(3.0)
      end
    end

    context 'repeat' do
      it 'should call repeat function' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject).to receive(:repeat).with(nil, 2)
        subject.command('repeat 2')
      end

      it 'should calculate correctly' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject.command('repeat 2')).to eql(16.0)
      end

      it 'should not put repeated command string into history array' do
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
      it 'should call cancel function' do
        expect(subject.command('add 3')).to eql(3.0)
        expect(subject.command('add 5')).to eql(8.0)
        expect(subject).to receive(:cancel).with(8.0)
        subject.command('cancel')
      end

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

  context 'happy path test' do
    it 'should return all the expected value' do
      expect(subject.command('add 2')).to eql(2.0)
      expect(subject.command('neg')).to eql(-2.0)
      expect(subject.command('sqr')).to eql(4.0)
      expect(subject.command('multiply 2')).to eql(8.0)
      expect(subject.command('repeat 2')).to eql(128.0)
      expect(subject.command('divide 2')).to eql(64.0)
      expect(subject.command('sqrt')).to eql(8.0)
      expect(subject.command('cube')).to eql(512.0)
      expect(subject.command('cubert')).to eql(8.0)
      expect(subject.command('subtract 10')).to eql(-2.0)
      expect(subject.command('abs')).to eql(2.0)
      expect(subject.command('cancel')).to eql(0.0)
    end
  end
end