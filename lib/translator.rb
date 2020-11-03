# require modules here
require "yaml"

def load_library(directory)
  # code goes here
  emoticons = YAML.load_file(directory)
  result = {}
  emoticons.each { |name, array|
    result[name] = {
      english: array[0],
      japanese: array[1]
    }    
  }
  result
end

def get_japanese_emoticon(directory, emote)
  # code goes here
  hash = load_library(directory)
  hash.each { |name, hash2|
    if hash[name][:english] == emote
      return hash[name][:japanese]
    end
  }
  "Sorry, that emoticon was not found"
end

def get_english_meaning(directory, emote)
  # code goes here
  hash = load_library(directory)
  hash.each { |name, hash2|
    if hash[name][:japanese] == emote
      return name
    end
  }
  "Sorry, that emoticon was not found"
end