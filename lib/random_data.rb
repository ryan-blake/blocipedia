module RandomData

  def random_name
    # first_name = random_word.capitalize
    # last_name = random_word.capitalize
    # "#{first_name} #{last_name}"
    Faker::Name.name
  end

  def p
    "testtest"
  end

  def random_email
    Faker::Internet.email
  end

  def random_paragraph
    Faker::Hipster.paragraph
  end
  


  # #7
  def random_sentence
    Faker::Hipster.sentence
  end


  # #8
  def random_word
    Faker::Hipster.words
  end

end
