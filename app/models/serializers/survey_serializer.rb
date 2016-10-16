class SurveySerializer
  def self.serialize(node)
    case node
    when Survey
      node.data_attributes.merge({
        "questions" => node.questions.map{|q| serialize(q)}
      })
    when Question
      node.data_attributes.merge({
        "answers" => node.answers.map{|a| serialize(a)}
      })
    when Answer
      node.data_attributes
    else
      raise "Survey Serializer cannot serialize #{node.class} object"
    end
  end
end
