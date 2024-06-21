import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.order = Number(this.element.dataset.order);
    this.totalQuestions = Number(this.element.dataset.total);
    this.currentQuestionContainer = this.element.closest('.question_container');
  }

  radio_clicked() {
    if (this.order !== this.totalQuestions){
      this.currentQuestionContainer.classList.add('slide-out-left');
      this.currentQuestionContainer.classList.remove('current');
    }
    if (this.order === this.totalQuestions){
      document.querySelector(".submit_button").style.visibility = "visible"
    }

    this.progress_bar(this.totalQuestions, this.order + 1);
  }

  back_clicked() {
    let targetIndex = this.order-1 ;

    let targetBoxContainer = document.querySelector('.question_container .content .box[data-order="' + targetIndex + '"]');
    let targetQuestionContainer = targetBoxContainer.closest(".question_container");

    targetQuestionContainer.classList.add('current');
    this.currentQuestionContainer.classList.remove('slide-out-left');
  }

  progress_bar(number_of_question, current_question) {
    let progress = (current_question / number_of_question) * 100;

    let progressBarFill = document.querySelector('.progress-bar-fill');
    progressBarFill.style.width = `${progress}%`;
  }
}
