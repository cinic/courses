class Chapter
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :title, type: String
	field :content, type: String

	embedded_in :course, :inverse_of => :chapter
end
