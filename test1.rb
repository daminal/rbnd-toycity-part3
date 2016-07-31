def raise_exception  
  p = -1
  puts 'I am before the raise.'  
  if p< 0
  	raise 'An error has occured'  
  end
  puts 'I am after the raise'  
end  
raise_exception 