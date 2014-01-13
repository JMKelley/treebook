require 'test_helper'

class StatusTest < ActiveSupport::TestCase
	test "user needs to enter content!" do
		status = Status.new
		assert !status.save
		assert !status.errors[:content].empty?
	end



	test "Needs to be atlest 2 letters long" do
		status = Status.new
		status.content = "H"
		assert !status.save
		assert !status.errors[:content].empty?
	end



	test "Needs a user id before posting" do
		status = Status.new
		status.content = "Hello there!"
		
		assert !status.save
		assert !status.errors[:user_id].empty?
	end
end
