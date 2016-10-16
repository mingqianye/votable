class Survey < NodeBase
  has_many :out, :questions, type: 'HAS_QUESTION', unique: true, dependent: :destroy
  property :title,  type: String
end
