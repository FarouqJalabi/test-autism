# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
neo_60 =[
  # Neuroticism
# { content: "Worry about things.", category: "Neuroticism" },
#   { content: "Get stressed out easily.", category: "Neuroticism" },
#   { content: "Get angry easily.", category: "Neuroticism" },
#   { content: "Lose my temper.", category: "Neuroticism" },
#   { content: "Often feel blue.", category: "Neuroticism" },
#   { content: "Dislike myself.", category: "Neuroticism" },
#   { content: "Find it difficult to approach others.", category: "Neuroticism" },
#   { content: "Am easily intimidated.", category: "Neuroticism" },
#   { content: "Rarely overindulge.", category: "Neuroticism", negative_key: true },
#   { content: "Am able to control my cravings.", category: "Neuroticism", negative_key: true },
#   { content: "Remain calm under pressure.", category: "Neuroticism", negative_key: true },
#   { content: "Am calm even in tense situations.", category: "Neuroticism", negative_key: true },

# Extraversion
{ content: "Make friends easily.", category: "Extraversion" },
  { content: "Act comfortably with others.", category: "Extraversion" },
  { content: "Love large parties.", category: "Extraversion" },
  { content: "Avoid crowds.", category: "Extraversion", negative_key: true },
  # { content: "Take charge.", category: "Extraversion" },
  # { content: "Try to lead others.", category: "Extraversion" },
  # { content: "Am always busy.", category: "Extraversion" },
  # { content: "Am always on the go.", category: "Extraversion" },
#   { content: "Love excitement.", category: "Extraversion" },
#   { content: "Seek adventure.", category: "Extraversion" },
#   { content: "Have a lot of fun.", category: "Extraversion" },
#   { content: "Love life.", category: "Extraversion" },
#
# Openness to Experience
# { content: "Have a vivid imagination.", category: "Openness to Experience" },
  # { content: "Love to daydream.", category: "Openness to Experience" },
  # { content: "Believe in the importance of art.", category: "Openness to Experience" },
  # { content: "Do not like art.", category: "Openness to Experience", negative_key: true },
  # { content: "Experience my emotions intensely.", category: "Openness to Experience" },
  # { content: "Am not easily affected by my emotions.", category: "Openness to Experience", negative_key: true },
  { content: "Prefer to stick with things that I know.", category: "Openness to Experience", negative_key: true },
  { content: "Don’t like the idea of change.", category: "Openness to Experience", negative_key: true },
  { content: "Avoid philosophical discussions.", category: "Openness to Experience", negative_key: true },
  { content: "Am not interested in theoretical discussions.", category: "Openness to Experience", negative_key: true },
  # { content: "Tend to vote for liberal political candidates.", category: "Openness to Experience" },
  # { content: "Believe in one true religion.", category: "Openness to Experience", negative_key: true },

# Agreeableness
{ content: "Trust others.", category: "Agreeableness" },
  { content: "Believe that others have good intentions.", category: "Agreeableness" },
  { content: "Cheat to get ahead.", category: "Agreeableness", negative_key: true },
  # { content: "Take advantage of others.", category: "Agreeableness", negative_key: true },
  # { content: "Love to help others.", category: "Agreeableness" },
  # { content: "Am concerned about others.", category: "Agreeableness" },
  # { content: "Insult people.", category: "Agreeableness", negative_key: true },
  # { content: "Get back at others.", category: "Agreeableness", negative_key: true },
  # { content: "Believe that I am better than others.", category: "Agreeableness", negative_key: true },
  # { content: "Think highly of myself.", category: "Agreeableness", negative_key: true },
  { content: "Sympathize with the homeless.", category: "Agreeableness" },
  { content: "Feel sympathy for those who are worse off than myself.", category: "Agreeableness" },

# Conscientiousness
# { content: "Handle tasks smoothly.", category: "Conscientiousness" },
#   { content: "Know how to get things done.", category: "Conscientiousness" },
#   { content: "Like order.", category: "Conscientiousness" },
#   { content: "Leave a mess in my room.", category: "Conscientiousness", negative_key: true },
#   { content: "Tell the truth.", category: "Conscientiousness" },
#   { content: "Break my promises.", category: "Conscientiousness", negative_key: true },
#   { content: "Work hard.", category: "Conscientiousness" },
#   { content: "Set high standards for myself and others.", category: "Conscientiousness" },
#   { content: "Carry out my plans.", category: "Conscientiousness" },
#   { content: "Have difficulty starting tasks.", category: "Conscientiousness", negative_key: true },
#   { content: "Make rash decisions.", category: "Conscientiousness", negative_key: true },
#   { content: "Act without thinking.", category: "Conscientiousness", negative_key: true }
]



neo_60.each do |question|
    Question.find_or_create_by!(**question)
  end
