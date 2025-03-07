# -*- encoding: utf-8 -*-
# stub: paper_trail 16.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "paper_trail".freeze
  s.version = "16.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/paper-trail-gem/paper_trail/blob/master/CHANGELOG.md" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andy Stewart".freeze, "Ben Atkins".freeze, "Jared Beck".freeze]
  s.date = "2024-11-08"
  s.description = "Track changes to your models, for auditing or versioning. See how a model looked\nat any stage in its lifecycle, revert it to any version, or restore it after it\nhas been destroyed.\n".freeze
  s.email = "jared@jaredbeck.com".freeze
  s.homepage = "https://github.com/paper-trail-gem/paper_trail".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Track changes to your models.".freeze

  s.installed_by_version = "3.6.2".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<activerecord>.freeze, [">= 6.1".freeze])
  s.add_runtime_dependency(%q<request_store>.freeze, ["~> 1.4".freeze])
  s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.5".freeze])
  s.add_development_dependency(%q<byebug>.freeze, ["~> 11.1".freeze])
  s.add_development_dependency(%q<ffaker>.freeze, ["~> 2.20".freeze])
  s.add_development_dependency(%q<generator_spec>.freeze, ["~> 0.9.4".freeze])
  s.add_development_dependency(%q<memory_profiler>.freeze, ["~> 1.0.0".freeze])
  s.add_development_dependency(%q<rails>.freeze, [">= 6.1".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 6.0.3".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.22.2".freeze])
  s.add_development_dependency(%q<rubocop-packaging>.freeze, ["~> 0.5.1".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.11.5".freeze])
  s.add_development_dependency(%q<rubocop-rails>.freeze, ["~> 2.12.4".freeze])
  s.add_development_dependency(%q<rubocop-rake>.freeze, ["~> 0.6.0".freeze])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 2.5.0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21.2".freeze])
  s.add_development_dependency(%q<mysql2>.freeze, ["~> 0.5.3".freeze])
  s.add_development_dependency(%q<pg>.freeze, ["~> 1.2".freeze])
  s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.4".freeze])
end
