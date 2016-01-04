# file‚ÌƒRƒs[
def copy(from,to)
  
  begin
    src = open(from)
    dst = open(to,"w")
    data = src.read
    dst.write(data)
    dst.close
    print "ok\n"

  rescue
    print "ng\n"

  ensure
    begin
      src.close
    rescue  
    ensure
    end
    print "ensure\n"
  end
end

copy("copy.rb","copy2.rb")
copy("ruby.rb","ruby2.rb")
