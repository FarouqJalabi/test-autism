module QuestionsHelper
  def percentage_to_label(percentage)
    if percentage >= 0.0 and percentage <= 30.0
      "very unlikely"
    elsif percentage >= 40.0 and percentage <= 50.0
      "unlikely"
    elsif percentage >= 60.0 and percentage <= 70.0
      "likely"
    else
      "very likely"
    end
  end

  # For now we have descriptions hard coded
  # If we get several tests they will be coded into the test themselves
  def percentage_to_description(percentage)
    if percentage >= 0.0 and percentage <= 30.0
      "Your score suggests that it is very unlikely you have autism. The test results indicate minimal signs of ASD, and no further action is usually required. However, if you have specific concerns or behaviors causing worry, a consultation with a healthcare professional can provide additional reassurance and guidance."
    elsif percentage >= 40.0 and percentage <= 50.0
      "Your score indicates that it is unlikely you have autism. The signs are not strong or numerous enough to suggest a high probability of ASD. However, if you have ongoing concerns or other symptoms, it may still be worthwhile to seek professional advice."
    elsif percentage >= 60.0 and percentage <= 70.0
      "Your score suggests that it is likely you display several signs of autism. While not definitive, it indicates a considerable possibility of ASD. Consulting with a professional for a detailed evaluation is advisable to better understand your condition."
    else
      "Your score indicates that it is very likely you exhibit significant signs of autism spectrum disorder (ASD). This suggests a high probability of autism, and it is strongly recommended that you seek a comprehensive assessment by a healthcare professional to explore this possibility further."
    end
  end

end
