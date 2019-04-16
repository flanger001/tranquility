# A Touch Of Tranquility
Greetings! 

A Touch Of Tranquility is a massage therapy and wellness spa owned by Christina Lower ([christinamlower@gmail.com](mailto:christinamlower@gmail.com)) and located in Corning, NY.

This application is the business information website for the spa. 
It lives on the internet at https://www.atouchoftranquilityspa.com.
Christina is the client and principal content manager.

If you are reading this, you are a collaborator on this project! 
You probably want to know how to get rolling, so let's get you rolling.

# Development
## Prerequisites
* Homebrew (https://brew.sh) 
* Ruby 2.5.1 (I recommend  **rbenv** - https://github.com/rbenv/rbenv)
* Postgres (I recommend  **Postgres.app** - https://postgresapp.com)
* `heroku` https://devcenter.heroku.com/articles/heroku-cli

You will also need credentials for the external services. 
I should have given you those, but if I haven't, contact me ([dave.shaffer@gmail.com](mailto:dave.shaffer@gmail.com)) and I will. 
Copy these into `.env.development` and `.env.test`. 

## Building the application
Once you have your prerequisites installed, you can run these two commands to build the application:

 ```bash
 $ bundle install
 $ bundle exec rails db:setup
 ```

## Running the application server
```bash
$ bundle exec rails s
```

## Running the test suite
```bash
$ bundle exec rspec
```

## Running Rubocop
```bash
$ bundle exec rubocop
```

# Application structure
This is a basic Rails CMS with some custom elements. It is structured as a few static information pages and some dynamically generated ones.

Information pages are built as actions in `PagesController`. 
Simply create a template in `app/views/pages`, add the route in `config/routes.rb`, and Rails will handle the rest.
An example is `app/views/pages/index.html.erb` - this is the landing page for the website.

If you need anything more interesting initialized in an action, you can do that in `PagesController`.
There is no `Page` model currently.
`Snippet` objects are used in a few areas to denote free text fields.
`SnippetCollections` are collections of snippets and are only used for organization currently.

`Users` are admin users who have the ability to create other objects.
Users are authenticated with an email and password at `/login`.
This presents them with an admin panel where all site content is managed.

The main components of the application are the `CategoryCollection`, `Category`, and `Product` models. 
These dynamically build the general structure of the website by exposing a friendly url structure.
All of the following items are entered by Christina into the CMS.
The `db/seeds.rb` file contains some examples of each of these items, so you should have a few of them already loaded into the database.

### `CategoryCollection`
`CategoryCollection` objects are linked to in the navigation bar and are the primary navigational item.
They represent collections of product categories; large-scale groups of service types for the spa.
An example is "Bodywork", which contains the "Massage Therapy", "Specialty Bodywork", and "Massage and Pregnancy" categories.
It lives at `/collections/bodywork`

### `Category`
`Category` objects are children of `CategoryCollections`.
These contain `Product` objects and are used to group individual services together under a common heading.
An example is "Massage Therapy", under "Bodywork".
It lives at `/categories/massage-therapy`

### `Products`
`Product` objects are the actual services themselves.
These have `ProductAttribute` child objects. 
`ProductAttribute` records are how we model pricing as the client can have multiple prices and times for each product.
An example is "Tranquility Massage" under "Bodywork > Specialty Bodywork".

### `Staff`
The `Staff` model concerns spa employees. 
These have photos and `Schedule` child objects for showing employee availability. 
`Schedule` objects have `Event` child objects.
`Event` objects correspond to a time span for a day.

There is one special `Schedule` object called "Spa Hours".
This represents the business hours for the spa.

### `Review`
`Review` records are currently manually built by the client. 
There is a feature on the roadmap where customers will be able to click a link that sends them to a review page and they can fill out their own review.

### `Recommendations`
`Recommendation` objects are for the client to promote outside businesses or services.

## External services
* Photo uploading to AWS (provided by [`carrierwave-aws`](https://github.com/sorentwo/carrierwave-aws)) 
* Photo thumbnail creation (provided by [`mini_magick`](https://github.com/minimagick/mini_magick))
* New Relic Application performance monitoring (provided by [`newrelic_rpm`](https://github.com/newrelic/rpm)) 
* Bug monitoring by Sentry (provided by [`sentry-raven`](https://github.com/getsentry/raven-ruby)) 
* Sitemap generation (provided by [`sitemap_generator`](https://github.com/kjvarga/sitemap_generator))
* Application hosting by [Heroku](https://www.heroku.com)

# Git strategy
1. Branch off `master`
1. Use a namespaced branch that describes what you're doing, such as `bugfix/header-image` or `enhancement/better-photos`
1. Write your code
1. If you need to write tests, write your tests
1. Before you commit, run `bundle exec rubocop --auto-correct` and fix anything that is not autocorrected
1. Open a pull request targeting `master`
1. When your branch is merged, delete it

### If `master` has been updated since you branched
```bash
$ git commit             # (or git stash if you don't feel like committing - the point is to save your work)
$ git fetch origin       # gets all the upstream work
$ git checkout master    # switch to the master branch
$ git merge              # update local master to the current
$ git checkout my-branch # check out your branch
$ git rebase master      # rebase your branch against master
```

# Deployment
This application is hosted on Heroku.
Deployment can be managed either from the command line with `heroku` commands or via the web app at https://www.heroku.com.
There is a pipeline with a staging app and a production app. 

### Remotes
```bash
$ heroku git:remote add --remote production --app atouchoftranquility
$ heroku git:remote add --remote staging --app atouchoftranquility-staging
```

The staging app can be deployed to from any branch. Production must only be deployed to from `master`.
