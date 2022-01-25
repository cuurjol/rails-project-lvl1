# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_simple_form
    user_struct = Struct.new(:name, :gender, :job, keyword_init: true)
    user = user_struct.new(name: 'Cuurjol', gender: 'm', job: 'Hexlet')

    expected_simple_form = load_fixture('simple_form.html')
    result = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :gender
      f.input :job
      f.submit
    end

    assert_equal(expected_simple_form, result)
  end

  def test_simple_form_with_textarea
    user_struct = Struct.new(:name, :bio, keyword_init: true)
    user = user_struct.new(name: 'Cuurjol', bio: 'Hello world! Very long test text!')

    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :bio, as: :text, rows: 50, cols: 30
      f.submit
    end

    assert(form.include?('<textarea rows="50" cols="30" name="bio">Hello world! Very long test text!</textarea>'))
  end
end
