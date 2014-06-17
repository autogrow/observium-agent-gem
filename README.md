# Observium::Agent

This gem provides a way to get data from an Observium or Check_MK agent using ruby.  
It polls the information, and parses the output allowing you to use the information
wherever you need it.

## Installation

Add this line to your application's Gemfile:

    gem 'observium-agent'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install observium-agent

## Usage

Here's how to use the gem in your code, it's pretty simple:

```ruby
output = Observium::Agent::Poller.new("host.example.com").poll
parser = Observium::Agent::Parser.new(output)

parser.has_section? "dmi" # we will be using :symbols soon
dmi = parser.section "dmi"

puts dmi[:processor_version] # outputs Genuine Intel(R) CPU N270 @ 1.60GHz
```

## Future plans

We want to make it so you can keep your agent ports closed but still access the agent securely.  We hope to do this through the use of an optional SSH proxy.

## Contributing

1. Fork it ( http://github.com/AutogrowSystems/observium-agent/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
