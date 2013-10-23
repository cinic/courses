class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String

  embedded_in :course, :inverse_of => :question
  embeds_many :answers
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
