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

  def test_complex_form
    user_struct = Struct.new(:name, :age, :gender, :job, :usa_resident, :citizenship, keyword_init: true)
    user = user_struct.new(name: 'Michael', age: 25, gender: 'm', job: 'Facebook', usa_resident: true,
                           citizenship: %w[germany usa])

    expected_complex_form = load_fixture('complex_form.html')
    result = HexletCode.form_for(user, url: '/users/1') do |f|
      f.input :name
      f.input :age
      f.input :gender
      f.input :job, as: :text, rows: 50, cols: 50
      f.input :usa_resident, as: :boolean
      f.input :citizenship, as: :select, multiple: true, options: %w[russia germany england usa]
      f.submit
      f.reset
    end

    assert_equal(expected_complex_form, result)
  end
end
