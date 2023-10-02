describe CalculatorCommand do
  context 'command' do
    context 'when operation string is handled' do
      it 'should not raise an error' do
        expect { subject.command('add', [1.0, 2.0]) }.not_to raise_error
      end

      context 'when add command inputs length is not 2' do
        it 'should raise an error when inputs length is 3' do
          expect { subject.command('add', [1.0, 2.0, 3.0]) }.to raise_error(ArgumentError)
        end

        it 'should raise an error when inputs length is 1' do
          expect { subject.command('add', [1.0]) }.to raise_error(ArgumentError)
        end
      end
    end

    context 'when operation string is not handled' do
      it 'should raise an error' do
        expect { subject.command('testing', [1.0, 2.0]) }.to raise_error(NoMethodError)
      end
    end
  end
end