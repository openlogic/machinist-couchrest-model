module MachinistCouchrestModel
  class Blueprint < Machinist::Blueprint

    # Make and save an object.
    def make!(attributes = {})
      object = make(attributes)
      object.save!
      object.reload
      object.after_initialize if object.respond_to?(:after_initialize)
      object
    end

    def lathe_class
      MachinistCouchrestModel::Lathe
    end

    def outside_transaction
    end
  end
end
