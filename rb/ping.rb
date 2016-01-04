def allping
	respons = Array.new(126)
	threads = []
	respons.size.times{|i|
		threads[i] = Thread.start(i) {|t| respons[t] =  `ping -t 2 -c 1 XXX.XXX.XXX.#{t+1}`} }

	threads.each{|t|
		t.join
	}
	respons.size.times{|i|
		#p "XXX.XXX.XXX."+(i+1).to_s
		#host = Resolv.getname("XXX.XXX.XXX." + (i+1).to_s)
	     if /100[.]*[0]*%/ =~ respons[i]
	     	print("XXX.XXX.XXX.",i+1," NG\n")
	     elsif /0[.]*[0]*%/ =~ respons[i]
	     	print("XXX.XXX.XXX.",i+1," OK\n")
	     else 
		print("XXX.XXX.XXX.",i+1," ERROR\n")
	     end
	}
end

allping
