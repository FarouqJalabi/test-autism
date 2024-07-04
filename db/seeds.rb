# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Help https://embrace-autism.com/autism-spectrum-quotient/
# Source https://www.wired.com/2001/12/aqtest/
#

AQ_50_question = [
  {content: "I prefer to do things with others rather than on my own", negative_key: true},
  {content: "I prefer to do things the same way over and over again"},
  {content: "If I try to imagine something, I find it very easy to create a picture in my mind", negative_key: true},
  {content: "I frequently get so strongly absorbed in one thing that I lose sight of other things"},
  {content: "I often notice small sounds when others do not"},
  {content: "I usually notice car number plates or similar strings of information"},
  {content: "Other people frequently tell me that what I’ve said is impolite, even though I think it is polite"},
  {content: "When I’m reading a story, I can easily imagine what the characters might look like", negative_key: true},
  {content: "I am fascinated by dates"},
  {content: "In a social group, I can easily keep track of several different people’s conversations", negative_key: true},
  {content: "I find social situations easy", negative_key: true},
  {content: "I tend to notice details that others do not"},
  {content: "I would rather go to a library than to a party"},
  {content: "I find making up stories easy", negative_key: true},
  {content: "I find myself drawn more strongly to people than to things", negative_key: true},
  {content: "I tend to have very strong interests, which I get upset about if I can’t pursue"},
  {content: "I enjoy social chitchat", negative_key: true},
  {content: "When I talk, it isn’t always easy for others to get a word in edgewise"},
  {content: "I am fascinated by numbers"},
  {content: "When I’m reading a story, I find it difficult to work out the characters’ intentions"},
  {content: "I don’t particularly enjoy reading fiction"},
  {content: "I find it hard to make new friends"},
  {content: "I notice patterns in things all the time"},
  {content: "I would rather go to the theater than to a museum", negative_key: true},
  {content: "It does not upset me if my daily routine is disturbed", negative_key: true},
  {content: "I frequently find that I don’t know how to keep a conversation going"},
  {content: "I find it easy to ‘read between the lines’ when someone is talking to me", negative_key: true},
  {content: "I usually concentrate more on the whole picture, rather than on the small details", negative_key: true},
  {content: "I am not very good at remembering phone numbers", negative_key: true},
  {content: "I don’t usually notice small changes in a situation or a person’s appearance", negative_key: true},
  {content: "I know how to tell if someone listening to me is getting bored", negative_key: true},
  {content: "I find it easy to do more than one thing at once", negative_key: true},
  {content: "When I talk on the phone, I’m not sure when it’s my turn to speak"},
  {content: "I enjoy doing things spontaneously", negative_key: true},
  {content: "I am often the last to understand the point of a joke"},
  {content: "I find it easy to work out what someone is thinking or feeling just by looking at their face", negative_key: true},
  {content: "If there is an interruption, I can switch back to what I was doing very quickly", negative_key: true},
  {content: "I am good at social chitchat", negative_key: true},
  {content: "People often tell me that I keep going on and on about the same thing"},
  {content: "When I was young, I used to enjoy playing games involving pretending with other children", negative_key: true},
  {content: "I like to collect information about categories of things (e.g., types of cars, birds, trains, plants)"},
  {content: "I find it difficult to imagine what it would be like to be someone else"},
  {content: "I like to carefully plan any activities I participate in"},
  {content: "I enjoy social occasions", negative_key: true},
  {content: "I find it difficult to work out people’s intentions"},
  {content: "New situations make me anxious"},
  {content: "I enjoy meeting new people", negative_key: true},
  {content: "I am a good diplomat", negative_key: true},
  {content: "I am not very good at remembering people’s date of birth"},
  {content: "I find it very easy to play games with children that involve pretending", negative_key: true}
]



AQ_50_test = Test.find_or_create_by!(name:"AQ_50")

AQ_50_question.each do |question|
  AQ_50_test.questions.find_or_create_by!(**question)
end






Blogs = [
  {title: "Understanding Autism: Key Traits and Behaviors", content:"<p>Autism spectrum disorder (ASD) encompasses a range of conditions characterized by challenges with social skills, repetitive behaviors, speech, and nonverbal communication. Understanding these traits can help foster better awareness and support.</p><h2>Key Traits of Autism:</h2><ul><li><strong>Social Communication Challenges:</strong> Difficulty with verbal and nonverbal communication, making it hard to engage in typical social interactions.</li><li><strong>Repetitive Behaviors:</strong> Engaging in repeated actions or rituals, such as hand-flapping or lining up objects.</li><li><strong>Restricted Interests:</strong> Intense focus on specific topics or activities, often to the exclusion of other interests.</li><li><strong>Sensory Sensitivities:</strong> Over- or under-sensitivity to sensory stimuli such as light, sound, or texture.</li></ul><p>Recognizing these traits early can lead to timely interventions and support. For more detailed information, check out our <a href='https://test-autism.rubynor.com/test>test</a>. The test is called AQ-50 and made by Cambridge university. </p>", time_to_read:5, image_alt:"Diverse group with talking bubbles over head", image_src:"blog_images/diverse_group.jpg" },
  {title: "Effective Strategies for Supporting Individuals with Autism", content:"<p>Supporting individuals with autism requires understanding, patience, and a tailored approach. Whether you're a parent, teacher, or friend, there are several strategies you can use to help individuals with autism thrive.</p><h2>Strategies for Support:</h2><ul><li><strong>Consistent Routine:</strong> Individuals with autism often find comfort in routine. Maintaining a consistent daily schedule can reduce anxiety and provide a sense of security.</li><li><strong>Clear Communication:</strong> Use simple and direct language. Visual aids and written instructions can also be helpful in conveying information effectively.</li><li><strong>Positive Reinforcement:</strong> Encourage desired behaviors with positive reinforcement. Praises, rewards, and encouragement can motivate and build confidence.</li><li><strong>Social Skills Training:</strong> Social interactions can be challenging for individuals with autism. Structured social skills training can improve their ability to interact with others.</li><li><strong>Sensory-Friendly Environment:</strong> Create a sensory-friendly environment by minimizing sensory overload. Consider factors like lighting, noise levels, and tactile experiences.</li></ul><p>Implementing these strategies can significantly enhance the quality of life for individuals with autism. For more insights on autism and effective support strategies, explore our <a href='https://test-autism.rubynor.com/blogs'>Blogs</a>.</p>", time_to_read:6, image_alt:"Supportive interactions with two individuals", image_src:"blog_images/support.jpg" }
]

Blogs.each do |blog|
  BlogPost.find_or_create_by!(**blog)
end