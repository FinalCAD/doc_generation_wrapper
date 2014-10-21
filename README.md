# DocGenerationWrapper [![Build Status](https://travis-ci.org/FinalCAD/doc_generation_wrapper.svg)](https://travis-ci.org/FinalCAD/doc_generation_wrapper)

DocGenerationWrapper is a library permit to abstract call for document generation, when you use DocRaptor for generate docuementation from HTML to PDF or XLS, but you want make generation faster on local machine, don't call DocRaptor service every time you develop, this library permit to switch on local generation and keep DocRaptor behavior on production.

This library is simple adapter pattern for switching on local generation document service, you can install and run the service https://github.com/FinalCAD/doc_generation_service for locale use.

## Installation

Add this line to your application's Gemfile:

    gem 'doc_generation_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doc_generation_wrapper

## Usage

## Rails

You can add file on app/config/initializers/doc_generation_wrapper.rb

locale use with PrinceXML Service

```
  DocGenerationWrapper.configure do |config|
    config.adapter      = :prince_xml
    config.service_host = 'http://0.0.0.0:5000'
  end
```

Production use with DocRaptor

```
  DocGenerationWrapper.configure do |config|
    config.adapter = :doc_raptor
  end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/doc_generation_wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
