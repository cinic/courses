class Answer
  include Mongoid::Document
  field :content, type: String
  field :right, type: Boolean, default: false

  embedded_in :question, :inverse_of => :answer
end
