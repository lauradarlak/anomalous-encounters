class Encounter {
  constructor(obj){
    this.id = obj.id;
    this.date = obj.date;
    this.time = obj.time;
    this.state = obj.state;
    this.county = obj.county;
    this.nearest_town = obj.nearest_town
    this.environment = obj.environment
    this.witneses = obj.witneses;
    this.short_description = obj.description.substring(0, 200) + "...";
    this.user_display_name = obj.user.display_name
    this.category_slug = obj.category.slug;
    this.category = obj.category.name;
    this.tags = obj.tags
  }
}
