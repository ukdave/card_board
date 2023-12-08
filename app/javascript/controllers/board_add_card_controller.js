import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "form", "input" ]

  show() {
    this.element.classList.remove("card-flush");
    this.buttonTarget.classList.remove("d-block");
    this.buttonTarget.classList.add("d-none");
    this.formTarget.classList.remove("d-none");
    this.inputTarget.focus();
  }

  hide() {
    this.element.classList.add("card-flush");
    this.buttonTarget.classList.remove("d-none");
    this.buttonTarget.classList.add("d-block");
    this.formTarget.classList.add("d-none");
  }

  reset() {
    this.formTarget.reset();
    this.hide();
  }
}
