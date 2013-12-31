require 'spec_helper'

describe "news/edit" do
  before(:each) do
    @news = assign(:news, stub_model(News,
      :title => "MyString",
      :content => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit news form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", news_path(@news), "post" do
      assert_select "input#news_title[name=?]", "news[title]"
      assert_select "textarea#news_content[name=?]", "news[content]"
      assert_select "input#news_user_id[name=?]", "news[user_id]"
    end
  end
end
