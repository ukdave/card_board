import { Controller } from "@hotwired/stimulus";
import * as bootstrap from "bootstrap";

export default class extends Controller {
  connect() {
    const toast = bootstrap.Toast.getOrCreateInstance(this.element);
    this.element.addEventListener("hidden.bs.toast", () => { this.element.remove(); })
    toast._maybeScheduleHide();
  }
}
