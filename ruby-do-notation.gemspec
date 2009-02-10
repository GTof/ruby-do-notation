Gem::Specification.new do |s|
  s.name = %q{ruby-do-notation}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aanand Prasad"]
  s.date = %q{2009-02-03}
  s.description = %q{Haskell-style monad do-notation for Ruby}
  s.email = %q{aanand.prasad@gmail.com}
  s.extra_rdoc_files = ["lib/do_notation/monad.rb", "lib/do_notation/monad_plus.rb", "lib/do_notation/monads/array.rb", "lib/do_notation/monads/maybe.rb", "lib/do_notation/monads/simulations.rb", "lib/do_notation/rewriter.rb", "lib/do_notation.rb", "README.markdown"]
  s.files = ["lib/do_notation/monad.rb", "lib/do_notation/monad_plus.rb", "lib/do_notation/monads/array.rb", "lib/do_notation/monads/maybe.rb", "lib/do_notation/monads/simulations.rb", "lib/do_notation/rewriter.rb", "lib/do_notation.rb", "README.markdown", "test/array.rb", "test/maybe.rb", "test/monad_plus.rb", "test/simulations.rb", "test/spec_helper.rb", "test/specs.rb", "Manifest", "ruby-do-notation.gemspec", "Rakefile"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/aanand/ruby-do-notation/tree/master}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ruby-do-notation", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ruby-do-notation}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Haskell-style monad do-notation for Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<ParseTree>, [">= 0"])
      s.add_runtime_dependency(%q<ruby2ruby>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<ParseTree>, [">= 0"])
      s.add_dependency(%q<ruby2ruby>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<ParseTree>, [">= 0"])
    s.add_dependency(%q<ruby2ruby>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
