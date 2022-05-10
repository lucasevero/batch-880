// DEMO 01
// const list = document.querySelector("#players");
// or
// const list = document.getElementById("players");

// list.insertAdjacentHTML("beforeend", "<li>Luke</li>");
// list.insertAdjacentHTML("beforeend", "<li>Anakin</li>");


// DEMO 02
// const list = document.querySelector('#fifa-wins');
// const teams = document.querySelectorAll('#fifa-wins li');

// teams.forEach((team) => {
//   console.log(team.innerText)
// });

// setTimeout(() => {
//   list.insertAdjacentHTML('beforeend', '<li>France(2 wins)</li>')
// }, 3000);

// DEMO 03
// const emailInput = document.getElementById("email");
// emailInput.value = "luca98.severo@gmail.com

// const home = document.getElementById("home");
// home.innerHTML = "Le Wagon <strong>rocks</strong>!";
// console.log(home.attributes.href.value);

// const boris = document.getElementById('user');
// console.log(boris.dataset.uid);
// console.log(boris.dataset.githubNickname);


// DEMO 04
const profiles = document.querySelectorAll('.profile');

profiles.forEach((profile) => {
  profile.addEventListener('click', (event) => {
    event.currentTarget.classList.toggle('img-circle');
  });
});
