class SurveySerializer
  def self.serialize(node)
    case node
    when Survey
      shallow_serialize(node).merge({
        "questions" => node.questions.map{|q| serialize(q)}
      })
    when Question
      shallow_serialize(node).merge({
        "answers" => node.answers.map{|a| serialize(a)}
      })
    when Answer
      shallow_serialize(node)
    else
      raise "Survey Serializer cannot serialize #{node.class} object"
    end
  end

  private
  def self.shallow_serialize(node)
    node.attributes
        .except('updated_at', 'created_at')
        .merge('uuid' => node.uuid)
        .delete_if{|k, v| v.blank?}
  end
end
