import ApplicationController from "controllers/application_controller";

export default class extends ApplicationController {
  static values = { colour: String };

  changeColour(event) {
    this.colourValue = event.params.colour;

    let cardUrl = this.element.dataset.sortableUrl;
    let params = {
      colour: this.colourValue
    };

    console.log(cardUrl, params);
    this.turboPut(cardUrl, params);
  }

  colourValueChanged(value, previousValue) {
    this.element.classList.remove(`card-colour-${previousValue}`)
    this.element.classList.add(`card-colour-${value}`)
  }
}
