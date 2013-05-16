class Answer
  include Mongoid::Document
  field :content, type: String

  embedded_in :question, :inverse_of => :answer
end
