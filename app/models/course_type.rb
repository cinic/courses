class CourseType
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  validates_presence_of :name, :description

  has_many :courses
  scope :named, ->(name){ where(name: name) }
  #accepts_nested_attributes_for :courses
end
