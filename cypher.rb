def transform_text(text)
  text.downcase.chars.partition.with_index { |_, i| i.odd? }.flatten.join
end

def encrypt(text, n)
  if n <= 0 || text&.empty?
    print text
  else

    @p = transform_text(text)

    if n > 1
      ng = n - 1
      ng.times do
        r = @p.clone
        @p = transform_text(r)
      end
    end

    print @p
  end

  @p
end

def retransform_text(encrypted_text)
  half = encrypted_text.length / 2
  v = encrypted_text.chars.each_slice(half).map(&:join)
  a = v[1].chars
  b = v[0].chars
  str = []
  until a.empty?
    str.push(a[0])
    a.shift
    str.push(b[0])
    b.shift
    @p = str.join
  end
end

def decrypt(encrypted_text,n)
  if n <= 0 || encrypted_text&.empty?
    print encrypted_text
  else
    retransform_text(encrypted_text)
    if n > 1
      ng = n - 1
      ng.times do
        r = @p.clone
        retransform_text(r)
      end
    end

      print @p.capitalize!
  end
end

a = encrypt('Abcdefghij', b = 2) #"ENcrypted text:"
puts "\n\n"
decrypt(a, b) #"DEcrypted text:"