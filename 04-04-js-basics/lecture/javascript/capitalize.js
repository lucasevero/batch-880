const capitalize = (name) => {
  const firstLetter = name[0].toUpperCase();
  const restOfTheWord = name.substring(1).toLowerCase();

  return `${firstLetter}${restOfTheWord}`
}

console.log(capitalize("viNCenT"))
