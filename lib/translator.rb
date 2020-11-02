# require modules here
require "yaml"
require "pry"

def load_library(file)
  emos = YAML.load_file(file)
  emoticons = {}
  
  emos.each do |name, symbols|
    emoticons[name] = {english: symbols[0], japanese: symbols[1]}
  end 
  emoticons
end

def get_japanese_emoticon(file, emo)
  emos = load_library(file)
  emos.each do |name, languages|
    if languages[:english] == emo 
      return languages[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emo)
  emos = load_library(file)
  emos.each do |name, languages|
    if languages[:japanese] == emo
      return name
    end
  end
  "Sorry, that emoticon was not found"
end