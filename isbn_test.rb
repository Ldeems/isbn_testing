require "minitest/autorun"
require_relative "isbn_method.rb"
class Test_isbn < Minitest::Test 

#  def test_2_equals_2
#  	assert_equal(2,2)
#  end	

#  def test_math_test_1
# 	assert_equal(true, math_function("0471958697"))
#  end	

#  def test_math_test_1
#  	assert_equal(false, math_function("0471958691"))
#  end

#  def test_math_test_1
#  	assert_equal(false, math_function("047195869x"))
#  end

#  def test_full_isbn10_test_1
#  	assert_equal(true, isbn_full_check("0471958697"))
#  end	

# def test_full_isbn10_test_2
# 	assert_equal(true, isbn_full_check("0-321-14653-0"))
# end	

#  def test_full_isbn10_test_3
#  	assert_equal(true, isbn_full_check("877195869x"))
#  end

#  def test_full_isbn10_test_4
#  	assert_equal(false, isbn_full_check("87-7194869x"))
#  end

#  def test_full_isbn10_test_5
#  	assert_equal(false, isbn_full_check("a771s5869x"))
#  end


#  def test_full_isbn10_test_6
#  	assert_equal(false, isbn_full_check("3771@5869x"))
#  end

#   def test_full_isbn10_test_7
#  	assert_equal(false, isbn_full_check("87-7195&869x"))
#   end

#   def test_full_isbn10_test_8
# 	assert_equal(false, isbn_full_check("0-321-14@653-0"))
# end

#----------------ISBN 13 TESTS BELOW THIS LINE----------------------------------------

	

# def test_isbn13_math_1
# 	assert_equal(true, isbn13math("9780470059029"))
# end

# def test_isbn13_math_2
# 	assert_equal(true, isbn13math("9780131495050"))
# end

# def test_isbn13_math_3
# 	assert_equal(false, isbn13math("9780770051029"))
# end

def test_isbn13_full_1
	assert_equal(true, isbn13full("978 0 471 48648 0"))
end

def test_isbn13_full_2
	assert_equal(true, isbn13full("978-0-13-149505-0"))
end

def test_isbn13_full_3
	assert_equal(false, isbn13full("978 0 571 48648 0"))
end

end	