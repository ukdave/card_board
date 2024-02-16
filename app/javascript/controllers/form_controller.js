import { Controller } from "@hotwired/stimulus";

// This controller uses the [consraints validation API](https://developer.mozilla.org/en-US/docs/Web/API/Constraint_validation)
// to display custom form validaton messages instead of the browser's native ones.
//
// * It disables the validation system with the attribute `novalidate`. This will still let us use the API, but
//   it will stop showing native validation messages.
// * It validates each field on blur events, and whole forms when they are submitted.
// * It prevents invalid forms from being submitted.
// * It marks invalid fields with a class `.is-invalid`.
// * It shows native error messages with a custom field `.invalid-feedback` next to each input field.
//
// See:
//  * https://www.jorgemanrubia.com/2019/02/16/form-validations-with-html5-and-modern-rails/
//  * https://github.com/jorgemanrubia/rails-form-validations-example/blob/master/app/javascript/controllers/form_controller.js
export default class extends Controller {
  connect() {
    this.element.setAttribute("novalidate", true);
    this.element.addEventListener("blur", this.onBlur, true);
    this.element.addEventListener("submit", this.onSubmit);
  }

  disconnect() {
    this.element.removeEventListener("blur", this.onBlur);
    this.element.removeEventListener("submit", this.onSubmit);
  }

  onBlur = (event) => {
    this.validateField(event.target);
  }

  onSubmit = (event) => {
    if (!this.validateForm()) {
      event.preventDefault();
      this.firstInvalidField.focus();
    }
  }

  validateForm() {
    let isValid = true;
    this.formFields.forEach((field) => {
      if (this.shouldValidateField(field) && !this.validateField(field)) {
        isValid = false;
      }
    })
    return isValid;
  }

  validateField(field) {
    if (!this.shouldValidateField(field)) {
      return true;
    }
    const isValid = field.checkValidity();
    field.classList.toggle("is-invalid", !isValid);
    this.refreshErrorForInvalidField(field, isValid);
    return isValid;
  }

  shouldValidateField(field) {
    return !field.disabled && !["file", "reset", "submit", "button"].includes(field.type);
  }

  refreshErrorForInvalidField(field, isValid) {
    this.removeExistingErrorMessage(field);
    if (!isValid) {
      this.showErrorForInvalidField(field);
    }
  }

  removeExistingErrorMessage(field) {
    const fieldContainer = field.parentNode;
    if (!fieldContainer) {
      return;
    }
    const existingErrorMessageElement = fieldContainer.querySelector(".invalid-feedback");
    if (existingErrorMessageElement) {
      existingErrorMessageElement.parentNode.removeChild(existingErrorMessageElement)
    }
  }

  showErrorForInvalidField(field) {
    field.insertAdjacentHTML("afterend", this.buildFieldErrorHtml(field));
  }

  buildFieldErrorHtml(field) {
    return `<div class="invalid-feedback">${field.validationMessage}</div>`;
  }

  get formFields() {
    return Array.from(this.element.elements);
  }

  get firstInvalidField() {
    return this.formFields.find(field => !field.checkValidity());
  }
}
