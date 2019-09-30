<<<<<<< HEAD
# Active Record Domain Modeling Project

In this assignment, you'll build out your own project, using Active Record to enact database relationships, from scratch. 

## Objectives

1. Try out setting up your own environment from scratch--using past labs as a guide.
2. Build out a complex set of associations, including the belongs to/has many, and many-to-many relationship.
3. Use the code you wrote! Build a simple command line interface class so that a user can interact with your database. 

## Guidelines

In this app, you'll be working with a library domain model. You will have the following models:

* Category (think fiction, non-fiction, biography, science, etc.). A category has a:
  * name
  * has many books
* Book. A book has a:
  * title
  * belongs to a category
  * belongs to an author
* Author. An author has a:
  * name
  * has many books
* User. A user has a:
  * name

The relationship between books and users in a little complex. A user can have many books and a book can belong to many users. At what point in time should a book be added to a user's collection of books? When a user checks that book out of the library. You will need a join table to implement this many-to-many relationship. 

You also need to keep track of the books a user has previously checked out, vs. the books a user has currently checked out. So, each "checked out book" should know the its due date, should know whether or not it was returned and should therefore know if that book is overdue for that user. 

## Instructions

### Environment Set Up

* Start out by setting up your environment. Your file structure should look like this:

```
├── Gemfile
├── Rakefile
├── app
│   └── models
│       ├── category.rb
│       ├── author.rb
│       └── book.rb
        └── user.rb
        └── <your join table model--name it whatever makes sense to you>.rb
├── config
│   └── environment.rb
├── db
│   └── migrate
│       ├── 001_create_categories.rb
│       ...
├── lib
│   └── support
│       ├── connection_adapter.rb
│       └── db_registry.rb
```
Use [this lab](https://github.com/learn-co-curriculum/activerecord-costume-store-todo) to guide you through your environment set up. 

Make sure you have a Gemfile that includes the following gems:

```ruby
source "https://rubygems.org"

gem "rspec"
gem "activerecord"
gem "sqlite3"
gem "rake"
```

A Rakefile that includes the following:

```ruby
require 'active_record'

task :environment do
  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'
end

include ActiveRecord::Tasks
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = 'db/migrate'
seed_loader = Class.new do
  def load_seed
    load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
  end
end
DatabaseTasks.seed_loader = seed_loader.new
load 'active_record/railties/databases.rake'

task :console => :environment do
  Pry.start
end
```

Look to the costume store lab for your to set up your `config/environment.rb` file and the files in your `lib` directory that handle establishing the connection to the database. 

### Database Design

Once your environment is set up, go ahead and design your database. What do you tables need to look like? What foriegn keys need to be included in which tables? Do you need a join table? What columns should it have?

Create and run your migrations. 

### Model Design

Once you have migrated your database, define you models. Remember to inherit them from `ActiveRecord::Base`. Use the appropriate macros to finish building your your associations. 

### Model Methods

Write a `User` instance method that allows a user to "check out" a book. 

```ruby
the_doctor = User.create(name: "The Doctor")
book = Book.create(title: "Tardis Manual")

the_doctor.check_out_book(book, due_date: "September 1st, 2016")

the_doctor.books
# => [#<Book:0x007f8973912 @title="Tardis Manual">]

book.users
# => [#<User:8x007f867390fe38 @name="The Doctor">]
```

When a user check's out a book, it should create a new UserBook record (or Checkout record or whatever you want to call you join table/model). That new UserBook record should have a attribute (and therefore table column) of `returned?` which should default to `false`

So, after running the code above, I should be able to run the following code and see the following return values:

```ruby
UserBook.where(user: the_doctor, returned: false)
# => [#<User:0x007f867390fe38 
        @user=#<User:0x007290867390fe38 @name="The Doctor">,
        @book=#<Book:7x007f8673999 @title="Tardis Manual">,
        @returned=false>
      ]
```


Write  `User` instance method that allows a user to "return" a book.

```ruby
the_doctor.return_book(book)
the_doctor.books
# => [#<Book:0x007f8973912 @title="Tardis Manual">]

UserBook.where(user: the_doctor, returned: false)
# => []

UserBook.where(user: the_doctor, returned: true)
# => [#<User:0x007f867390fe38 
        @user=#<User:0x007290867390fe38 @name="The Doctor">,
        @book=#<Book:7x007f8673999 @title="Tardis Manual">,
        @returned=false>
      ]
```

### Play around with your code

Run the console task, `rake console`, and play around with the code you wrote to make sure your associations are working properly. Make and save an instance of category, book, author and use. Add the book to your category's collection of books, add the book to the author's collection of books. Have the user "check out" the book. Have the user "return" the book. 

### Command Line Interface

If you have time, build out a very simple CLI that does the following:

* Greet the user
* Ask the user for their name so you can find that user in your database
* Show the user a list of categories and ask them to choose a category whose books they want to see
* Show the user all the books in the chosen category
* Allow the user to choose a book to check out
* Check out that book for them
* Prompt and allow the user to return the book

*This functionality will require you to see you database with a few dummy categories, books and users. Put this code in your `db/seeds.rb` file and run `rake db:seed`.






=======
# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. In example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Be prepared to present your project to your peers (3 - 5 minutes) 
  * _See below for instructions_
6. *OPTIONAL* Prepare a video demo (narration helps!) describing how a user would interact with your working project.
7. *OPTIONAL*: Write a blog post about the project and process.

## Short Presentation Requirements

Presenting to others on a technical topic is something you will do several times throughout your experience at Flatiron. This will allow you to practice exercising some important skills. 

#### Introducing Yourself
At the beginning of your presentation you'll want to introduce yourself to the audience. Even if you already know your peers and this feels awkward, this is great & low-stakes way to practice for your personal elevator pitch in a welcoming space. Take it seriously and be kind to others; maybe you'll learn something new about someone!

Aim for a short, 30-second summary of your career progression, leading up to Flatiron School, with an emphasis on your professional skills and goals. Think of it as a condensed narration of your story; where you started, what inspired you to get into coding (did you have a pivotal "aha!" moment?), what you're passionate about, and what you're looking forward to going forward (job and/or career wise).

Here are two examples as inspiration:

> Hi, my name is Pam and building and creating things have always been in my blood. It started when I used to make model airplanes in the 5th grade, and continued through college, during which I took a few computer science classes. After graduating with a environmental sustainability degree I worked at hazardous waste and solar energy companies. It wasn't long before I realized that my creative spirit had been stifled and was aching to escape...and that coding was what truly made me come alive! I'm now thrilled to be here at Flatiron and soon launching my new career in software engineering!

> Hi, my name is Tony and I'm a former educator with a Bachelor and Masters in English and Professional Studies from Stony Brook. I've held roles as a teacher, academic policy programmer, and dean of students at two NYC public high schools. I've always loved puzzles and solving problems, and I see coding as an extension of this. I'm excited to merge my previous background in education with my new found programming skills to launch a new career as a developer in the ed tech space.

There's no right or wrong way to introduce yourself. It's your story, so make it your own. :)

#### Technical Presentation Requirements
Having built your project on your own with a partner, you are the expert on it! Even though that's the case, talking about techincal topics can be challenging. Do your best to communicate what you have learned in a way others can digest.
  - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
  - Discuss 3 things you learned in the process of working on this project.
  - Address, if anything, what you would change or add to what you have today?
  - Present any code you would like to highlight.   
  - Be prepared to answer questions from your peers!

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
>>>>>>> 44a2879ab95ad264fed9a56c2b2925f0a7acc7bd
