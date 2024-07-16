import { Controller } from "@hotwired/stimulus"
// Getting answers from localstorage and clearing localstorage
export default class extends Controller {
  connect() {
    localStorage.setItem("viewed_result", "true")

    Object.keys(localStorage).forEach(
    function(key){
      if (key.includes("question_")){
      let radio_button = document.getElementById(localStorage.getItem(key));
      radio_button.checked = true
      }
    });
  }


}
