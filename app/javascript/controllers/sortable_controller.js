import { Controller } from "@hotwired/stimulus";
import { Sortable } from "sortablejs";

export default class extends Controller {
  static values = {
    group: String,
    handle: String
  }

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: this.groupValue,
      handle: this.handleValue,
      onEnd: this.onEnd.bind(this),
      setData: this.createDragImage
    });
  }

  onEnd(event) {
    console.log(event.item.dataset.sortableId, event.to.dataset.sortableColumnId, event.newIndex);
    document.getElementById("sortableDragImage").remove();
  }

  createDragImage(dataTransfer, dragEl) {
    // By default the browser generates a translucent image of the dragged element. Here we clone the
    // element and style it so that we can customise the image (e.g. by rotating it slightly). The element
    // must be "visible", so we position off the side of the screen rather then setting `display: none`
    // or `visibility: hidden`.

    let dragImage = dragEl.cloneNode(true);
    dragImage.id = "sortableDragImage";
    dragImage.style.position = "absolute";
    dragImage.style.top = "0px";
    dragImage.style.left = "-1000px";
    dragImage.style.width = dragEl.clientWidth + "px";
    dragImage.style.padding = window.getComputedStyle(dragEl, null).getPropertyValue("padding");
    dragImage.style.opacity = 1;
    dragImage.classList.add("sortable-drag-image");
    document.body.appendChild(dragImage);

    let offsetX = this._lastX - dragEl.getBoundingClientRect().left;
    let offsetY = this._lastY - dragEl.getBoundingClientRect().top;
    dataTransfer.setDragImage(dragImage, offsetX, offsetY);
  }
}
