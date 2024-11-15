require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        content: "Content",
        author_name: "Author Name"
      ),
      Comment.create!(
        content: "Content",
        author_name: "Author Name"
      )
    ])
  end

  it "renders a list of comments" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Author Name".to_s), count: 2
  end
end
