import { Controller } from "@hotwired/stimulus";
import * as bootstrap from "bootstrap";

export default class extends Controller {
  connect() {
    const toast = bootstrap.Toast.getOrCreateInstance(this.element);
    toast.show();
  }
}
