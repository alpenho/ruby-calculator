describe SimpleMathOperation do
  let(:dummy_class) { Class.new { extend SimpleMathOperation } }

  context 'add' do
    it 'should adding the number' do
      expect(dummy_class.add(1.0, 2.0)).to eql(3.0)
    end

    it 'should raise error when adding not number' do
      expect { dummy_class.add('1', '2') }.to raise_error(RuntimeError)
    end
  end
end