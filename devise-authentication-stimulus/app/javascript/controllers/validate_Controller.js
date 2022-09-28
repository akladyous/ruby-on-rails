import { Controller } from "@hotwired/stimulus";
import validate from "validate.js";

console.log("validate_controller.js");

export default class extends Controller {
    static targets = ["form", "input"];

    static values = {
        selector: {},
    }
    initialize() {
        for (let input of this.inputTargets) {
            const targetFeedback = document.createElement("div");
            targetFeedback.id = `${input.id}-feedback`;
            input.parentNode.insertBefore(targetFeedback, input.nextSibling);
            this.selectorValue[input.name] = `${input.name}-feedback`;
            console.log('')
        }
        console.log('this.selectorValue -> ', this.selectorValue);
    }
    connect() {
        console.log("validate controller this -> ", this);
    }
    disconnect() {
        this.inputTargets
            .map((input) => input.id.concat("-feedback"))
            .forEach((feedback) => {
                this.element.querySelector(`#${feedback}`).remove();
            });

    }
    handleChange(event) {
        debugger
        event.preventDefault();
        const target = event.currentTarget;
        const errors = validate.single(target.value, this.constrains(target));
        if (errors) {
            this.showErrors({ [target.name]: errors });
        } else {
            this.removeError(target.name);
            target.classList.add("is-valid");
        }
    }
    handleForm(event) {
        debugger
        event.preventDefault();
        var errors = validate(this.formTarget, this.constrains());
        console.log("errors from handleChange -> ", errors);
        if (errors) {
            this.showErrors(errors);
        } else {
            this.removeError();
            this.formTarget.submit();
            this.disconnect()
        }
    }
    showErrors(errors) {
        debugger
        for (let inputName in errors) {
            const error = errors[inputName];
            this.currentTarget(inputName).classList.add("is-invalid");
            this.currentFeedback(inputName).innerHTML = error;
            this.currentFeedback(inputName).classList.add("invalid-feedback");
        };
    };
    removeError(targetName = null) {
        debugger
        if (targetName) {
            this.currentTarget(targetName).classList.remove("is-invalid");
            const _currentFeedback = this.currentFeedback(targetName);
            _currentFeedback.innerHTML = "";
            _currentFeedback.classList.remove("invalid-feedback", "valid-feedback");

        } else {
            const targetNames = this.inputTargets.map(input => input.name);
            for (let name of targetNames) {
                this.currentTarget(name).classList.remove("is-invalid", "is-valid");
                const _feedback = this.currentFeedback(name);
                _feedback.innerHTML = "";
                _feedback.classList.remove("invalid-feedback", "valid-feedback");
            }
        }
    };
    currentTarget(name) {
        // return this.formTarget.querySelector(`[name="${name}"]`);
        return this.inputTargets.find(input => input.name === name);
    }
    currentFeedback(name) {
        const target = this.inputTargets.find(input => input.name === name);
        let feedback = this.formTarget.querySelector(`#${target.id}-feedback`);
        return feedback;
    };
    constrains(target) {
        const constrains = {};
        if (target) return JSON.parse(target.getAttribute("data-validate"));
        for (let input of this.inputTargets) {
            constrains[input.name] = JSON.parse(
                input.getAttribute("data-validate")
            );
        }
        return constrains;
    };

    createFeedback() {
        debugger
        const target = this.inputTargets.find(input => input.name === name);
        let feedback = this.formTarget.querySelector(`#${target.id}-feedback`);
        if (feedback === undefined || feedback === null) {
            feedback = document.createElement("div");
            feedback.id = `${target.id}-feedback`;
            feedback.innerHTML = "";
            target.parentNode.insertBefore(feedback, target.nextSibling);
        }
        return feedback;
    }


    _current(name = null, id = null) {
        console.log('name : ', name, 'id : ', id);
        const query = name ? `[name="${name}"]` : id ? `#${id}` : null;
        return this.formTarget.querySelector(query);
    };
}
