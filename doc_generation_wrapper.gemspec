require_relative 'lib/doc_generation_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = 'doc_generation_wrapper'
  spec.version       = DocGenerationWrapper::VERSION
  spec.authors       = ['Joel AZEMAR']
  spec.email         = ['joel.azemar@gmail.com']
  spec.summary       = %q{Wrapper for DocRaptor or Local PrinceXML generation}
  spec.description   = %q{Wrapper for DocRaptor or Local PrinceXML generation of document, purpose is help to develop quickly}
  spec.homepage      = 'https://github.com/FinalCAD/doc_generation_wrapper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rspec', '~> 2.99'

  spec.add_dependency 'rest-client', '~> 2.0.2'
  spec.add_dependency 'docraptor', '~> 0.2'
  spec.add_dependency 'json', '~> 1.8'
end
