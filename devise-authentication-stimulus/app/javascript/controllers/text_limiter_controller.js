import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="text-limiter"
export default class extends Controller {
    static values = {
        limit: Number,
        selector: "textarea",
    }

    connect() {
        console.log("text-limiter-controller : this -> ", this);
        this.inputTarget = this.element.querySelector(this.selectorValue);
        this.inputTarget.setAttribute(
            "data-action",
            "keyup->text-limiter#keyup keypress->text-limiter#keypress"
        );
        this.updateLabel();
    }
    
    keypress(event) {
        let input_length = this.inputTarget.value.toString().length;
        if ( input_length !== undefined ) {
            if (input_length >= this.limitValue) {
                event.preventDefault();
                this.inputTarget.value = this.inputTarget.value.slice(0, this.limitValue);
            };
            if (input_length / this.limitValue > 0.90) {
                this.label().classList.add("text-danger");
            } else {
                this.label().classList.remove("text-danger");
            }
            
        };
    };

    keyup(event) {
        this.keypress(event)
        this.updateLabel();
    };

    label() {
        if (this._label === undefined) {
            this._label = document.createElement("label");
            this._label.innerHTML = "";
            this.element.appendChild(this._label);
        };
        return this._label;
    }

    updateLabel() {
        let input_length = this.inputTarget.value.toString().length;
        this.label().innerHTML = `${this.limitValue - input_length} characters left`;
    }
}

