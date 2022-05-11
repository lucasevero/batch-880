// TO REFRESH YOUR MEMORY
// // const button = document.querySelector('#click-me')
// const button = document.getElementById('click-me')

// // button.addEventListener(EVENT_TYPE, CALLBACK)
// button.addEventListener('click', (event) => {
//   button.innerText = "Hold on...";
//   // button.disabled = true;
//   button.setAttribute("disabled", "")
// });

// FILMS DEMO
const form = document.getElementById('search-form');
const results = document.getElementById('results');
const input = document.getElementById('search-input');

form.addEventListener('submit', (event) => {
  console.log(input);
  event.preventDefault();
  fetch(`http://www.omdbapi.com/?s=${input.value}&apikey=adf1f2d7`)
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = "";
      const films = data.Search;
      films.forEach((film) => {
        // results.insertAdjacentHTML(POSITION, HTML_CONTENT)
        results.insertAdjacentHTML('beforeend', `<li>
          <img src="${film.Poster}" />
          <p>${film.Title}</p>
        </li>`);
      });
    });
});

// SIGN UP DEMO
// const signUp = (event) => {
//   event.preventDefault()
//   const emailValue = document.getElementById("email").value
//   const passwordValue = document.getElementById("password").value
//   fetch("https://reqres.in/api/register", {
//     method: "POST",
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify({ "email": emailValue, "password": passwordValue })
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data)
//     })
// }

// const form = document.querySelector("#form")
// form.addEventListener("submit", signUp)
