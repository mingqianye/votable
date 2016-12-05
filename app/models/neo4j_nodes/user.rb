class User < NodeBase
  has_many :out, :surveys, type: 'CREATED_SURVEY', unique: true
  has_many :out, :answers, rel_class: :Vote, model_class: :Answer

  property :wechat_id,  type: String, index: :exact
  property :gender,     type: String #['M', 'F']
  property :country,    type: String
  property :province,   type: String
  property :city,       type: String
  property :avatar_url, type: String
  property :nick_name,  type: String
  property :last_seen,  type: DateTime


end
