import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!"
    this.index = this.element.dataset.index
    this.currentQuestionContainer = this.element.closest('.question_container');
  }
  radio_clicked() {
    console.log("Radio clicked")
    this.currentQuestionContainer.classList.add('slide-out-left')
    this.currentQuestionContainer.classList.remove('current')
}
  back_clicked() {
    console.log("back clicked")
  }
}
