#!/usr/bin/env ruby

# file: english_spellchecker.rb


require 'wordsdotdat'
require 'did_you_mean'


class EnglishSpellcheck
  
  @words = WordsDotDat.words

  def initialize()
    @words = WordsDotDat.words
    @spelling = DidYouMean::SpellChecker.new(dictionary: @words)
  end

  def self.spell(raww, verbose: true)
    
    w = raww.downcase
    
    return raww  if @words.include? w
    r = DidYouMean::SpellChecker.new(dictionary: @words).correct(w)
    
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
    r = @spelling.correct w
    
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
