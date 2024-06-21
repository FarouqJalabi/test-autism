import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.index = Number(this.element.dataset.index);
    this.totalQuestions = Number(this.element.dataset.total);
    this.currentQuestionContainer = this.element.closest('.question_container');
  }

  radio_clicked() {
    if (this.index !== 0){
      this.currentQuestionContainer.classList.add('slide-out-left');
      this.currentQuestionContainer.classList.remove('current');
    }

    this.progress_bar(this.totalQuestions, this.index + 1);
  }

  back_clicked() {
    let targetIndex = this.index + 1;

    let targetBoxContainer = document.querySelector('.question_container .content .box[data-index="' + targetIndex + '"]');
    let targetQuestionContainer = targetBoxContainer.closest(".question_container");

    targetQuestionContainer.classList.add('current');
    this.currentQuestionContainer.classList.remove('slide-out-left');
  }

  progress_bar(number_of_question, current_question) {
    let progress = (current_question / number_of_question) * 100;
    console.log("number_of_question, current_question: ", number_of_question, current_question);
    console.log("progress: ", progress);

    let progressBarFill = document.querySelector('.progress-bar-fill');
    progressBarFill.style.width = `${progress}%`;
  }
}
