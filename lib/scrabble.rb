class Scrabble

  def score(word)
    if word.class == Integer || !!(word =~ /\A[-+]?[0-9]+\z/)
      "Invalid Response"
    elsif word == ''
      0
    else
      word.each_char.map { |char| point_values[char.upcase] }.reduce(&:+)
    end
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score_with_multipliers(word, multipliers, additional_multi = 1)
    result = word.each_char.with_index.map do |char, index|
      (point_values[char.upcase] * multipliers[index])
    end.reduce(&:+)
    word.length > 6 ? (result + 10) * additional_multi : result * additional_multi
  end

end
