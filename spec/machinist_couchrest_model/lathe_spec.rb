require File.expand_path("../spec_helper", File.dirname(__FILE__))

require "couchrest_model"

describe MachinistCouchrestModel::Lathe do
  let(:model_class) do
    Class.new(CouchRest::Model::Base) do
      property :flavor, String
    end
  end

  subject {MachinistCouchrestModel::Lathe.new(model_class, 42, {:flavor => 'test'})}

  it "assign simple values" do
    subject.object.flavor.should == 'test'
  end

end
