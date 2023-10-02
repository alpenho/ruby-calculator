require 'ruby_calculator'

describe RubyCalculator do
  context 'initialize' do
    it 'should have result number zero' do
      expect(subject.result).to eql(0)
    end

    it 'should have empty history array command' do
      expect(subject.history).to be_an_instance_of(Array)
      expect(subject.history).to be_empty
    end
  end
end