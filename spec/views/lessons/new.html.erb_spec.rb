require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :name => "MyString",
      :subject => "MyString",
      :content => "MyString",
      :course => nil
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input#lesson_name[name=?]", "lesson[name]"

      assert_select "input#lesson_subject[name=?]", "lesson[subject]"

      assert_select "input#lesson_content[name=?]", "lesson[content]"

      assert_select "input#lesson_course_id[name=?]", "lesson[course_id]"
    end
  end
end
