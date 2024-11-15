require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    assign(:post, Post.create!(
      category: "Category",
      title: "Title",
      content: "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
  end
end
