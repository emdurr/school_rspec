require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        :name => "Name",
        :subject => "Subject",
        :content => "Content",
        :course => nil
      ),
      Lesson.create!(
        :name => "Name",
        :subject => "Subject",
        :content => "Content",
        :course => nil
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
