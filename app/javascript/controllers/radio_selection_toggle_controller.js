import {Controller} from "stimulus"

const RADIO_SELECTION_TOGGLE = 'radio-selection-toggle'

export default class extends Controller {

  static targets = ["modal", "radioButton"]

  connect() {
    document.addEventListener(RADIO_SELECTION_TOGGLE, this.handleSelection.bind(this));
  }

  toggle(event) {
    event.stopImmediatePropagation()

    const selectionEvent = new CustomEvent(RADIO_SELECTION_TOGGLE, {
      detail: {
        name: event.target.name,
        value: event.target.value
      }
    });
    document.dispatchEvent(selectionEvent);
    return false;
  }

  handleSelection(event) {
    console.log(event.detail.value)
    if (event.detail.name === this.radioButtonTarget.name) {
      this.modalTarget.hidden = event.detail.value !== this.radioButtonTarget.value
    }
  }
}