class Strength < ActiveRecord::Base
  belongs_to :router, inverse_of: :strength, touch: true

  validates :strength, presence: true
  validates :router, presence: true, uniqueness:true



  ############## Rails Admin Configuration ############

  rails_admin do
    weight -1
    parent Router
    configure :router, :belongs_to_association

    configure :router do
      inline_add false
      inline_edit false
      searchable [{Router => :name}]
      queryable true
    end

    export do
      exclude_fields :id
      exclude_fields_if do
        type == :datetime
      end
    end

    import do
      exclude_fields :id
      exclude_fields_if do
        type == :datetime
      end
    end

  end

end
