require 'simplecov'
# require 'byebug'

SimpleCov.profiles.define 'gem' do
  add_filter '/spec/'
  add_filter '/autotest/'
  add_group 'Libraries', '/lib/'
end
SimpleCov.start 'gem'

require 'reverse_asciidoctor'

RSpec.configure do |config|
  config.after(:each) do
    ReverseAsciidoctor.instance_variable_set(:@config, nil)
  end
end

def node_for(html)
  Nokogiri::HTML.parse(html).root.child.child
end
