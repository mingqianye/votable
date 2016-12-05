class Answer < NodeBase
  property :text, type: String
  property :label, type: String
  has_many :in, :voters, rel_class: :Vote, model_class: :User
end
