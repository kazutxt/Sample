#dir��tree
def dirs(path = Dir.pwd ,depth = [])
	# �J�����g�f�B���N�g���̈ړ�
	Dir.chdir(path)
	#p lastdir
	# . .. �ȊO�̂��ׂẴt�@�C������z��ɂ���
	lists = Dir.glob("./*")
	if(depth.size == 0)
		print "/--+\n"
	else 
		print File.basename(path) + "\n" 
	end
	
	# ��̗v�f���Ƃ�i�܂�./���t���Ă�)
	lists.size.times{ |i|
			# ./����菜��
			data = lists[i].slice!(2..-1)
			# �s�Ԃ̐���
			depth.each{|j|
				if j == 0 
				print("   |")
				else
				print("    ")
				end
			}
			printf("   |\n")
			# �����܂łŐ���
			
			# �t�@�C�����A�t�H���_���̍s�̍쐬
			depth.size.times{|k|
				if depth[k] == 0 
				print("   |")
				else
				print("    ")
				end
			}
			print("   ")			
			# �����܂łō쐬
			
			# +,/�����
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