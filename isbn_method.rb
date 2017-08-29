def isbn_check(i)

	if i.length == 10
		true
	else
	 	false
	end 		
end	

def isbn_checker(hat)

	newhat = hat.gsub!(/[^0-9A-Za-z]/, '')
	if newhat.length == 10
		true
	else
		false	
	end	
end

def isbn_full_check(isbn)

	isbn.gsub!(/[^0-9A-Za-z]/, '')
	arr = isbn.split(//)
	valid_keys = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "x"]
	if arr.length == 10
		arr.each do |x|
			if valid_keys.include?(x)
				if math_function(arr)

				else
					false
				end		
			else
				false
			end
		end			
	else
		false
	end		
end	


def math_function(hmm)
	y = 1
	a = 0
	newarr = []
	b = hmm.length - 1
	b.times do
		newarr << hmm[a].to_i * y
		y += 1
		a += 1
	end
	div = newarr.sum
	ch = div%11
		if ch == 10
			ch = "x"
		end	
			if ch == hmm[hmm.length - 1].to_i
				 true
			elsif ch == hmm[hmm.length - 1]
				 true	
			else
				 false	
			end	
end 


