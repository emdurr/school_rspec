require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      :name => "Name",
      :subject => "Subject",
      :content => "Content",
      :course => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(//)
  end
end
