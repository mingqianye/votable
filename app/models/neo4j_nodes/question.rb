class Question < NodeBase
  has_many :out, :answers, type: 'HAS_ANSWER', unique: true, dependent: :destroy
  property :text,  type: String

  def to_hash
    data_attributes.merge({
      answers: answers.map(&:data_attributes)
    })
  end
end
