#!/usr/bin/env ruby

# file: english_spellchecker.rb


require 'words2dotdat'
require 'did_you_mean'


class EnglishSpellcheck
  
  @words = Words2DotDat.words

  def initialize(debug: false)
    
    @debug = debug
    @words = Words2DotDat.words
    @spelling = ('a'..'z').map do |c|
      DidYouMean::SpellChecker.new(dictionary: @words.select {|x| x[0] == c})
    end
    
  end

  def self.spell(raww, verbose: true)
    
    w = raww.downcase
    
    return raww  if @words.include? w
    list = @words.select {|x| x[0] == w[0]}
    r = DidYouMean::SpellChecker.new(dictionary: list).correct(w)
    
    if r.any? then
      
      found = r.first
      puts 'found: ' + found.inspect if verbose
      
      # return the word found along with the ending of the keyword which 
      # wasn't found.
      #
      if raww.length > found.length then
        if found == w[0..found.length-1] then
          return [found, raww[found.length..-1]]
        else
          return found
        end
      else
        if w == found[0..raww.length-1] then
          return [raww, found[raww.length..-1]]
        else
          return found
        end
      end
      
    else
      nil
    end

  end

  def inspect()
    "#<EnglishSpellcheck:#{self.object_id} @spelling=DidYouMean::SpellChecker>"
  end

  def spell(raww, verbose: true)
    
    w = raww.downcase
    
    return raww  if @words.include? w
    c = w[0].ord - 97
    puts 'c: ' + c.inspect if @debug
    r = @spelling[c].correct w
    
    if r.any? then
      
      found = r.first
      puts 'found: ' + found.inspect if verbose

      # return the word found along with the ending of the keyword which 
      # wasn't found.
      #
      if raww.length > found.length then
        if found == w[0..found.length-1] then
          return [found, raww[found.length..-1]]
        else
          return found
        end
      else
        if w == found[0..raww.length-1] then
          return [raww, found[raww.length..-1]]
        else
          return found
        end
      end
      
    else
      nil
    end
    
  end

  alias spelling spell

end

if __FILE__ == $0 then

  EnglishSpellcheck.spell ARGV.first

end
