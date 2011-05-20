module MachinistCouchrestModel
  class Blueprint < Machinist::Blueprint

    # Make and save an object.
    def make!(attributes = {})
      object = make(attributes)
      object.save!
      object.reload
    end

    def lathe_class
      MachinistCouchrestModel::Lathe
    end

    def outside_transaction
    end
  end
end
