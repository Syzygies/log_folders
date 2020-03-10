#!/usr/bin/env ruby

nbh = [
  # shift
  ["qwertyuiop", "QWERTYUIOP"],
  ["asdfghjkl", "ASDFGHJKL"],
  ["zxcvbnm", "ZXCVBNM"],

  # mirror (twice)
  ["qwertyuiop", "poiuytrewq"],
  ["asdfghjkl;", ";lkjhgfdsa"],
  ["zxcvbnm,./", "/.,mnbvcxz"],
  
  # to right
  ["qwer", "wert"],
  ["yuio", "uiop"],
  ["asdf", "sdfg"],
  ["hjkl", "jkl;"],
  ["zxcv", "xcvb"],
  ["nm,.", "m,./"],
  ["QWER", "WERT"],
  ["YUIO", "UIOP"],
  ["ASDF", "SDFG"],
  ["HJK", "JKL"],
  ["ZXCV", "XCVB"],
  ["N", "M"],
  ["`()_", "()_^"],
  ["&-=+", "-=+:"],
  ["[]", "]*"],
  ["'\"<>", "\"<>?"],
  ["12", "23"],
  ["456", "567"],
  ["89", "90"],

  # below
  ["qwertyuiop", "asdfghjkl;"],
  ["asdfghjkl;", "zxcvbnm,./"],
  ["~{}!@#$%\\|", "`()_^&-=+:"],
  ["()_&-=+:", "[]*'\"<>?"],
  ["123", "567"],
  ["567", "890"],

   # to FJ
  ["qwertyuiop", "~{}!@#$%\\|"],
  ["asdfghjkl;", "`()_^&-=+:"],
  ["xcvnm,./", "[]*'\"<>?"],

  # to DK
  ["werasdfxcv", "1234567890"]
]

WALK = {}

def set(c,d)
  if WALK[c]
    WALK[c] << d
  else
    WALK[c] = [d]
  end
end

nbh.each do |x|
  y, z = x
  yl, zl = y.length, z.length
  if yl != zl
    STDERR.puts "#{yl}!=#{zl} #{y} #{z}\n"
  end
  y.split("").zip(z.split("")).each do |c, d|
    set c, d
    set d, c
  end
end

close = { '(' => ')', '{' => '}', '[' => ']' }

chars = WALK.keys
12.times do
  4.times do
    c = chars[rand(68)]
    all = [c]
    print c
    if close[c]
      c = close[c]
      all << c
      print c
    end
    11.times do
      fow = WALK[c]
      fow = fow - all
      if fow.length == 0
        break
      end
      c = fow[rand(fow.length)]
      all << c
      print c
      if close[c]
        c = close[c]
        all << c
        print c
      end
    end
    print " "
  end
  print "\n\n\n"
end
