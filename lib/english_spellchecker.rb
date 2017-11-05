#!/usr/bin/env ruby

# file: english_spellchecker.rb


require 'wordsdotdat'
require 'did_you_mean'


class EnglishSpellcheck

  def initialize()
    @spelling = DidYouMean::SpellChecker.new(dictionary: WordsDotDat.words)
  end

  def self.spell(w)

    r = DidYouMean::SpellChecker.new(dictionary: WordsDotDat.words).correct(w)
    r.any? ? r.first : nil

  end

  def inspect()
    "<EnglishSpellcheck::#{self.object_id} @spelling=DidYouMean::SpellChecker>"
  end

  def spell(w)
    r = @spelling.correct w
    r.any? ? r.first : nil
  end

  alias spelling spell

end

if __FILE__ == $0 then

  EnglishSpellcheck.spell ARGV.first

end
