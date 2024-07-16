import { Controller } from "@hotwired/stimulus"
// Overrides default selecting behaviour to require enter to check

export default class extends Controller {
  connect() {
        this.element.addEventListener('keydown', (event) => {

        if (event.key === 'ArrowLeft' || event.key === 'ArrowUp') {
            event.preventDefault();

            const previousSibling = this.element.parentElement.previousElementSibling
            const parentLastChild = this.element.parentElement.parentElement.children[3]

            if (this.element.parentElement.previousElementSibling){
                const previousSiblingRadio = previousSibling.children[1]
                previousSiblingRadio.focus()
            }else if(parentLastChild){
                const parentLastChildRadio = parentLastChild.children[1]
                parentLastChildRadio.focus()
            }
        }

        if (event.key === 'ArrowRight' || event.key === 'ArrowDown') {
            event.preventDefault();

            const nextSibling = this.element.parentElement.nextElementSibling
            const parentFirstChild = this.element.parentElement.parentElement.children[0]

            if (nextSibling){

                const nextSiblingRadio = nextSibling.children[1]
                nextSiblingRadio.focus()
            }else if(parentFirstChild) {

                const parentFirstChildRadio = parentFirstChild.children[1]
                parentFirstChildRadio.focus()
            }
        }

      if (event.key === 'Enter') {
        event.preventDefault();
        this.element.checked = true;

        // Won't call because event.preventdefault?
        // Or it only calls through Dom and not js
        this.element.dispatchEvent(new Event('click' ));
        this.element.dispatchEvent(new Event('change' ));

      }
     });
  }
}
