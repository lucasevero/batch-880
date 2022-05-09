// Check ruby/flow.rb

// Note the syntax:
  // if (condition) {
  //   block
  // } else if (condition) {
  //   block
  // } else {
  //   block
  // }

const age = 23

if (age >= 23) {
  console.log("you can vot")
} else {
  console.log("not yet")
}


const input = 1

if (input === 1) {
  console.log("pressed 1")
} else if (input === 2) {
 console.log("pressed 2")
} else {
  console.log("i dont understand")
}

// Note: Comparison operators
  // Losse equality
  1 == '1' // true
  nil == undefined // true
  '' == 0 // true

  // Strict equality (===)
  1 === "1" // => false
  nil === undefined // false
  '' === 0 // false
