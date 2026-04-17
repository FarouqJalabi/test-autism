import { Controller } from "@hotwired/stimulus"

import { FetchRequest } from '@rails/request.js'


// Connects to data-controller="delete-immediately"
export default class extends Controller {
   static values = { id: String, assocation: String }

  delete(_event) {
    if (this.idValue == "" || this.assocationValue == "") return this.removeFields();
    this.requestDestroy()
  }

  async requestDestroy() {
    const body = {test: { [this.assocationValue+"_attributes"]: {0: {_destroy: "1", id: this.idValue}}}}
    const request = new FetchRequest("patch", this.element.form.action, {body: JSON.stringify(body)})
    const response = await request.perform()

    if (response.ok) {
      this.removeFields()
    } else {
      alert("can't destroy :(");
    }
  } 

  removeFields(){
    this.element.closest("fieldset").remove()
  }
}
