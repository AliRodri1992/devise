require 'rails_helper'
RSpec.describe User, :type => :model do
  it 'is databse authenticable' do
    user = User.create!(:username => "andres92", :password => "cucha9209", :password_confirmation => "cucha9209", :email => "andres92@gmail.com")
    expect(user.valid_password?('cucha9209')).to be_truthy
  end
end