import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['list', 'input']

  connect() {
    // console.log('connected to the controller')
    this.fetchMovies("harry potter"); // load Harry Potter's posters as soon as we get to the page
  }

  insertMovies(data) {
    data.Search.forEach((result) => {
      const movieTag = `<li class="list-group-item border-0">
      <img src="${result.Poster}" alt="" width="100">
    </li>`;
      this.listTarget.insertAdjacentHTML("beforeend", movieTag);
    });
  };

  fetchMovies(query) {
    fetch(`http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`)
      .then(response => response.json())
      .then(data => this.insertMovies(data));
    };

  populateList() {
    event.preventDefault();
    this.listTarget.innerHTML = "";
    const input = this.inputTarget
    this.fetchMovies(input.value);
  }
}
