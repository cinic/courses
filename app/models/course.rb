class Course
  include Mongoid::Document
  include Mongoid::Slug

  field :title, type: String
  field :description, type: String
  validates_presence_of :title

  belongs_to :course_type
  slug :title, history: true, scope: :course_type

  scope :typed, ->(course_type_id){ where(course_type_id: course_type_id) }
  embeds_many :chapters
  accepts_nested_attributes_for :chapters, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :course_type
  
end
