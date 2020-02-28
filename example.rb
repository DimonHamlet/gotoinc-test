
# Encrypt function
def encrypt(text, n)
  return text if text == nil
  return text if text.length() == 0
  return text if n < 1
  even = ""
  odd = ""
  for i in 0..text.length() - 1
    if i % 2 == 0
      even.concat(text[i])
    else
      odd.concat(text[i])
    end
  end
  odd.concat(even)
  encrypt(odd, n-1)
end
# Decrypt function
def decrypt(encrypted_text, n)
  return encrypted_text if encrypted_text == nil
  return encrypted_text if encrypted_text.length() == 0
  return encrypted_text if n < 1
  decrypted_word = Array.new
  i = 0
  count = 1
  while i < encrypted_text.length()
    decrypted_word[count] = encrypted_text[i]
    i += 1
    count += 2
    if count >= encrypted_text.length()
      count = 0
    end

  end
  decrypt(decrypted_word.join(''), n-1)
end

encrypted_word = encrypt("abcdefghijk", 3)
puts (encrypted_word)
decrypted_word = decrypt(encrypted_word, 3)
puts (decrypted_word)
