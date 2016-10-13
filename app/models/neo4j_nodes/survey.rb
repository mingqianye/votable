class Survey < NodeBase
  has_many :out, :questions, type: 'HAS_QUESTION', unique: true
end
