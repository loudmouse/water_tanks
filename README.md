# Chicago Water Tanks

The city of Chicago was once home to hundreds of water tanks. They are quickly disappearing from the skyline as they are be taken down across the city. This project is an attempt to map, photograph, and document as many of these water tanks before they're gone forever.

For a live version, visit: [Chicago Water Tanks](http://www.chicagowatertanks.com/)

---

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

---

### Prerequisites

You'll need Ruby installed on your local machine. We're using:

```
ruby 2.5.0p0
```

You'll also need Rails installed on your local machine. We're using:

```
Rails 5.1.6
```

You'll also want to create a Google Maps API - its free. You can create one here: [Google Maps API Key](https://developers.google.com/maps/documentation/javascript/get-api-key)

---

### Installing

To install and play around with Chicago Water Tanks on your local machine follow these steps:

1. Visit the repository: [Chicago Water Tanks on GitHub](https://github.com/loudmouse/water_tanks)


2. Clone the repository (for more details on this step visit [this resource](https://services.github.com/on-demand/github-cli/clone-repo-cli). From your command line, type:

```
git clone https://github.com/loudmouse/water_tanks.git
```

3. Run bundle install to ensure you have the correct gems and versions to begin work. From your command line, type:

```
bundle install
```

4. From your command line, start your rails server by typing:

```
rails server
```

5. Install the database. From your command line, type:

```
rails db:install
```

6. Seed the database with sample data. The sample data includes water tank locations, photos, and two users (1 admin and one non-admin). From your command line, type:

```
rails db:seed
```

7. From your browser, visit: [http://localhost:3000/](http://localhost:3000/)


You should now have a functioning build of Chicago Water Tanks on your local machine to play around with.

---

## Deployment

We're currently deployed to Heroku. You can setup a free Heroku account and deploy your app there as well if you'd like.

---

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The programming language used
* [Rails](https://rubyonrails.org/) - The framework used
* [Google Maps API](https://developers.google.com/maps/documentation/javascript/tutorial) - Used to generate maps
* [GMaps4Rails](https://github.com/apneadiving/Google-Maps-for-Rails) - A gem used for custom markers and overlays; integrates with Google Maps API
* [Geocoder](http://www.rubygeocoder.com/) - Ruby gem used to convert a water tank's lat/long location coordinates to addresses and vice versa
* [Chicago Neighborhood KML Overlay - courtesy Chicago Open Data Portal](https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Neighborhoods/bbvz-uum9/data) - KML overlay layer used to identify which neighborhood a water tank belongs to
* [PostgreSQL](https://www.postgresql.org/) - The database used with ActiveRecord
* [Devise](https://rubygems.org/gems/devise/versions/4.2.0) - The Ruby Gem used for authentication
* [Rails Admin](https://rubygems.org/gems/rails_admin/versions/0.8.1) - Ruby gem provides easy-to-use admin interface for CRUD actions for non-technical users. We can grant admin rights to other users to help us moderate the community contributions.
* [Paperclip](https://rubygems.org/gems/paperclip/versions/4.3.6) - Ruby gem used for attaching images of water tanks
* [AWS SDK for Ruby](https://rubygems.org/gems/aws-sdk/versions/3.0.1) - used to connect to AWS S3 storage for storing images of water tanks
* [Acts as Votable](https://rubygems.org/gems/acts_as_votable/versions/0.10.0) - Ruby gem used to allow voting of favorite water tank photos
* [Will Paginate](https://rubygems.org/gems/will_paginate/versions/3.1.6) - Ruby gem used to paginate the list of water tank locations
* [SCSS (Sassy CSS)](https://sass-lang.com/) - The CSS syntax used for front-end styling
* [Bootstrap)](https://rubygems.org/gems/bootstrap/versions/4.0.0) - CSS framework used for styling certain sections of the application

---

## Versioning

Chicago Water Tanks is currently at version 1.0.

---

## Authors

* **Nolan Neeley** - [Nolan's GitHub](https://github.com/loudmouse)
* **Josh Alletto** - [Josh's GitHub](https://github.com/jalletto)

See also the list of [contributors](https://github.com/loudmouse/water_tanks/graphs/contributors) who participated in this project.

---

## Features

**Homepage**

This is the homepage where you see the most recently mapped tank, the map of tanks, and a listing of all tanks with pagination.

![Chicago Water Tanks - Home](/app/assets/images/screenshots/chicago_water_tanks_home_screenshot.png)

---

**Map a Water Tank**

Click 'Add a Water Tank' to map the location of a new water tank and add your photo.
1. Zoom in and click the map to set a pin - a pin drop does a couple things:
  * It detects the latitudinal and longitudinal coordinates of the pin
  * It converts these coordinates into a human readable address and fills the address field
  * It detects which neighborhood your water tank belongs within and displays this info once you've hit submit
2. Click 'Upload a Photo' to attach a photo. A photo is required.
3. Click 'Submit'

Congratulations, you've successfully mapped a water tank and added a photo!

![Chicago Water Tanks - Add a Tank](/app/assets/images/screenshots/add_a_tank_screenshot.png)

---

**Unlock Your Profile**

Once you've created an account you'll gain access to your profile once you've mapped a water tank.
From your profile you can:
- See how many water tanks you've mapped
- Check how many photos you've contributed
- See a map with all the water tanks you've mapped

![Chicago Water Tanks - Unlock Your Profile](/app/assets/images/screenshots/#.png)
