
class Encounter {
  constructor(obj){
    this.id = obj.id;
    this.date = obj.date;
    this.state = obj.state;
    this.description = obj.description;
    this.short_description = obj.description.substring(0, 200) + "...";
    this.user_display_name = obj.user.display_name
    this.category_slug = obj.category.slug;
    this.category = obj.category.name;
    this.tags = obj.tags
  }
}



// Encounter.success = function(json){
//   console.log("working?")
//   json.map(encounter => {
//     var encounter = new Encounter(json);
//
//     var encounterCard = encounter.renderCard();
//     $("section#encounters").append(encounterCard)
//   })
// }

function getEncounters() {
  $.ajax({
    url: 'http://localhost:3000/encounters',
    method: 'get',
    dataType: 'json',
    success: function(json) {
      console.log("test: ", json)
      json.map(encounter => {

        var newEncounter = new Encounter(encounter)

        var encounterCard = newEncounter.renderCard();

        $("section#encounters").append(encounterCard)

      })
      listenforShowClick()
    }
  })
}

Encounter.ready = function(){
  console.log("ready?")
  Encounter.templateSource = $("#encounter-template").html()
  Encounter.template = Handlebars.compile(Encounter.templateSource)
  getEncounters()

}

Encounter.readyFull = function(){
  console.log("ready full?")
  Encounter.templateSource = $("#single-encounter-template").html()
  Encounter.templateFull = Handlebars.compile(Encounter.templateSource)


}


Encounter.prototype.renderCard = function(){
  return Encounter.template(this)
}

Encounter.prototype.renderFullCard = function(){
  return Encounter.templateFull(this)
}

function listenforShowClick() {
  console.log('listening..')
  $('button').on('click', function() {

    var encounter_id = $(this).data("id")
    var encounter_user = $(this).data("user")
    getEncounter(encounter_id, encounter_user)

  })
}

function getEncounter(val, val2) {
  const encounter_id = val
  const encounter_user = val2
  const encounter_url = 'http://localhost:3000/' + encounter_user + '/encounters/' + encounter_id


  $.ajax({
    url: encounter_url,
    method: 'get',
    dataType: 'json',
    success: function(json) {
      console.log("test: ", json)
      var newEncounter = json
      var templateSource = $("#single-encounter-template").html()
      var templateFull = Handlebars.compile(templateSource)
      var compiledCard = templateFull(newEncounter)

        $("section#encounters").empty()
        $("section#encounters").append(compiledCard)
    }
  })
}

$(function(){

  if(window.location.pathname === '/') {

    Encounter.ready()
  }



})
