#dirのtree
def dirs(path = Dir.pwd ,depth = [])
	# カレントディレクトリの移動
	Dir.chdir(path)
	#p lastdir
	# . .. 以外のすべてのファイル名を配列にする
	lists = Dir.glob("./*")
	if(depth.size == 0)
		print "/--+\n"
	else 
		print File.basename(path) + "\n" 
	end
	
	# 一つの要素をとる（まだ./が付いてる)
	lists.size.times{ |i|
			# ./を取り除く
			data = lists[i].slice!(2..-1)
			# 行間の生成
			depth.each{|j|
				if j == 0 
				print("   |")
				else
				print("    ")
				end
			}
			printf("   |\n")
			# ここまでで生成
			
			# ファイル名、フォルダ名の行の作成
			depth.size.times{|k|
				if depth[k] == 0 
				print("   |")
				else
				print("    ")
				end
			}
			print("   ")			
			# ここまでで作成
			
			# +,/を作る
			if i == (lists.size - 1)
				print("/")
			else
				print("+")
			end			
			printf("---")
			
			if File.ftype("./#{data}") == "directory"
				if i == lists.size-1
					dirs(path+"/"+data,depth << 1)
				else
					dirs(path+"/"+data,depth << 0)
				end
				Dir.chdir(path)
			else
				print data + "\n"
			end
	}
	depth.pop
end