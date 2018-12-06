require_relative "../lib/cli.rb"

describe "PalindromeChecker" do

    let (:checker) {PalindromeChecker.new}

    it "returns true when word is a palindrome" do
      expect(check.is_palindrome?("racecar")).to be (true)
    end

    it "returns false when word is not a palindrome" do
      expect(check.is_palindrome?("banana")).to be (false)
    end

    it "ignores case" do
      expect(checker.is_palindrome?("Racecar")).to be (true)
    end
end 
