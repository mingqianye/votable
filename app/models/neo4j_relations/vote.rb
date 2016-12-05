class Vote < RelationBase
  type 'VOTE_FOR'
  from_class :User
  to_class :Answer
  creates_unique
end
