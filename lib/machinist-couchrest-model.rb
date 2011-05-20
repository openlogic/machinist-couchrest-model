require 'machinist'

module MachinistCouchrestModel
  autoload "Blueprint", "machinist_couchrest_model/blueprint"
  autoload "Lathe", "machinist_couchrest_model/lathe"
end

module CouchRest #:nodoc:
  module Model #:nodoc:
    class Base #:nodoc:
      extend Machinist::Machinable

      def self.blueprint_class
        MachinistCouchrestModel::Blueprint
      end
    end
  end
end
