import { Controller } from "@hotwired/stimulus";
import { Sortable } from "sortablejs";
import { put } from '@rails/request.js';

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
    let sortableUrl = event.item.dataset.sortableUrl;
    let params = {
      column_id: parseInt(event.to.dataset.sortableColumnId, 10),
      position: event.newIndex + 1
    };

    document.getElementById("sortableDragImage").remove();

    console.log(sortableUrl, params);

    // We need to generate and store a Turbo request ID so that when we receive a
    // refresh stream action as a result of this request then Turbo will ignore it
    const requestUID = this.uuid();
    Turbo.session.recentRequests.add(requestUID);
    put(sortableUrl, {
      body: JSON.stringify(params),
      redirect: "manual",
      headers: { "X-Turbo-Request-Id": requestUID }
    });
  }

  createDragImage(dataTransfer, dragEl) {
    // By default the browser generates a translucent image of the dragged element. Here we clone the
    // element and style it so that we can customise the image (e.g. by rotating it slightly). The element
    // must be "visible", so we position off the side of the screen rather then setting `display: none`
    // or `visibility: hidden`.

    // Note: applying a CSS transform to the dragged element works fine in Firefox, but for Chrome the transform
    // must be applied to an inner element otherwise it won't have any effect. So, here we create a new DIV into
    // which we insert a clone of the dragged element, and then apply the transform (via a CSS class) to the cloned
    // element. This works in both Firefox and Chrome.

    let dragImage = document.createElement("div");
    dragImage.id = "sortableDragImage";
    dragImage.style.position = "absolute";
    dragImage.style.top = "0px";
    dragImage.style.left = "-1000px";

    let dragElClone = dragEl.cloneNode(true);
    dragElClone.style.width = dragEl.clientWidth + "px";
    dragElClone.style.padding = window.getComputedStyle(dragEl, null).getPropertyValue("padding");
    dragElClone.style.opacity = 1;
    dragElClone.classList.add("sortable-drag-image");

    dragImage.appendChild(dragElClone);
    document.body.appendChild(dragImage);

    let offsetX = this._lastX - dragEl.getBoundingClientRect().left;
    let offsetY = this._lastY - dragEl.getBoundingClientRect().top;
    dataTransfer.setDragImage(dragImage, offsetX, offsetY);
  }

  uuid() {
    return Array.from({ length: 36 })
      .map((_, i) => {
        if (i == 8 || i == 13 || i == 18 || i == 23) {
          return "-"
        } else if (i == 14) {
          return "4"
        } else if (i == 19) {
          return (Math.floor(Math.random() * 4) + 8).toString(16)
        } else {
          return Math.floor(Math.random() * 15).toString(16)
        }
      })
      .join("")
  }
}
