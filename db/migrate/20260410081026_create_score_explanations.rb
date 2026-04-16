class CreateScoreExplanations < ActiveRecord::Migration[7.1]
  def up
    create_table :score_explanations do |t|
      t.belongs_to :test, null: false, foreign_key: true
      t.integer :min_score
      t.integer :max_score

      t.timestamps
    end 

    score_ranges = [
      {range: 0..15,  title: "You are very unlikely to have autism", explanation: "Your score suggests that it is very unlikely you have autism. The test results indicate minimal signs of ASD, and no further action is usually required. However, if you have specific concerns or behaviors causing worry, a consultation with a healthcare professional can provide additional reassurance and guidance.", label: "very unlikely", share_label: "I am very unlikely to have autism. Take the test to see how likely you are!"},
      {range: 16..24, title: "You are unlikely to have autism", explanation: "Your score indicates that it is unlikely you have autism. The signs are not strong or numerous enough to suggest a high probability of ASD. However, if you have ongoing concerns or other symptoms, it may still be worthwhile to seek professional advice.", label: "unlikely", share_label: "I am unlikely to have autism. Take the test to see how likely you are!"},
      {range: 25..34, title: "You are likely to have autism", explanation: "Your score suggests that it is likely you display several signs of autism. While not definitive, it indicates a considerable possibility of ASD. Consulting with a professional for a detailed evaluation is advisable to better understand your condition.", label: "likely", share_label: "I am likely to have autism. Take the test to see how likely you are!"},
      {range: 35..50, title: "You are very likely to have autism", explanation: "Your score indicates that it is very likely you exhibit significant signs of autism spectrum disorder (ASD). This suggests a high probability of autism, and it is strongly recommended that you seek a comprehensive assessment by a healthcare professional to explore this possibility further.", label: "very likely", share_label: "I am very likely to have autism. Take the test to see how likely you are!"},
    ]

    score_ranges.each do |score_range|
      ScoreExplanation.find_by(min_score: score_range[:range].first) || ScoreExplanation.create!(score_range: score_range[:range], title: score_range[:title], explanation: score_range[:explanation], label: score_range[:label], test: Test.first)
    end
  end

  def down
    ScoreExplanation.destroy_all
    drop_table :score_explanations
  end
end
