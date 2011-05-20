require 'machinist'
require "couchrest_model"

module MachinistCouchrestModel
  autoload "Blueprint", "machinist_couchrest_model/blueprint"
  autoload "Lathe", "machinist_couchrest_model/lathe"
end

require "couchrest/model/base"
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
