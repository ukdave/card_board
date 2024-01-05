import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    document.addEventListener("turbo:morph", this.handleMorph);
  }

  disconnect() {
    document.removeEventListener("turbo:morph", this.handleMorph);
  }

  handleMorph() {
    console.log("page morphed");
    // The add card forms have data-turbo-permanent so that they aren't closed and reset during a moprh, however
    // if columns have been re-ordered then we need to ensure the add card forms are in the correct column and
    // move them as necessary
    document.querySelectorAll(".board-column").forEach((columnElem) => {
      let addCardElem = columnElem.querySelector(".board-add-card");
      if (columnElem.dataset.columnId !== addCardElem.dataset.columnId) {
        let destColumnElem = document.querySelector(`#column_${addCardElem.dataset.columnId} .card-body`);
        console.log(`moving add card form from column ${columnElem.dataset.columnId} to column ${addCardElem.dataset.columnId}`);
        destColumnElem.append(addCardElem);
      }
    });
  }
}
