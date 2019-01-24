$:.push File.expand_path('../lib', __FILE__)

require "easy_upnp/version"

Gem::Specification.new do |gem|
  gem.name    = 'easy_upnp_with_auth'
  gem.version = EasyUpnp::VERSION

  gem.summary = "A super easy to use UPnP control point client"

  gem.authors  = ['Christopher Mullins']
  gem.email    = 'chris@sidoh.org'
  gem.homepage = 'http://github.com/sidoh/easy_upnp'
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if gem.respond_to?(:metadata)
    gem.metadata["allowed_push_host"] = "https://gems.ts-it.de"

    gem.metadata["homepage_uri"] = gem.homepage
    gem.metadata["source_code_uri"] = gem.homepage
    gem.metadata["changelog_uri"] = gem.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  gem.add_dependency 'rake'
  gem.add_dependency 'savon', '~> 2.11'
  gem.add_dependency 'nokogiri', '~> 1.8'
  gem.add_dependency 'nori', '~> 2.6'
  gem.add_dependency 'rubyntlm', '~> 0.3'

  gem.required_ruby_version = '>= 2.1.0'

  ignores  = File.readlines(".gitignore").grep(/\S+/).map(&:chomp)
  dotfiles = %w[.gitignore]

  all_files_without_ignores = Dir["**/*"].reject { |f|
    File.directory?(f) || ignores.any? { |i| File.fnmatch(i, f) }
  }

  gem.files = (all_files_without_ignores + dotfiles).sort
  gem.executables = ["upnp-list"]

  gem.require_path = "lib"
end
