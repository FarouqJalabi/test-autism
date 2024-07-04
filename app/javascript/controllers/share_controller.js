import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // un-hide if not on mobile
    this.element.classList.remove(navigator.canShare() ? "hidden" : "")

  }

  async share_clicked() {
    if (navigator.canShare()){
        await navigator.share({title:"Test-Autism", text:"My results on Autism test", url: "https://test-autism.rubynor.com/en"});
    }
  }
}
