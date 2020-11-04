# require modules here
require "yaml"
require "pry"

def load_library(file)
  new_hash = {}
  new_file = YAML.load_file(file)
  new_file.each do |k1, v1|
    new_hash[k1] = {
      english: v1[0],
      japanese: v1[1]
    }
  end
  new_hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  hash.each do |k1, v1|
    if v1.values[0] == emoticon
      return v1.values[1]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  hash.each do |k1, v1|
    if v1.values[1] == emoticon
      return k1
    end
  end
  return "Sorry, that emoticon was not found"
end

