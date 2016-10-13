class Question < NodeBase
  has_many :out, :answers, type: 'HAS_ANSWER', unique: true
end
