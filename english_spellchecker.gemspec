Gem::Specification.new do |s|
  s.name = 'english_spellchecker'
  s.version = '0.3.1'
  s.summary = 'A basic English dictionary spellchecker which returns ' + 
      ' the correctly spelled word or nil if the word was not found.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/english_spellchecker.rb']
  s.add_runtime_dependency('words2dotdat', '~> 0.1', '>=0.1.1')
  s.signing_key = '../privatekeys/english_spellchecker.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/english_spellchecker'
end
