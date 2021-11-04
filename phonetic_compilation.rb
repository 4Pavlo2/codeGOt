def com(str)
  words = str.downcase.split(/\W+/)
  freq = words.tally
  arr=[]
  3.times do
    if freq.values.max >= 2
      arr << freq.key(freq.values.max)
      freq.delete(freq.key(freq.values.max))
    end
  end

  if arr.count == 3
    print "3 most meted words in text:#{arr}"
  else

    print []
  end
end

s = "oriented design, decomposition,^ : ,encapsulation, testing. and Uses testing. Uses,  testing. Uses and testing. Uses mf Uses".downcase
#s = File.read("hw.txt")

com(s)