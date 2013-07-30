require 'spec_helper'
describe ::ArJsonSerialize::Serializer do
  %w(dump load).each do |k|
    it { should respond_to(k.to_sym) }
  end

  context '#load' do
    it 'should call MultiJson.load' do
      ::MultiJson.should_receive(:load).with('string')
      subject.load('string')
    end

    [nil, ''].each do |k|
      it "should not call MultiJson.load if string is #{k.inspect}" do
        ::MultiJson.should_not_receive(:load)
        subject.load(k)
      end

      it "should return empty if string is #{k.inspect}" do
        subject.load(k).should == ''
      end

    end

    context 'content is' do
      subject { ::ArJsonSerialize::Serializer.load(data) }

      context 'String "foo"' do
        let(:data) { '"foo"' }
        it { should be_a(::String) }
        it { should == 'foo' }
      end

      context 'Hash {"key1":"value1"}' do
        let(:data) { '{"key1":"value1"}' }
        it { should be_a(::Hashie::Mash) }
        it { should == {'key1' => 'value1'} }
        its(:key1) { should == 'value1' }
      end

      context 'Array' do
        context '["1", "2", "3"]' do
          let(:data) { '["1","2","3"]' }
          it { should be_a(::Array) }
          it { should == %w(1 2 3)}
        end

        context '["1","2","3",{"key1":"value1"}]' do
          let(:data) { '["1","2","3",{"key1":"value1"}]' }
          it { should be_a(::Array) }
          it { should == ['1', '2', '3', {"key1"=>"value1"}] }
          its(:last) { should be_a(::Hashie::Mash) }
        end

      end

    end

  end

  context '#dump' do
    it 'should call MultiJson.dump' do
      ::MultiJson.should_receive(:dump).with('foo')
      subject.dump('foo')
    end
  end

end