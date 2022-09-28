import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log('hello controller connect event: ', this);
        this.element.textContent = "Hello World!"
    }
}
console.log('hello_controller.js')