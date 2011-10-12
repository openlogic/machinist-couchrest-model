require 'couchrest/model/property_protection'

module CouchRest
  module Model
    module PropertyProtection
      extend ActiveSupport::Concern

      # override attribute protection for Machinist, making all attributes available for mass assignment

      module ClassMethods
        def accessible_properties
          props = properties
        end

        def protected_properties
          []
        end
      end

    end
  end
end

