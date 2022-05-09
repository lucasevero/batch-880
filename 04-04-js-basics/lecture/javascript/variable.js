// Check ruby/variable.rb

// let: for variables that are going to be re-assigned in the future
let counter = 0

counter += 1
counter += 1
counter += 1

console.log(counter)

// const: for a constant variable that can not be overwrited

const baseUrl = "kitt.lewagon.com/camps"
const batchNumber = 880
const fullAddress = `${baseUrl}${batchNumber}`

// Note: you should not use old ES5 'var' notation
