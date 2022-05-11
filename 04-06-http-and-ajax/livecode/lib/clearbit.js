const authorization = "Bearer sk_794ff668265508c7147b38368cdb9d1b"; // make sure you get your own api key on `clearbit.com`
const form = document.getElementById('clearbitForm');

const callClearbitApi = (callback) => {
  const userInput = document.getElementById('clearbitEmail').value
  const url = `https://person.clearbit.com/v1/people/email/${userInput}`;
  fetch(url, { headers: { Authorization: authorization } })
    .then(response => response.json())
    .then((data) => {
      callback(data);
    });
};

const fillTheInTheBlanks = (data) => {
  const name = data.name.fullName;
  const email = data.email;
  const bio = data.bio;
  const location = data.geo.city;

  document.getElementById('userName').innerText = name;
  document.getElementById('userEmail').innerText = email;
  document.getElementById('userBio').innerText = bio;
  document.getElementById('userLocation').innerText = location;
};

form.addEventListener('submit', (event) => {
  event.preventDefault();
  callClearbitApi(fillTheInTheBlanks);
})













// 👇 --- don't go further if you are not super confident with js --- 👇

// ALTERNATIVE REFACTOR USING async AND await
// See more on: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function
// Super shoutout to Vincent for sugesting this code!



// const fetchClearbitApi = (input) => {
//   const url = `https://person.clearbit.com/v1/people/email/${input}`

//   return fetch(url, {
//     headers: { 'Authorization': authorization }
//   })
//     .then(response => response.json())
// };

// const fillTheInTheBlanks = (data) => {
//   const name = data.name.fullName;
//   const email = data.email;
//   const bio = data.bio;
//   const location = data.geo.city;

//   document.getElementById('userName').innerText = name;
//   document.getElementById('userEmail').innerText = email;
//   document.getElementById('userBio').innerText = bio;
//   document.getElementById('userLocation').innerText = location;
// }

// // form.addEventListener(EVENT, CALLBACK)
// form.addEventListener('submit', async () => {
//   const userInput = document.getElementById('clearbitEmail').value
//   const data = await fetchClearbitApi(userInput);
//   fillTheInTheBlanks(data)
// })
