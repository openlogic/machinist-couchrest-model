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
