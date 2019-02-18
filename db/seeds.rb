# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'test@email.com', display_name: 'yeti_4ever', password: '123456', password_confirmation: '123456')

Encounter.create(
  date: '2019-01-01',
  time: "2000-01-01 16:17:00",
  state: 'NY',
  county: 'Tompkins',
  nearest_town: 'Ithaca',
  conditions: 'Blizzard conditions. Near white-out on road.',
  environment: 'Driving down route 79',
  description: 'Nam commodo suscipit quam. Pellentesque ut neque. Praesent adipiscing. Curabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo.
  Curabitur vestibulum aliquam leo. Curabitur at lacus ac velit ornare lobortis. Quisque id mi. Praesent ac massa at ligula laoreet iaculis.',
  witnesses: true,
  user_id: 1,
  category_id: 1
)

Encounter.create(
  date: '2016-11-01',
  time: "2000-01-01 19:20:00",
  state: 'NM',
  county: 'Taos',
  nearest_town: 'Taos',
  conditions: 'Clear night.',
  environment: 'Rural area in the high desert',
  description: 'Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Praesent blandit laoreet nibh. Phasellus gravida semper nisi. Quisque id odio.
  Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus. Vivamus consectetuer hendrerit lacus. Nullam cursus lacinia erat. Vestibulum dapibus nunc ac augue.
  Vestibulum dapibus nunc ac augue. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Vivamus elementum semper nisi. Curabitur blandit mollis lacus.
  Nullam tincidunt adipiscing enim. In consectetuer turpis ut velit. Morbi mollis tellus ac sapien. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum.',
  witnesses: false,
  user_id: 1,
  category_id: 2
)

Encounter.create(
  date: '2017-04-21',
  time: "2000-01-01 04:20:00",
  state: 'KY',
  county: 'Adair',
  nearest_town: 'Columbia',
  conditions: 'Early morning',
  environment: 'Bottom field in the holler',
  description: 'Morbi ac felis. Morbi mattis ullamcorper velit. Aliquam lobortis. Fusce pharetra convallis urna.
  Morbi mattis ullamcorper velit. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo. Praesent nec nisl a purus blandit viverra. Cras ultricies mi eu turpis hendrerit fringilla.
  Ut leo. Cras non dolor. Morbi nec metus. Praesent nec nisl a purus blandit viverra.',
  witnesses: false,
  user_id: 1,
  category_id: 9
)

Category.create(name: 'UFO')
Category.create(name: 'Alien')
Category.create(name: 'Sasquatch')
Category.create(name: 'Paranormal')
Category.create(name: 'Altered States of Consciousness')
Category.create(name: 'Interdimensional')
Category.create(name: 'Out of Body')
Category.create(name: 'Shapeshifter')
Category.create(name: 'Fairy')
Category.create(name: 'Unicorn')
Category.create(name: 'Gnome')
Category.create(name: 'Other')

Tag.create(name: 'probe')
Tag.create(name: 'growling')
Tag.create(name: 'mind')
Tag.create(name: 'cigar shape')
Tag.create(name: 'time shift')
Tag.create(name: 'bright lights')
