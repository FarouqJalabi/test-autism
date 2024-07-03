import { Controller } from "@hotwired/stimulus"
// Overrides default selecting behaviour to require enter to check

export default class extends Controller {
  connect() {
        this.element.addEventListener('keydown', (event) => {
            if (event.key === 'ArrowLeft' || event.key === 'ArrowUp') {
                event.preventDefault();
                if (this.element.parentElement.previousElementSibling){
                    this.element.parentElement.previousElementSibling.children[1].focus()
                }
            }
            if (event.key === 'ArrowRight' || event.key === 'ArrowDown') {
                event.preventDefault();
                if (this.element.parentElement.nextElementSibling){
                    this.element.parentElement.nextElementSibling.children[1].focus()
                }
            }
          if (event.key === 'Enter') {
            event.preventDefault();
            this.element.checked = true;

            // Won't call because event.preventdefault?
            // Or it only calls through Dom and not js
            this.element.dispatchEvent(new Event('click' ));

          }
        });
  }
};
