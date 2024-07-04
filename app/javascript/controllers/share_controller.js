import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // un-hide if not on mobile
    if (navigator.canShare){
      this.element.classList.remove("hidden")

    }

  }

  async share_clicked() {
    if (navigator.canShare){
        let share_data = {title: "Test-Autism", text: this.element.dataset.label, url: "https://test-autism.rubynor.com/"+this.element.dataset.language+"/test"}
        await navigator.share(share_data);
    }
  }
}
