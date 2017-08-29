require "minitest/autorun"
require_relative "isbn_method.rb"
class Test_isbn < Minitest::Test 

def test_2_equals_2
	assert_equal(2,2)
end	

def test_simple_legth
	assert_equal(true, isbn_check("0471958697"))
end	

def test_char_test
	assert_equal(true, isbn_checker("0-321-14653-0"))
end	

def test_char_test_2
	assert_equal(true, isbn_checker("0 321-14a53-0"))
end	

def test_math_test_1
	assert_equal(true, math_function("0471958697"))
end	

def test_math_test_1
	assert_equal(false, math_function("0471958691"))
end

def test_math_test_1
	assert_equal(false, math_function("047195869x"))
end



#----------------ISBN 13 TESTS BELOW THIS LINE----------------------------------------

def test_isbn13_length_1
	assert_equal(true, isbn13check("978047-0059029"))
end	

end	