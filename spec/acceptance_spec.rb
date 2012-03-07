require File.expand_path("./spec_helper", File.dirname(__FILE__))

require "couchrest_model"

module ::MachinistCouchrestModel::Spec
end

describe "couchrest model blueprints" do 
  
  # class ::CouchRestModelBlueprintsTestCounterModel < CouchRest::Model::Base
  #   property :count, Integer
  # end

  let(:namespace) { 
    ns_name = example.metadata[:full_description].gsub(/[^a-zA-Z]+/,'_').camelize
    eval "module ::#{ns_name}; self; end"
  }

  let(:counter_class) {
    klass = Class.new(CouchRest::Model::Base) do 
      property :count, Integer
    end.tap do |klass| 
      namespace.const_set 'Counter', klass
    end
  }

  let(:model_class) {
    counter_class = self.counter_class
    Class.new(CouchRest::Model::Base) do
      property :flavor, String
      belongs_to :counter, class_name: counter_class #CouchRestModelBlueprintsTestCounterModel
    end.tap do |klass| 
      namespace.const_set 'Model', klass
    end
    
  }

  context "no default counter" do
    before do 
      model_class.blueprint do 
        flavor { "vanilla" }
        counter { nil }
      end

      counter_class.blueprint do 
        count { 0 }
      end
    end
    
    it "allows creation of object with default values" do 
      model_class.make.flavor.should == 'vanilla'
    end
    
    it "allows creation of object with explicit simple values" do 
      model_class.make(flavor: 'blue').flavor.should == 'blue'
    end

    it "allows creation of object with explicit association values" do
      model_class.make(counter: counter_class.make).counter.should_not be_nil
    end
  end


  context "using #make in blueprint associations" do 
    before do 
      counter_class = self.counter_class
      model_class.blueprint do 
        flavor { "vanilla" }
        counter { counter_class.make }
      end

      counter_class.blueprint do 
        count { 0 }
      end
    end

    it "allows creation of object with default values" do 
      model_class.make.flavor.should == 'vanilla'
    end

  end
end
