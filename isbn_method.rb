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








#a.gsub!(/[^0-9A-Za-z]/, '')