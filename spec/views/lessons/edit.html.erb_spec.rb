require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :name => "MyString",
      :subject => "MyString",
      :content => "MyString",
      :course => nil
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do

      assert_select "input#lesson_name[name=?]", "lesson[name]"

      assert_select "input#lesson_subject[name=?]", "lesson[subject]"

      assert_select "input#lesson_content[name=?]", "lesson[content]"

      assert_select "input#lesson_course_id[name=?]", "lesson[course_id]"
    end
  end
end
