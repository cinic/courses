class CourseType
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :title, type: String
  field :description, type: String
  validates_presence_of :name, :title, :description

  has_many :courses
  scope :named, ->(name){ where(name: name) }
  #accepts_nested_attributes_for :courses
end
