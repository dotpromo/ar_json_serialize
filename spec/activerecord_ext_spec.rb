require 'spec_helper'
describe ::ArJsonSerialize::ActiveRecordExt do
  it 'should extend ActiveRecord::Base' do
    ::ActiveRecord::Base.should respond_to(:json_serialize)
  end

  it 'should call ActiveRecord::Base.serialize' do
    ::ActiveRecord::Base.should_receive(:serialize).with('column', ::ArJsonSerialize::Serializer)
    ::ActiveRecord::Base.json_serialize('column')
  end
end