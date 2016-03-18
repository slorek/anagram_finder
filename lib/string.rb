class String
  def anagram_index
    strip.downcase.chars.sort.join
  end
end
