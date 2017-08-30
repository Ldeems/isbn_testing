def isbn_size_check(n)
	looking = n.gsub(/[^0-9A-Za-z]/, '')
	if looking.length == 10
		isbn_full_check(n)
	else
	 	isbn13full(n)
	end 		
end	

#-------------------------isbn10 things below this line---------------------------------------------

def isbn_full_check(isbn)

	valid_keys = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "x"]
	thing = key_checker(isbn)
	if thing == true
		isbn.gsub!(/[^0-9A-Za-z]/, '')
		arr = isbn.split(//)
			if arr.length == 10
				some = math_function(arr)
					if some == true
						true
					else
						false
					end		
			else
				false
			end	
	else
		false
	end		
end	

def key_checker(arr)
    true_arr = []
    valid_keys = ["0","1","2","3","4","5","6","7","8","9","x", " ", "-"]
   
    newarr = arr.split(//)
 
    newarr.each do |x|
        if valid_keys.include?(x)
            true_arr << true
        else
            true_arr << false
        end
    end
    if true_arr.include?(false)
    	
        false

    else
    	
        true
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

#---------------------------------------ISBN 13 STUFF BELOW THIS LINE------------------------------



def isbn13full(x)

	thing = isbn13keycheck(x)
	if thing == true
		x.gsub!(/[^0-9]/, '')
		if x.length == 13
			wow = isbn13math(x)
			if wow == true
				true
			else
				false
			end	
		else
			false	
		end
	else
		false		
	end	
end

def isbn13keycheck(x)

 true_arr = []
    valid_keys = ["0","1","2","3","4","5","6","7","8","9", " ", "-"]
   
    arr = x.split(//)
 
    arr.each do |d|
        if valid_keys.include?(d)
            true_arr << true
        else
            true_arr << false
        end
    end
    if true_arr.include?(false)
    	
        false

    else
    	
        true
    end

end
	
def isbn13math(x)
	arr = x.split(//)
	newarr = []
	count = 1
	12.times do 
		if count % 2 == 0
			newarr << arr[count - 1].to_i * 3
			count += 1
		else
			newarr << arr[count - 1].to_i * 1
			count += 1
		end	
	end	
	sum = newarr.sum
    y = sum % 10
    x = 10 - y
    checksum = x % 10
    if checksum.to_i == arr[- 1].to_i
    	
    	 true
    else
    	
    	 false
    end		
end	


 	
