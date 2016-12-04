class SurveyPresenter
  def initialize(survey)
    @survey = survey
  end

  def to_h
    {
      id: id,
      title: title,
      subtitle: subtitle,
      total_num_votes: total_num_votes,
      updated_at: updated_at,
      topic: topic,
      user_info: user_info
    }
  end

  private
  def topic
    {
      icon_url: 'https://qph.ec.quoracdn.net/main-thumb-2609281-200-fxgbotgjrzbyzvspikzhsdavmcnxswdf.jpeg',
      text: '体育'
    }
  end

  def id
    @survey.id
  end

  def title
    @survey.title
  end

  def subtitle
    @survey.subtitle
  end

  def total_num_votes
    -1
  end

  def updated_at
    @survey.updated_at
  end

  def user_info
    'user_info_block'
  end
end
