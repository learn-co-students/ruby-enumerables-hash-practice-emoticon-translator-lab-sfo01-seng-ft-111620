# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  new_library = Hash.new
  library.each do |word, emoticons|
    new_library[word] = { english: emoticons[0], japanese: emoticons[1] }
  end
  new_library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  library.each do |word, emoticons|
    emoticons.each do |language, language_emoticon|
      if language_emoticon == emoticon
        return library[word][:japanese]
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library.each do |word, emoticons|
    emoticons.each do |language, language_emoticon|
      if language_emoticon == emoticon
        return word
      end
    end
  end
  "Sorry, that emoticon was not found"
end