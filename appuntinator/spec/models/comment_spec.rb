require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  it "Create Commento" do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    @app = Appunto.create(:user_id => @user.id, :contenuto => "Content", :category => "Arte")

    session = Comment.new(:user_id => @user2.id, :body => "Content", :appunto_id => @app.id, :rating => 0)
    expect(session).to be_valid

    @user.destroy
    @user2.destroy
    @app.destroy
  end

  it "is not valid without a user" do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    @app = Appunto.create(:user_id => @user.id, :contenuto => "Content", :category => "Arte")

    session = Comment.new(:user_id => nil, :body => "Content", :appunto_id => @app.id, :rating => 0)
    expect(session).to_not be_valid

    @user.destroy
    @user2.destroy
    @app.destroy
  end

  it "is not valid without a rating" do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    @app = Appunto.create(:user_id => @user.id, :contenuto => "Content", :category => "Arte")

    session = Comment.new(:user_id => @user2.id, :body => "Content", :appunto_id => @app.id, :rating => nil)
    expect(session).to_not be_valid

    @user.destroy
    @user2.destroy
    @app.destroy
  end

  it "is not valid without an appunto" do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    @app = Appunto.create(:user_id => @user.id, :contenuto => "Content", :category => "Arte")

    session = Comment.new(:user_id => @user2.id, :body => "Content", :appunto_id => nil, :rating => 0)
    expect(session).to_not be_valid

    @user.destroy
    @user2.destroy
    @app.destroy
  end
end
