
class Encounter {
  constructor(obj){
    this.id = obj.id;
    this.date = obj.date;
    this.state = obj.state;
    this.short_description = obj.description.substring(0, 200) + "...";
    this.user_display_name = obj.user.display_name
    this.category_slug = obj.category.slug;
    this.category = obj.category.name;
    this.tags = obj.tags
  }
}

function getEncounters() {
  $.ajax({
    url: 'http://localhost:3000/encounters',
    method: 'get',
    dataType: 'json',
    success: function(json) {
      console.log("test: ", json)
      json.forEach(encounter => {
        var newEncounter = new Encounter(encounter)
        var encounterCard = newEncounter.renderCard();
        $("#details-template-" + newEncounter.id).append(encounterCard)
        console.log("rendered!")
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

Encounter.prototype.renderCard = function(){
  return Encounter.template(this)
}

function listenforShowClick() {
  console.log('listening..')
  $('a.show-link').on('click', function(e) {
    e.preventDefault()
    var encounter_id = $(this).closest('[data-id]').data('id')
    var encounter_user = $(this).closest('[data-user]').data('user')

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
      getEncounterTemplate(json);
    }
  })
}

function getEncounterTemplate(data) {
  var templateSource = $("#single-encounter-template").html()
    var templateFull = Handlebars.compile(templateSource)
    var compiledCard = templateFull(data)

    $("section#encounters").empty()
    $("section#encounters").append(compiledCard)
}

const addEncounterForm = () => {
  $('a#add-encounter').on("click", function(e) {
    e.preventDefault()

    $.ajax({
      url: this.href,
      method: 'GET',
      success: function(response) {
        $('section#encounters').empty()
        $('section#encounters').html(response)
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
      dataType: 'json',
      data: $(this).serialize(),
      success: function(response) {

        let encounter = new Encounter(response)
        // getEncounterTemplate(encounter)
        var encounterCard = encounter.renderCard();
        $("section#encounters").append(encounterCard)
      }
    })
  })
}

$(function(){

  if(window.location.pathname === '/') {
    Encounter.ready()
    addEncounterForm()
  }

})
