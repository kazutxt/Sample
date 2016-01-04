# -*- coding: utf-8 -*-
# フォーマットを仮定しているのでよくない
# ホントはPIDに相当するぶぶんとかをきちんときりだすべき
# psのフォーマットの必要な部分と取り出す

work = `ps alx`
worklist = work.split(/\n/)
pid = []
ppid = []
command = []
j = 0
work.each{|e|
  i = 0
  f = e.split(/\s/)
  #p j
  command[j] = ""

  if j != 0 then # 最初の1行は、PIDやPPIDといった文字なので、飛ばす
  f.each{|g|
    if g.empty? == false then
      i = i+1
      if i==3 then # PIDに相当
        pid[j] = g
        #p g
       end
      if i==4 then # PPIDに相当
        ppid[j] = g
        #p g
      end
      if i>=13 then # commandに相当
        #p j
        #p g
        #p command[j]
        command[j].concat(g)
        command[j].concat(" ")
        #p command[j]
      end
    end
    }

  end
  j = j+1
}

i = 1
while i < j

  print("pid = #{pid[i]},ppid = #{ppid[i]},command = #{command[i]}\n")
  i+=1
end
