class Router < ActiveRecord::Base
  has_one :strength, dependent: :destroy, inverse_of: :router

  # attr_accessor :strength_attributes
  # attr_accessor :strength_id

  validates :name, presence: true, uniqueness:true
  validates :location, presence: true

  accepts_nested_attributes_for :strength, update_only: true#, allow_destroy: true


  def strength_id
    self.strength.try :id
  end

  def strength_id=(id)
    self.strength = Strength.find_by_id(id)
  end


  ############## Rails Admin Configuration ############
  rails_admin do

    edit do
      configure :strength do
        nested_form[:update_only] = false
      end
    end

    list do
      configure :strength do
        pretty_value do
            value.try(:strength)
        end
      end
      configure :created_at do
        hide
      end
      configure :updated_at do
        strftime_format "%m-%d-%Y"
      end
    end

    export do
      field :id
      field :name
      field :location
      field :strength
      exclude_fields_if do
        type == :datetime
      end
    end

    import do
      mapping_key :id
      default_excluded_fields [:created_at, :updated_at]
    end
  end

end
