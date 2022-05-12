// src/controllers/disable_button_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'link']

  connect() {
    // console.log("Hello from our first Stimulus controller")
  }

  disable() {
    // this.element == the element that carries the data-controller
    const button = this.buttonTarget
    const link = this.linkTarget
    // 1. add a disabled attr to button
    button.disabled = true
    // 2. change the text to 'Bingo!'
    button.innerText = "Bingo!"
    link.classList.remove('d-none')
  }

  reset() {
    // 1. get rid of the disabled attr of the button
    this.buttonTarget.disabled = false
    // 2. change the text of the button back to 'Click me!"
    this.buttonTarget.innerText = 'Click me!'
    // 3. make the link dissapear again
    this.linkTarget.classList.add('d-none')
  }
}
