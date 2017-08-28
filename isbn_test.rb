require "minitest/autorun"
require_relative "isbn_method.rb"
class Test_isbn < Minitest::Test 

def test_2_equals_2
	assert_equal(2,2)
end	

def test_simple_legth
	assert_equal(true, isbn_check("0471958697"))
end	

end	