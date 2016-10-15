class Survey < NodeBase
  has_many :out, :questions, type: 'HAS_QUESTION', unique: true, dependent: :destroy

  property :title,  type: String

  def to_hash
    data_attributes.merge({
      questions: questions.map(&:to_hash)
    })
  end
end
