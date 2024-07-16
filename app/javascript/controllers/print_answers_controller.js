import { Controller } from "@hotwired/stimulus"
// Getting answers from localstorage and clearing localstorage
export default class extends Controller {
  connect() {
    Object.keys(localStorage).forEach(
    function(key){
      let radio_button = document.getElementById(localStorage.getItem(key));
      radio_button.checked = true
      console.log(radio_button.checked)
    });
  }


}
