require 'rails_helper'
require 'database_cleaner'

RSpec.describe Appunto, type: :model do

  it "Create Appunto"  do
    @user = FactoryBot.create(:user)
    session = Appunto.new(:user_id => @user.id, :contenuto => "Content", :category => "Arte")
    expect(session).to be_valid
    @user.destroy
  end
  
  it "is not valid without a user" do
    session = Appunto.new(:user_id => nil, :contenuto => "Content", :category => "Arte")
    expect(session).to_not be_valid
  end
  
  it "is not valid without a content" do
    @user = FactoryBot.create(:user)
    session = Appunto.new(:user_id => @user.id, :contenuto => nil, :category => "Arte")
    expect(session).to_not be_valid
    @user.destroy
  end

  it "is not valid without a category" do
    @user = FactoryBot.create(:user)
    session = Appunto.new(:user_id => @user.id, :contenuto => nil, :category => nil)
    expect(session).to_not be_valid
    @user.destroy
  end

end
