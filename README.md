# GlitchCraft
GlitchCraft is a Ruby on Rails application allowing users to glitch images. Users can search for images based off a keyword that will return two images for the user's choosing. The first image is created by an AI from scratch based on the keyword via [DeepAI](https://deepai.org/machine-learning-model/text2img), while the second is returned based off search results from human generated image tags in [pixabay](https://pixabay.com/en/photos/search/). This gives user's the option to glitch an image that resembles human perceived notions or an AI's generated notions. GlitchCraft uses a combination of JavaScript and Canvas to glitch the images and employs Google OAuth to authenticate users. Images are stored via ActiveStorage and can be downloaded to the user's computer. 

## Relevant links
[View our app!](https://glitch-craft.herokuapp.com/)

[GlitchService Microservice](https://damp-forest-93176.herokuapp.com/)

[GlitchService GitHub](https://github.com/Kathybui732/glitch-service)

## Versions
Ruby 2.5.3
Rails 5.2.4.4

## Configuration
1. Run `git clone git@github.com:sciencefixion/glitch_craft.git`
2. `cd glitch_craft`
3. `bundle install`
4. `rake db:{create,migrate}`
5. `bundle exec figaro install`
6. Add your google client secret and ID to the application.yml file
7. `rails s`

## Test Suite
1. Run `bundle exec rspec`

## Microservices
This app depends on the [GlitchService microservice](https://damp-forest-93176.herokuapp.com/). GlitchService works in hand with GlitchCraft to consolidate two images that users can choose from to glitch.

## Contributors

[Dan Sehl's GitHub](https://github.com/dtsehl) &
[Linkedin](https://www.linkedin.com/in/danielsehl)

[Jane Greene's Github](https://github.com/janegreene) &
[Linkedin](https://www.linkedin.com/in/jane-greene-mba/)

[Kathy Bui's Github](https://github.com/Kathybui732) &
[Linkedin](https://www.linkedin.com/in/kathy-bui-87a27a1ab/)

[Dorion's GitHub]() &
[Linkedin]()

## Our App

### Schema
![Schema]()

### Welcome page
<<<<<<< HEAD
![Welcome Page](https://imgur.com/Bz6sJzN)
=======
![Welcome Page](https://i.imgur.com/Bz6sJzN.png)
>>>>>>> cb4755e639e698b0d3556f2bba8b8e76e9a1a87d

### User Dashboard
![User Dashboard]()

### Image Search Results
![Image Search Results]()

### Glitch an image!
![Glitch an Image]()
