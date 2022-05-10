// Hint Button
// 01. Get the button elemen
const hint = document.querySelector('.hint');

// 02. Get the hint element
const button = document.getElementById('show-hint');

// 03. Make the button listen to click
button.addEventListener("click", (event) => {
  // 04. Make the hint active (using '.active')
  hint.classList.toggle("active")
});


// 1. Get all the tiles
const tiles = document.querySelectorAll("td")
// 2. Make them listen to my clicks
tiles.forEach((tile) => {
  tile.addEventListener("click", (event) => {
    if (canMove(tile)) {
      moveTile(tile)
      if (checkVictory(tiles)) {
        setTimeout(() => {
          alert("YOU DID IT!");
        }, 1)
      }
    }
  })
})

// 3. Check if the clicked tile can move
const canMove = (tile) => {
  // 3.1 Get all the indexes
  const empty = document.querySelector('.empty')
  const emptyRowIndex = empty.parentElement.rowIndex;
  const emptyColumnIndex = empty.cellIndex;

  const tileRowIndex = tile.parentElement.rowIndex;
  const tileColumnIndex = tile.cellIndex;

  // 3.2 Think, think...
  // they are in the same column and the row index is x + 1
  return emptyColumnIndex === tileColumnIndex && emptyRowIndex === tileRowIndex + 1 ||
  // they are in the same column and the row index is x - 1
  emptyColumnIndex === tileColumnIndex && emptyRowIndex === tileRowIndex - 1 ||
  // they are in the same row and the column index is x + 1
  emptyRowIndex === tileRowIndex && emptyColumnIndex === tileColumnIndex + 1 ||
  // they are in the same row and the column index is x - 1
  emptyRowIndex === tileRowIndex && emptyColumnIndex === tileColumnIndex - 1;
}

// 4. move it!
const moveTile = (tile) => {
  // 4.1 Get the tiles
  const empty = document.querySelector('.empty');

  // 4.2 Swap the numbers
  const number = tile.innerText
  empty.innerText = number
  tile.innerText = ''

  // 4.3 Swap the .empty class
  empty.classList.remove('empty')
  tile.classList.add('empty')
};

// 5. check if they won
const checkVictory = (tiles) => {
  let currentBoard = Array.from(tiles)
  currentBoard = currentBoard.map((htmlElement) => {
    return Number.parseInt(htmlElement.innerText, 10)
  })

  return currentBoard.join() === '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,NaN'
}
