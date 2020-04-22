require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(name: "Bob", email: "bob@example.com",
                      password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @chef.valid?
  end

  test "name should be present" do
    @chef.name = ""
    assert_not @chef.valid?
  end

  test "name should be less than 30 characters" do
    @chef.name = "q" *31
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end

  test "email should not be too long" do
    @chef.email = "t" *245 + "@example.com"
    assert_not @chef.valid?
  end

  test "email should be valid format" do
    valid_emails = %w[user@example.com bob@example.com steve@example.com]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end
  end

  test "should reject invalid email address" do
    invalid_emails = %w[bob@example steve@yahoo,com Sett@gmail. Ashe@u+suck.com]
    invalid_emails.each do |invalid_email|
      @chef.email = invalid_email
      assert_not @chef.valid?, "#{invalid_email.inspect} should be valid"
    end
  end

  test "email should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

  test "email should be lowercase before hitting database" do
    mixed_email = "joHn@example.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end

  test "password should be present" do
    @chef.password = @chef.password_confirmation = " "
    assert_not @chef.valid?
  end

  test "password should be at least 5 characters" do
    @chef.password = @chef.password_confirmation = "abcd"
    assert_not @chef.valid?
  end

end
