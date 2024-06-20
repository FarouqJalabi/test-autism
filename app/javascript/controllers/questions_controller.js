import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!"
    this.index = this.element.dataset.index
    this.currentQuestionContainer = this.element.closest('.question_container');
  }
  radio_clicked() {
    // Last question don't move forward
    if (this.index !== "0"){
      this.currentQuestionContainer.classList.add('slide-out-left')
      this.currentQuestionContainer.classList.remove('current')
    }
}
  back_clicked() {
    let targetIndex = Number(this.index) + 1;

    let targetBoxContainer = document.querySelector('.question_container .content .box[data-index="' + targetIndex + '"]');
    let targetQuestionContainer = targetBoxContainer.closest(".question_container")

    targetQuestionContainer.classList.add('current');
    this.currentQuestionContainer.classList.remove('slide-out-left');
  }
}
