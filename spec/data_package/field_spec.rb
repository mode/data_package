require 'spec_helper'

describe DataPackage::Field do
  let(:json) {
    {
      'name' => 'income',
      'type' => 'number',
      'title' => 'Personal Income',
      'description' => 'My Desc'
    }
  }

  it "should initialize and serialize" do
    field = DataPackage::Field.new(json)

    field.type.should == :number
    field.name.should == json['name']
    field.title.should == json['title']
    field.description.should == json['description']

    field.to_hash.should == json
    field.to_json.should == JSON.pretty_generate(field.to_hash)
  end

  it "should require a name" do
    field = DataPackage::Field.new
    field.missing_attributes.collect(&:name).should == [:name]
  end
end