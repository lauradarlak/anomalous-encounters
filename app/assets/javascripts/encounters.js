$(function(){
  compileShortCard()
  compileFullCard()
  indexEncounters()
  showEncounter()
  addEncounterForm()
  // if(window.location.pathname === '/') {
  //
  // }

})

class Encounter {
  constructor(obj){
    this.id = obj.id;
    this.date = obj.date;
    this.state = obj.state;
    this.county = obj.county;
    this.nearest_town = obj.nearest_town
    this.environment = obj.environment
    this.witneses = obj.witneses;
    this.description = obj.description;
    this.short_description = obj.description.substring(0, 200) + "...";
    this.user_display_name = obj.user.display_name
    this.category_slug = obj.category.slug;
    this.category = obj.category.name;
    this.tags = obj.tags
  }
}

// Encounter prototypes to render handlebars templates

Encounter.prototype.renderShortCard = function(){
  return Encounter.shortTemplate(this)
}

Encounter.prototype.renderFullCard = function(){
  return Encounter.fullTemplate(this)
}

// Compile Handlebars templates

function compileShortCard(){
  console.log("short card load")
  shortCardSource = $("#brief-encounter-template").html()
  if (shortCardSource !== undefined) {
    Encounter.shortTemplate = Handlebars.compile(shortCardSource)
  }
}

function compileFullCard(){
  fullCardSource = $("#full-encounter-template").html()
  if (fullCardSource !== undefined) {
    Encounter.fullTemplate = Handlebars.compile(fullCardSource)
  }
}

// Get all encounters via AJAX request

function indexEncounters() {
  $.ajax({
     url: 'http://localhost:3000/encounters',
     method: 'get',
     dataType: 'json',
     success: function(json) {
       json.forEach(encounter => {
         var newEncounter = new Encounter(encounter)
         var shortEncounterRender = newEncounter.renderShortCard();

         $("#encounter-details-" + newEncounter.id).prepend(shortEncounterRender)
         console.log("rendered!")
       })
     }
   })
}

function showEncounter() {
  console.log('listening..')
  $('a.show-link').on('click', function(e) {
    e.preventDefault()
      $.ajax({
      url: this.href,
      method: 'get',
      dataType: 'json',
      success: function(json) {
        var newEncounter = new Encounter(json)
        var fullEncounterRender = newEncounter.renderFullCard();
        $("#encounter-details-" + newEncounter.id).empty();
        $("#bannerHeading").text("Encounter Details");
        $("a.show-link").removeAttr("href");

        $("section#encounters").append("<a id=\"index-link\" class=\"btn btn-primary btn-lg d-block text-uppercase\" href=\"/\">View All Encounters</a>")

        $("div.encounter-card").not("#encounter-" + newEncounter.id).remove()
        $("#encounter-details-" + newEncounter.id).prepend(fullEncounterRender)
        console.log("rendered!")
      }
    })
  })
}

function addEncounterForm() {
  $('a#add-encounter').on("click", function(e) {
    e.preventDefault()

    $.ajax({
      url: this.href,
      method: 'GET',
      success: function(response) {
        $("div.outer-card").remove()
        $("a#index-link").remove()
        $("h2#bannerHeading").text("Add a new encounter");
        $('section#encounters').prepend(response)
        submitEncounterForm();
      }
    })
  })
}

function submitEncounterForm() {

  $("#new_encounter").on("submit", function(e) {
    e.preventDefault()

    console.log('submit listening..')
    $.ajax({
      url: this.action,
      type: 'POST',
      dataType: 'script',
      data: $(this).serialize(),
      success: function(data) {
        console.log("submitted encounter!")

        $("section#encounters").append("<a class=\"btn btn-primary btn-lg d-block text-uppercase\" href=\"/\">View All Encounters</a>")
        $("a.show-link").removeAttr("href");


      }
    })
  })
}
