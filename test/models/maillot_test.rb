require 'test_helper'

class MaillotTest < ActiveSupport::TestCase
  test "maillot attributes must not be empty" do
  maillot = Maillot.new
  assert maillot.invalid?
  assert maillot.errors[:title].any?
  assert maillot.errors[:description].any?
  assert maillot.errors[:price].any?
  assert maillot.errors[:image_url].any?
end
	test "maillot price must be greater than or equal to 1" do
		maillot = Maillot.new(
			title: "some maillot",
			description: "toutes descriptions",
			price: 0,
			image_url: "aze.jpg"
			)
		assert maillot.invalid?
		assert_equal ["must be greater than or equal to 1"], maillot.errors[:price]

		maillot.price = 1
		assert maillot.valid?
	end
	test "maillot title must be unique regardless of the case" do 
		maillot = maillots(:one).dup

		assert maillot.invalid?
		assert_equal ["has already been taken"], maillot.errors[:title]

		maillot.title.upcase!
		assert maillot.invalid?
		assert_equal ["has already been taken"], maillot.errors[:title]

		maillot.title = "changed"
		assert maillot.valid?
	end
	test "maillot image_url must ends with .jpg, .gif, .png regardless of the case" do
		maillot = maillots(:one)

		valids = %w(bor1.jpg bor1.gif bor1.png bor1.JPG bor1.GIF bor1.PNG https://bor1.bar/baz/some.jpg)
		invalids = %w(bor1.xls bor1.gif.exe)

		invalids.each do |url|
			maillot.image_url = url
			assert maillot.invalid?
			assert_equal ["doit être au format jpg, png ou gif"], maillot.errors[:image_url]
		end

		valids.each do |url|
			maillot.image_url = url
			assert maillot.valid?
		end
	end


end
