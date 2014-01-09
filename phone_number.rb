class CreateWord
  def initialize(phone_number)
    @words = {}
    @phone_number = phone_number
    @number_hash = {"0" => [],"1" => [],"2" => ["a","b","c"],"3" => ["d","e","f"], "4" => ["g","h","i"],"5" => ["j","k","l"],"6" => ["m","n","o"],"7" => ["p","q","r","s"],"8" => ["t","u","v"],"9" => ["w","x","y","z"]}
    @three_digits = phone_number[6..8]
    @three_digits_array = @three_digits.split("")
    @four_digits = phone_number[10..13]
    @four_digits_array = @four_digits.split("")
    @last_seven_digits = phone_number[6..8] + phone_number[10..13]
    @last_seven_digits_array = @last_seven_digits.split("")
    File.open("/usr/share/dict/words") do |file|
      file.each do |line|
        @words[line.strip] = true
      end
    end
  end
  def words
    @words
  end

  def three_letter_word
    three_letter_word_array = []
    first_array = @number_hash[@three_digits_array[0]]
    second_array = @number_hash[@three_digits_array[1]]
    third_array = @number_hash[@three_digits_array[2]]
    first_array.each do |char1|
      second_array.each do |char2|
        third_array.each do |char3|
          test_string = char1 + char2 + char3
          if @words[test_string]
            three_letter_word_array << char1 + char2 + char3
          end
        end
      end
    end
    return three_letter_word_array
  end

  def four_letter_word
    four_letter_word_array = []
    first_array = @number_hash[@four_digits_array[0]]
    second_array = @number_hash[@four_digits_array[1]]
    third_array = @number_hash[@four_digits_array[2]]
    fourth_array = @number_hash[@four_digits_array[3]]
    first_array.each do |char1|
      second_array.each do |char2|
        third_array.each do |char3|
          fourth_array.each do |char4|
            test_string = char1 + char2 + char3 + char4
            if @words[test_string]
              four_letter_word_array << char1 + char2 + char3 + char4
            end
          end
        end
      end
    end
    return four_letter_word_array
  end

  def seven_letter_word
    four_letter_word_array = []
    first_array = @number_hash[@three_digits_array[0]]
    second_array = @number_hash[@three_digits_array[1]]
    third_array = @number_hash[@three_digits_array[2]]
    fourth_array = @number_hash[@four_digits_array[0]]
    fifth_array = @number_hash[@four_digits_array[1]]
    sixth_array = @number_hash[@four_digits_array[2]]
    first_array.each do |char1|
      second_array.each do |char2|
        third_array.each do |char3|
          fourth_array.each do |char4|
            test_string = char1 + char2 + char3 + char4
            if @words[test_string]
              four_letter_word_array << char1 + char2 + char3 + char4
            end
          end
        end
      end
    end
    return four_letter_word_array
  end

  def possible_combinations
    puts "Some combinations"
    three_letter_word.each do |three_word|
      four_letter_word.each do |four_word|
        if three_word.length > 0 and four_word.length > 0
          puts "1-800-" + three_word + "-" + four_word
        end
      end
    end
  end  
end

test = CreateWord.new("1-800-873-7829")

test.possible_combinations