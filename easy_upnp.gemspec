$:.push File.expand_path('lib', __dir__)

require 'easy_upnp/version'

Gem::Specification.new do |gem|
  gem.name    = 'easy_upnp'
  gem.version = EasyUpnp::VERSION

  gem.summary = 'A super easy to use UPnP control point client'

  gem.authors  = ['Christopher Mullins']
  gem.email    = 'chris@sidoh.org'
  gem.homepage = 'http://github.com/sidoh/easy_upnp'

  gem.add_dependency 'nokogiri', '~> 1.8'
  gem.add_dependency 'nori', '~> 2.6'
  gem.add_dependency 'rake'
  gem.add_dependency 'rubyntlm', '~> 0.3'
  gem.add_dependency 'savon', '~> 2.11'
  gem.add_dependency 'webrick'

  gem.required_ruby_version = '>= 2.1.0'

  ignores  = File.readlines('.gitignore').grep(/\S+/).map(&:chomp)
  dotfiles = %w[.gitignore]

  all_files_without_ignores = Dir['**/*'].reject do |f|
    File.directory?(f) || ignores.any? { |i| File.fnmatch(i, f) }
  end

  gem.files = (all_files_without_ignores + dotfiles).sort
  gem.executables = ['upnp-list']

  gem.require_path = 'lib'
end
