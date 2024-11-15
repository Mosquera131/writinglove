require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        category: "Category",
        title: "Title",
        content: "Content"
      ),
      Post.create!(
        category: "Category",
        title: "Title",
        content: "Content"
      )
    ])
  end

  it "renders a list of posts" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Category".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
  end
end
