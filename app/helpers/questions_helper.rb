module QuestionsHelper
  def question_length(question)
    question.test.questions.count
  end
end
