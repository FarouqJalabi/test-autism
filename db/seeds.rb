# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Help https://embrace-autism.com/aq-10/
# Source https://medium.com/@vtmacedo/an-artificial-inteligence-approach-to-the-autism-spectrum-quotient-aq-10-test-20e5b997a7fd

AQ_10_question =[
  {content: "I often notice small sounds when other do not"},
  {content: "I usually concentrate more on the whole picture, rather than the small details", negative_key:true },
  {content: "I find it easy to do more than one thing at once", negative_key:true},
  {content: "If there is an interruption, I can switch back to what I was doing very quickly", negative_key:true},
  {content: "I find it easy to read 'read between the lines' when someone is talking to me", negative_key:true},
  {content: "I know how to tell if someone listening to me is getting bored", negative_key:true},
  {content: "When I'm reading a story I find it difficult to work out the characters' intentions"},
  {content: "I like to collect information about categories of thing (e.g. type of car, types of bird, types of train, types of plant etc"},
  {content: "I find it easy to work out what someone is thinking or feeling just by looking at their face", negative_key:true},
  {content: "I find it difficult to work out people's intentions"},
]



AQ_10_test = Test.find_or_create_by!(name:"AQ_10")

# Test.find_or_create_by!(name:"AQ-50")
# Test.find_or_create_by!(name:"CAT-Q")

AQ_10_question.each do |question|
  AQ_10_test.questions.find_or_create_by!(**question)
end





Blogs = [
  {title: "Understanding Autism: Key Traits and Behaviors", content:"Autism spectrum disorder (ASD) encompasses a range of conditions characterized by challenges with social skills, repetitive behaviors, speech, and nonverbal communication. Understanding these traits can help foster better awareness and support.
<br>

<h2>Key Traits of Autism:</h2>
<ul>
    <li><strong>Social Communication Challenges:</strong> Difficulty with verbal and nonverbal communication, making it hard to engage in typical social interactions.</li>
    <li><strong>Repetitive Behaviors:</strong> Engaging in repeated actions or rituals, such as hand-flapping or lining up objects.</li>
    <li><strong>Restricted Interests:</strong> Intense focus on specific topics or activities, often to the exclusion of other interests.</li>
    <li><strong>Sensory Sensitivities:</strong> Over- or under-sensitivity to sensory stimuli such as light, sound, or texture.</li>
</ul>
Recognizing these traits early can lead to timely interventions and support. For more detailed information, check out our <a href='https://test-autism.rubynor.com/tests/1>test</a>. The test is called AQ-10 and made by Cambridge university.", time_to_read:5, image_alt:"Diverse group with talking bubbles over head", image_src:"blog_images/diverse_group.jpg" }
]

Blogs.each do |blog|
  BlogPost.find_or_create_by!(**blog)
end