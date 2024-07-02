import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.order = Number(this.element.dataset.order);
    this.totalQuestions = Number(this.element.dataset.total);
    this.element.hidden = true
  }

  radio_clicked(event) {
    if (this.order !== this.totalQuestions){
      this.element.style.visibility = "hidden"
    }
    if (this.order === this.totalQuestions){
      document.querySelector("input[type=\"submit\"]").classList.remove("hidden")
    }

    // Next question visible
    let nextQuestion = document.querySelector('.question[data-order="' + (Number(this.order)+1) + '"]');
    nextQuestion.style.visibility = "visible"

    // Select next question first radio button
    nextQuestion.querySelector("input[type='radio']").focus()

    this.progress_bar(this.totalQuestions, this.order + 1);
  }

  back_clicked() {
    let targetIndex = this.order-1 ;

    let targetQuestion = document.querySelector('.question[data-order="' + targetIndex + '"]');
    targetQuestion.style.visibility = "visible"
    targetQuestion.querySelector("input[type='radio']").focus()
  }

  progress_bar(number_of_question, current_question) {
    let progress = (current_question / number_of_question) * 100;

    let progressBarFill = document.querySelector('.progress');
    progressBarFill.value = progress;
  }
}
