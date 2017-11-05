# Introducing the english_spellchecker gem


## Usage

    require 'english_spellchecker'

    EnglishSpellcheck.spell 'Supersticious'
    #=> "superstitious"

    # or ...

    check = EnglishSpellcheck.new

    check.spelling 'supersticious'
    #=> "superstitious"

    check.spelling 'fudmix'
    #=> nil

    EnglishSpellcheck.spell 'phisicist'
    #=> "physicist" 

## Resources

* english_spellchecker https://rubygems.org/gems/english_spellchecker

spell spellchecker reference words spelling
