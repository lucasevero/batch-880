import Sortable from "sortablejs";
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("sortable")
    Sortable.create(this.element, {
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        alert(`${event.oldIndex} moved to ${event.newIndex}`)
      }
    })
  }
}
