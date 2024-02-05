import { Controller } from "@hotwired/stimulus";
import { put } from '@rails/request.js';

export default class extends Controller {
  turboPut(url, params) {
    // We need to generate and store a Turbo request ID so that when we receive a
    // refresh stream action as a result of this request then Turbo will ignore it
    const requestUID = this.uuid();
    Turbo.session.recentRequests.add(requestUID);
    put(url, {
      body: JSON.stringify(params),
      redirect: "manual",
      headers: { "X-Turbo-Request-Id": requestUID }
    });
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
