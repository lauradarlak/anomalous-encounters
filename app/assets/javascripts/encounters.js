
class Encounter {
  constructor(obj){
    this.id = obj.id;
    this.date = obj.date;
    this.state = obj.state;
    this.description = obj.description;
    this.user_display_name = obj.user.display_name
    this.category_slug = obj.category.slug;
    this.category = obj.category.name;
    this.tags = obj.tags
  }
}




Encounter.success = function(json){
  console.log("working?")
  json.map(encounter => {
    var encounter = new Encounter(json);

    var encounterCard = encounter.renderCard();
    $("section#encounters").append(encounterCard)
  })
}

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
    }
  })
  // .success(Encounter.success)

}

Encounter.ready = function(){
  console.log("ready?")
  Encounter.templateSource = $("#encounter-template").html()

  Encounter.template = Handlebars.compile(Encounter.templateSource);


}


Encounter.prototype.renderCard = function(){
  return Encounter.template(this)
}

$(function(){
  if(window.location.pathname === '/') {
    getEncounters()
    Encounter.ready()
  }



})
