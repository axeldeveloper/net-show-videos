# install rails 
    
    gem install rails --no-document 
    
    `Successfully installed rails-5.2.2 1 gem installed`
    

# create project

    rails new myapp --database=postgresql

# create controller

    rails g controller sessions new create destroy
    rails g controller videos index show new create edit update destroy

# create model

    rails generate model User name:string email:uniq password:digest

    rails g model Video nome:string url:text

    rails g migration add_user_reference_to_video user:references
    
    rails g model view total:integer video:references

# scaffold

    rails g scaffold User name:string email:uniq password:digest


# Create a home page

    rails g controller home index

# view
    create file in app/views/home/index.html.erb

# route
    add root 'home#index' `config/routes.rb`

# Migreate
    rails db:migrate


# GEM
    install gem boostrap 
    mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss

# Dependencies 
    gem 'bootstrap', '~> 4.5.0'
    gem 'jquery-rails'
    gem 'bcrypt'

    bundle install

# Project 
 1 Ruby   `ruby 2.5.5p157`

 2 PostgrsSQL 

 3 Rails `Rails 5.2.4.2`


# CMD
rails -v
ruby - v

# rum
rails server

Rails version: 5.2.4.3
Ruby version: 2.5.5 (x86_64-linux)

# https://3rd-edition.railstutorial.org/book/log_in_log_out
https://github.com/comfy/comfortable-mexican-sofa
