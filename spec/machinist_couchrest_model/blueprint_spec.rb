require File.expand_path("../spec_helper", File.dirname(__FILE__))
require 'machinist_couchrest_model/blueprint'

describe MachinistCouchrestModel::Blueprint do
  subject {MachinistCouchrestModel::Blueprint.new(String)}
  it "knows correct lathe class" do
    subject.lathe_class.should == MachinistCouchrestModel::Lathe
  end
end
