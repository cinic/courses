class Course
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  field :level, type: Integer
  field :position, type: Integer
  validates_presence_of :title, :course_type_id

  belongs_to :course_type
  slug :title, history: true, scope: :course_type

  scope :typed, ->(course_type_id){ where(course_type_id: course_type_id) }
  embeds_many :chapters
  embeds_many :questions

  accepts_nested_attributes_for :chapters, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :course_type
  
end
