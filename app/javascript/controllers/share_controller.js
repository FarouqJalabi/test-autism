import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "navigatorButtons", "shareButtons" ]

  connect() {
    console.log(this.shareButtonsTarget)
    // un-hide if not on mobile
    if (navigator.canShare){
      this.navigatorButtonsTarget.classList.remove("hidden")
    } else {
      this.shareButtonsTarget.classList.remove("hidden")
    }
  }

  async share_clicked() {
    if (navigator.canShare){
        let share_data = {title: "Test-Autism", text: this.element.dataset.label, url: "https://test-autism.com/"+this.element.dataset.language+"/test"}
        await navigator.share(share_data);
    }
  }
}