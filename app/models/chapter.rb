class Chapter
  include Mongoid::Document
  field :title, type: String
  field :content, type: String

  embedded_in :course, :inverse_of => :chapter
  embeds_many :questions
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
