require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should create a user when passed the right attributes" do
      @user = User.new({name: 'John Doe', email: 'john.doe@example.org', password: "qwertyuio", password_confirmation: "qwertyuio" })
      expect(@user).to be
    end

    it "should have password and password_validation fields matching" do
      @user = User.new({name: 'John Doe', email: 'john.doe@example.org', password: "qwertyuio", password_confirmation: "qwertyuio" })
      expect(@user.password).to eql(@user.password_confirmation)
    end

    it "must be created with a password and password_validation fields" do
      @user = User.new({name: 'John Doe', email: 'john.doe@example.org', password: "qwertyuio", password_confirmation: "qwertyuio"})
      expect(@user.password).not_to be_nil
      expect(@user.password_confirmation).not_to be_nil
    end

    it "must be created with a unique email" do
      expect(User.new({name: 'John Doe', email: 'carlos.m.garate@gmail.com', password: "qwertyuio", password_confirmation: "qwertyuio" })).not_to raise_error
    end

    it "must have a password at least 8 characters long" do
      expect(User.new({name: 'John Doe', email: 'carlos.m.garate@gmail.com', password: "qwertyuio", password_confirmation: "qwertyuio" })).to raise_error
    end

  end

  describe '.authenticate_with_credentials' do

    it "should authenticate the user" do
      user = User.new({name: 'Carlos', email: 'carlos@example.com', password: "qwertyui", password_confirmation: "qwertyui" })
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to_not be_nil
    end

  end

end
