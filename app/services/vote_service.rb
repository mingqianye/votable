class VoteService
  def initialize(vote_params)
    @answer_ids = vote_params[:answer_ids]
    @user_info = vote_params[:user_info]
  end

  def result
    puts "here"
    puts @user_info[:open_id]
    
    user = User.find_by_id(@user_info[:open_id]) || User.create
    @answer_ids.each do |answer_id|
      answer = Answer.find_by_id(answer_id)
      Vote.create(from_node: user, to_node: answer)
    end
    
    'ok'
  end
end
