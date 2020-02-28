
# Encrypt function
def encrypt(text, n = 0)
  return text if text == nil # checking for nil argument
  return text if text.length() == 0 or n < 1 # checking for empty string and recursion exit
  even = "" # temp array with even bites
  odd = "" #temp array with odd bites
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
  return encrypted_text if encrypted_text == nil # checking for nil argument
  return encrypted_text if encrypted_text.length() == 0 or n < 1 # checking for empty string and recursion exit
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

# To check if encryption works uncomment the code below

# encrypted_word = encrypt("abcdefghij", 3)
# puts (encrypted_word)
# decrypted_word = decrypt(encrypted_word, 3)
# puts (decrypted_word)



# Function that returns 3 the most popular words from the text
def popularWords(text)
  words = Hash.new
  text = text.downcase().split(/[\s,.!?:;&()*^#""]+/) # spliting sentences into words
  for i in 0.. text.length() - 1
    if words.include? text[i]
      words[text[i]] += 1
    else
      text[i].match(/^[a-z']/) ? words[text[i]] = 1 : next # mathing word format
    end
  end
  return words
  return Array.new if words.length() < 4 # return if there are less than 3 unique words
  sorted_words = words.sort_by{|k,v| v} # sorting hash by values
  return [sorted_words[-1][0],sorted_words[-2][0],sorted_words[-3][0]] #return last 3 sorted_words
end


# To check if function popularWords works uncomment the code below

# correctPhrase = "Dima's Iphone look's: (like Dima's \"Iphone\"); #11, and Dima do like Iphone. Another sentence!"
# incorrectPhrase = "Dima, like."
#
# print(popularWords(correctPhrase))
