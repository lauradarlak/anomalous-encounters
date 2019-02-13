$(function () {
  console.log('category.js is loaded')
  listenForCategoryClick();
})

function listenForCategoryClick() {
  $('a.cat-link').on('click', function (event) {
    e.preventDefault();
    debugger
    getEncountersByCategory();
  })
}

// function getEncountersByCategory() {
//   $.ajax({
//     url:
//   })
// }
