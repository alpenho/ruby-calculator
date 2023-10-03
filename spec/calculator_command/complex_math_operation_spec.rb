describe ComplexMathOperation do
  let(:dummy_class) { Class.new { extend ComplexMathOperation } }

  context 'sqrt' do
    it 'should square root the number' do
      expect(dummy_class.sqrt(4.0)).to eql(2.0)
    end

    it 'should raise error when square root inputs not float' do
      expect { dummy_class.sqrt(1) }.to raise_error(RuntimeError)
    end

    it 'should raise error when square root inputs is negative' do
      expect { dummy_class.sqrt(-1.0) }.to raise_error(Math::DomainError)
    end
  end

  context 'sqr' do
    it 'should raise the number to the power of 2' do
      expect(dummy_class.sqr(4.0)).to eql(16.0)
    end

    it 'should raise the number to the power of 2 even the input is negative' do
      expect(dummy_class.sqr(-4.0)).to eql(16.0)
    end

    it 'should raise error when square inputs not float' do
      expect { dummy_class.sqr(1) }.to raise_error(RuntimeError)
    end
  end

  context 'cubert' do
    it 'should cube root the number' do
      expect(dummy_class.cubert(27.0)).to eql(3.0)
    end

    it 'should cube root even the input is negative' do
      expect(dummy_class.cubert(-27.0)).to eql(-3.0)
    end

    it 'should raise error when cube root inputs not float' do
      expect { dummy_class.cubert(1) }.to raise_error(RuntimeError)
    end
  end

  context 'cube' do
    it 'should raise the number to the power of 3' do
      expect(dummy_class.cube(4.0)).to eql(64.0)
    end

    it 'should raise the number to the power of 3 even the input is negative' do
      expect(dummy_class.cube(-4.0)).to eql(-64.0)
    end

    it 'should raise error when cube inputs not float' do
      expect { dummy_class.cube(1) }.to raise_error(RuntimeError)
    end
  end
end
