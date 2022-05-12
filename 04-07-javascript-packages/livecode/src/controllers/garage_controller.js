import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["carsList", "brand", "model", "plate", "owner"]

  connect() {
    this.garageName = "batch880"
    this.getCarsFromApi();
  }

  getCarsFromApi() {
    const url = `https://wagon-garage-api.herokuapp.com/${this.garageName}/cars`
    console.log(url)
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        data.forEach((car) => {
          this.addCarToGarage(car)
        });
      })
  }

  addCarToGarage(car) {
    const carCard = `<div class="car">
    <div class="car-image">
    <img src="http://loremflickr.com/280/280/${car.brand} ${car.model}" />
    </div>
    <div class="car-info">
    <h4>${car.brand} ${car.model}</h4>
    <p><strong>Owner:</strong> ${car.owner}</p>
    <p><strong>Plate:</strong> ${car.plate}</p>
    </div>
    </div>`
    this.carsListTarget.insertAdjacentHTML('beforeend', carCard)
  }

  createCar() {
    event.preventDefault()
    const url = `https://wagon-garage-api.herokuapp.com/${this.garageName}/cars`
    fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        "brand": this.brandTarget.value,
        "model": this.modelTarget.value,
        "owner": this.ownerTarget.value,
        "plate": this.plateTarget.value
      })
    })
      .then(response => response.json())
      .then((data) => {
        this.addCarToGarage(data)
      })
  }
}
