# HexletCode

HexletCode is simple DSL for building HTML forms. A library with which it is convenient to create forms in site templates. Allows to reduce the form description code many times due to automatic error handling and various controls. With the help of this gem form creation becomes fast and effortless.

[![Actions Status](https://github.com/cuurjol/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/cuurjol/rails-project-lvl1/actions)
[![CI](https://github.com/cuurjol/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/cuurjol/rails-project-lvl1/actions/workflows/main.yml)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```ruby
User = Struct.new(:name, :age, :gender, :job, :usa_resident, :citizenship, keyword_init: true)
user = User.new(name: 'Michael', age: 25, gender: 'm', job: 'Facebook', usa_resident: true, citizenship: %w[germany usa])

# There are several input types: string (by default), boolean, password, select, text
HexletCode.form_for(user, url: '/users/1') do |f|
  f.input :name
  f.input :age
  f.input :gender
  f.input :job, as: :text, rows: 50, cols: 50
  f.input :usa_resident, as: :boolean
  f.input :citizenship, as: :select, multiple: true, options: %w[russia germany england usa]
  f.submit
  f.reset
end

# <form action="/users/1" method="post">
#   <label for="name">Name</label>
#   <input type="text" value="Michael" name="name">
#   <label for="age">Age</label>
#   <input type="text" value="25" name="age">
#   <label for="gender">Gender</label>
#   <input type="text" value="m" name="gender">
#   <label for="job">Job</label>
#   <textarea rows="50" cols="50" name="job">Facebook</textarea>
#   <input type="checkbox" value="true" name="usa_resident" checked>
#   <label for="usa_resident">Usa Resident</label>
#   <label for="citizenship">Citizenship</label>
#   <select name="citizenship" multiple>
#     <option value="russia">russia</option>
#     <option value="germany" selected>germany</option>
#     <option value="england">england</option>
#     <option value="usa" selected>usa</option>
#   </select>
#   <input type="submit" value="Save" name="submit">
#   <input type="reset" value="Reset" name="reset">
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Author

**Kirill Ilyin**, study project from [Hexlet](https://ru.hexlet.io/)
