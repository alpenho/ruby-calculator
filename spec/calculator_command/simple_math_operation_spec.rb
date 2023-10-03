describe SimpleMathOperation do
  let(:dummy_class) { Class.new { extend SimpleMathOperation } }

  context 'add' do
    it 'should adding the number' do
      expect(dummy_class.add(1.0, 2.0)).to eql(3.0)
    end

    it 'should raise error when adding inputs not float' do
      expect { dummy_class.add(1, 2) }.to raise_error(RuntimeError)
    end
  end

  context 'subtract' do
    it 'should subtract the number' do
      expect(dummy_class.subtract(1.0, 2.0)).to eql(-1.0)
    end

    it 'should raise error when subtract inputs not float' do
      expect { dummy_class.subtract(1, 2) }.to raise_error(RuntimeError)
    end
  end

  context 'multiply' do
    it 'should multiply the number' do
      expect(dummy_class.multiply(0.5, 5.0)).to eql(2.5)
    end

    it 'should multiply the number even with multiple decimals' do
      expect(dummy_class.multiply(3.142589, 2.45638)).to eql(7.71939276782)
    end

    it 'should raise error when multiply inputs not float' do
      expect { dummy_class.multiply(1, 2) }.to raise_error(RuntimeError)
    end
  end

  context 'divide' do
    it 'should divide the number' do
      expect(dummy_class.divide(0.5, 5.0)).to eql(0.1)
    end

    it 'should divide the number even with multiple decimals' do
      expect(dummy_class.divide(3.142589, 2.45638)).to eql(1.2793578355140494)
    end

    it 'should raise error when divide by zero' do
      expect { dummy_class.divide(3.0, 0.0) }.to raise_error(ZeroDivisionError)
    end

    it 'should raise error when divide inputs not float' do
      expect { dummy_class.divide(1, 2) }.to raise_error(RuntimeError)
    end
  end

  context 'abs' do
    it 'should change the number to positive' do
      expect(dummy_class.abs(-34.23)).to eql(34.23)
    end

    it 'should not change the number if its already positive' do
      expect(dummy_class.abs(34.23)).to eql(34.23)
    end

    it 'should raise error when abs inputs not float' do
      expect { dummy_class.abs(2) }.to raise_error(RuntimeError)
    end
  end

  context 'neg' do
    it 'should negate the number from positive to negative' do
      expect(dummy_class.neg(34.23)).to eql(-34.23)
    end

    it 'should negate the number from negative to positive' do
      expect(dummy_class.neg(-34.23)).to eql(34.23)
    end

    it 'should raise error when neg inputs not float' do
      expect { dummy_class.neg(2) }.to raise_error(RuntimeError)
    end
  end
end