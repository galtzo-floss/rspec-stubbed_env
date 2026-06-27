<a href="https://github.com/galtzo-floss"><img alt="galtzo-floss Logo by Aboling0, CC BY-SA 4.0" src="https://logos.galtzo.com/assets/images/galtzo-floss/avatar-128px.svg" width="14%" align="right"/></a>

# 🫥 RSpec::StubbedEnv

[![Version][👽versioni]][👽version] [![GitHub tag (latest SemVer)][⛳️tag-img]][⛳️tag] [![License: MIT][📄license-img]][📄license] [![Downloads Rank][👽dl-ranki]][👽dl-rank] [![CodeCov Test Coverage][🏀codecovi]][🏀codecov] [![Coveralls Test Coverage][🏀coveralls-img]][🏀coveralls] [![QLTY Test Coverage][🏀qlty-covi]][🏀qlty-cov] [![QLTY Maintainability][🏀qlty-mnti]][🏀qlty-mnt] [![CI Heads][🚎3-hd-wfi]][🚎3-hd-wf] [![CI Current][🚎11-c-wfi]][🚎11-c-wf] [![CI Truffle Ruby][🚎9-t-wfi]][🚎9-t-wf] [![CI JRuby][🚎10-j-wfi]][🚎10-j-wf] [![CI Test Coverage][🚎2-cov-wfi]][🚎2-cov-wf] [![CI Style][🚎5-st-wfi]][🚎5-st-wf]

`if ci_badges.map(&:color).detect { it != "green"}` ☝️ [let me know][✉️discord-invite], as I may have missed the [discord notification][✉️discord-invite].

---

`if ci_badges.map(&:color).all? { it == "green"}` 👇️ send money so I can do more of this. FLOSS maintenance is now my full-time job.

[![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor] [![Liberapay Goal Progress][⛳liberapay-img]][⛳liberapay] [![Donate on PayPal][🖇paypal-img]][🖇paypal] [![Buy me a coffee][🖇buyme-small-img]][🖇buyme] [![Donate at ko-fi.com][🖇kofi-img]][🖇kofi]

<details markdown="1">
 <summary>👣 How will this project approach the September 2025 hostile takeover of RubyGems? 🚑️</summary>

I've summarized my thoughts in [this blog post](https://dev.to/galtzo/hostile-takeover-of-rubygems-my-thoughts-5hlo).

</details>

## 🌻 Synopsis <a href="https://discord.gg/3qme4XHNKN"><img alt="Galtzo FLOSS Logo by Aboling0, CC BY-SA 4.0" src="https://logos.galtzo.com/assets/images/galtzo-floss/avatar-128px.svg" width="8%" align="right"/></a> <a href="https://ruby-toolbox.com"><img alt="ruby-lang Logo, Yukihiro Matsumoto, Ruby Visual Identity Team, CC BY-SA 2.5" src="https://logos.galtzo.com/assets/images/ruby-lang/avatar-128px.svg" width="8%" align="right"/></a>

An `ENV` stubbing / hiding library for sophisticated RSpec test suites.

* ENV stubbing and hiding via shared contexts for more powerful tests
  * ENV hiding via `hide_env("FOO")` was added in v1.0.2
* No need to add `dotenv` just for the spec suite

```ruby
describe "my stubbed test" do
  include_context "with stubbed env"
  include_context "with hidden env"
  context "with FOO=is bar" do
    before do
      stub_env("FOO" => "is bar")
    end
    it "has a value" do
      expect(ENV.fetch("FOO", nil)).to(eq("is bar"))
      expect(ENV.fetch("FOO")).to(eq("is bar"))
      expect(ENV["FOO"]).to(eq("is bar"))
    end
  end
  context "without BAR set" do
    before do
      hide_env("BAR")
    end
    it "is nil" do
      expect(ENV.fetch("BAR", nil)).to(be_nil)
      expect(ENV["BAR"]).to(be_nil)
    end
    it "raises error" do
      expect { ENV.fetch("BAR") }.to(raise_error(KeyNotFound))
    end
  end
end
```

This gem has no runtime dependencies.

I expect the current release of this gem to be compatible with Ruby 1.8.7+,
but it is only tested on CI against Ruby 2.3+,
due to the inherent limitations of GitHub Actions.

| 🚚 _Amazing_ test matrix was brought to you by | 🔎 appraisal2 🔎                                                                     |
|------------------------------------------------|--------------------------------------------------------------------------------------|
| 👟 Check it out!                               | ✨ [github.com/appraisal-rb/appraisal2](https://github.com/appraisal-rb/appraisal2) ✨ |

## 💡 Info you can shake a stick at

| Tokens to Remember | [![Gem name][⛳️name-img]][⛳️gem-name] [![Gem namespace][⛳️namespace-img]][⛳️gem-namespace] |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Works with JRuby | [![JRuby current Compat][💎jruby-c-i]][🚎10-j-wf] [![JRuby HEAD Compat][💎jruby-headi]][🚎3-hd-wf]|
| Works with Truffle Ruby | [![Truffle Ruby current Compat][💎truby-c-i]][🚎9-t-wf] [![Truffle Ruby HEAD Compat][💎truby-headi]][🚎3-hd-wf]|
| Works with MRI Ruby 4 | [![Ruby current Compat][💎ruby-c-i]][🚎11-c-wf] [![Ruby HEAD Compat][💎ruby-headi]][🚎3-hd-wf]|
| Works with MRI Ruby 2 | ![Ruby 2.0 Compat][💎ruby-2.0i] ![Ruby 2.1 Compat][💎ruby-2.1i] ![Ruby 2.2 Compat][💎ruby-2.2i] ![Ruby 2.3 Compat][💎ruby-2.3i]|
| Works with MRI Ruby 1 | ![Ruby 1.8 Compat][💎ruby-1.8i] ![Ruby 1.9 Compat][💎ruby-1.9i]|
| Support & Community | [![Join Me on Daily.dev's RubyFriends][✉️ruby-friends-img]][✉️ruby-friends] [![Live Chat on Discord][✉️discord-invite-img-ftb]][✉️discord-invite] [![Get help from me on Upwork][👨🏼‍🏫expsup-upwork-img]][👨🏼‍🏫expsup-upwork] [![Get help from me on Codementor][👨🏼‍🏫expsup-codementor-img]][👨🏼‍🏫expsup-codementor] |
| Source | [![Source on GitLab.com][📜src-gl-img]][📜src-gl] [![Source on CodeBerg.org][📜src-cb-img]][📜src-cb] [![Source on Github.com][📜src-gh-img]][📜src-gh] [![The best SHA: dQw4w9WgXcQ!][🧮kloc-img]][🧮kloc] |
| Documentation | [![Current release on RubyDoc.info][📜docs-cr-rd-img]][🚎yard-current] [![YARD on Galtzo.com][📜docs-head-rd-img]][🚎yard-head] [![Maintainer Blog][🚂maint-blog-img]][🚂maint-blog] [![GitLab Wiki][📜gl-wiki-img]][📜gl-wiki] [![GitHub Wiki][📜gh-wiki-img]][📜gh-wiki] |
| Compliance | [![License: MIT][📄license-img]][📄license] [![Apache license compatibility: Category A][📄license-compat-img]][📄license-compat] [![📄ilo-declaration-img]][📄ilo-declaration] [![Security Policy][🔐security-img]][🔐security] [![Contributor Covenant 2.1][🪇conduct-img]][🪇conduct] [![SemVer 2.0.0][📌semver-img]][📌semver] |
| Style | [![Enforced Code Style Linter][💎rlts-img]][💎rlts] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog] [![Gitmoji Commits][📌gitmoji-img]][📌gitmoji] [![Compatibility appraised by: appraisal2][💎appraisal2-img]][💎appraisal2] |
| Maintainer 🎖️ | [![Follow Me on LinkedIn][💖🖇linkedin-img]][💖🖇linkedin] [![Follow Me on Ruby.Social][💖🐘ruby-mast-img]][💖🐘ruby-mast] [![Follow Me on Bluesky][💖🦋bluesky-img]][💖🦋bluesky] [![Contact Maintainer][🚂maint-contact-img]][🚂maint-contact] [![My technical writing][💖💁🏼‍♂️devto-img]][💖💁🏼‍♂️devto] |
| `...` 💖 | [![Find Me on WellFound:][💖✌️wellfound-img]][💖✌️wellfound] [![Find Me on CrunchBase][💖💲crunchbase-img]][💖💲crunchbase] [![My LinkTree][💖🌳linktree-img]][💖🌳linktree] [![More About Me][💖💁🏼‍♂️aboutme-img]][💖💁🏼‍♂️aboutme] [🧊][💖🧊berg] [🐙][💖🐙hub] [🛖][💖🛖hut] [🧪][💖🧪lab] |

### Compatibility

Compatible with MRI Ruby 1.8.7+, and concordant releases of JRuby, and TruffleRuby.
CI workflows and Appraisals are generated for MRI Ruby 2.4+.
This test floor is configured by `ruby.test_minimum` in `.kettle-jem.yml` and
may be higher than the gem's runtime compatibility floor when legacy Rubies are
not practical for the current toolchain.

<a href="https://github.com/kettle-dev"><img alt="kettle-dev Logo by Aboling0, CC BY-SA 4.0" src="https://logos.galtzo.com/assets/images/kettle-dev/avatar-128px.svg" width="14%" align="right"/></a>

The _amazing_ test matrix is powered by the kettle-dev stack.

<details markdown="1">
<summary>How kettle-dev manages complexity in tests</summary>

| Gem | Source | Role | Daily download rank |
|-----|--------|------|---------------------|
| [appraisal2](https://bestgems.org/gems/appraisal2) | [GitHub](https://github.com/appraisal-rb/appraisal2) | multi-dependency Appraisal matrix generation | [![Daily download rank for appraisal2](https://img.shields.io/gem/rd/appraisal2.svg?style=flat-square)](https://bestgems.org/gems/appraisal2) |
| [appraisal2-rubocop](https://bestgems.org/gems/appraisal2-rubocop) | [GitHub](https://github.com/appraisal-rb/appraisal2-rubocop) | RuboCop Appraisal generator integration | [![Daily download rank for appraisal2-rubocop](https://img.shields.io/gem/rd/appraisal2-rubocop.svg?style=flat-square)](https://bestgems.org/gems/appraisal2-rubocop) |
| [kettle-dev](https://bestgems.org/gems/kettle-dev) | [GitHub](https://github.com/kettle-dev/kettle-dev) | development, release, and CI workflow tooling | [![Daily download rank for kettle-dev](https://img.shields.io/gem/rd/kettle-dev.svg?style=flat-square)](https://bestgems.org/gems/kettle-dev) |
| [kettle-jem](https://bestgems.org/gems/kettle-jem) | [GitHub](https://github.com/kettle-dev/kettle-jem) | Appraisals & CI workflow templates | [![Daily download rank for kettle-jem](https://img.shields.io/gem/rd/kettle-jem.svg?style=flat-square)](https://bestgems.org/gems/kettle-jem) |
| [kettle-soup-cover](https://bestgems.org/gems/kettle-soup-cover) | [GitHub](https://github.com/kettle-dev/kettle-soup-cover) | SimpleCov coverage policy and reporting | [![Daily download rank for kettle-soup-cover](https://img.shields.io/gem/rd/kettle-soup-cover.svg?style=flat-square)](https://bestgems.org/gems/kettle-soup-cover) |
| [kettle-test](https://bestgems.org/gems/kettle-test) | [GitHub](https://github.com/kettle-dev/kettle-test) | standard test runner and coverage harness | [![Daily download rank for kettle-test](https://img.shields.io/gem/rd/kettle-test.svg?style=flat-square)](https://bestgems.org/gems/kettle-test) |
| [rubocop-lts](https://bestgems.org/gems/rubocop-lts) | [GitHub](https://github.com/rubocop-lts/rubocop-lts) | Ruby-version-aware linting | [![Daily download rank for rubocop-lts](https://img.shields.io/gem/rd/rubocop-lts.svg?style=flat-square)](https://bestgems.org/gems/rubocop-lts) |
| [turbo_tests2](https://bestgems.org/gems/turbo_tests2) | [GitHub](https://github.com/galtzo-floss/turbo_tests2) | parallel test execution | [![Daily download rank for turbo_tests2](https://img.shields.io/gem/rd/turbo_tests2.svg?style=flat-square)](https://bestgems.org/gems/turbo_tests2) |

</details>

## ✨ Installation

Install the gem and add to the application's Gemfile by executing:

```console
bundle add rspec-stubbed_env
```

If bundler is not being used to manage dependencies, install the gem by executing:

```console
gem install rspec-stubbed_env
```

## ⚙️ Configuration

## 🔧 Basic Usage

You must configure RSpec to use the `:expect` syntax, or some compatible alternative.

```ruby
RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end
end
```

Require the library in your spec/test helper somewhere:
```ruby
require "rspec/stubbed_env"
```

### ENV stubbing

  - is opt-in, via a shared context, rather than global.
  - *does not* affect the real ENV at all.  It is a true stub.
  - has the same scope as a `before`, `subject`, or `let` at the same level.

See the spec suite for detailed examples.

```ruby
# This is normal, without stubbing, ENV is not set
describe "vanilla" do
  it "has no ENV stub" do
    expect(ENV.fetch("FOO", nil)).to(be_nil)
    expect(ENV["FOO"]).to(be_nil)
  end
end

# With a stubbed ENV!
describe "my stubbed test" do
  include_context "with stubbed env"
  before do
    stub_env("FOO" => "is bar")
  end
  it "has a value" do
    expect(ENV.fetch("FOO", nil)).to(eq("is bar"))
    expect(ENV["FOO"]).to(eq("is bar"))
  end
end
```

ENV can be stubbed trough the `stub_env` method, or key/value pairs to be stubbed can be
provided directly to the `include_context` call:

```ruby
describe "my stubbed test" do
  include_context "with stubbed env", "FOO" => "is bar"

  it "has a value" do
    expect(ENV.fetch("FOO", nil)).to(eq("is bar"))
    expect(ENV["FOO"]).to(eq("is bar"))
  end
end
```

By default, hash accessors such as `ENV.to_hash` and `ENV.to_h` are not stubbed.
This keeps partial ENV stubs narrow. When code under test needs a hash snapshot,
opt in with `stub_env_hash_accessors`:

```ruby
describe "my stubbed hash snapshot" do
  include_context "with stubbed env"
  include_context "with hidden env"

  before do
    stub_env_hash_accessors
    stub_env("FOO" => "is bar")
    hide_env("SECRET")
  end

  it "has a mixed real and stubbed hash" do
    expect(ENV.to_hash).to(include("FOO" => "is bar"))
    expect(ENV.to_hash).not_to(have_key("SECRET"))
  end
end
```

The helper is separate from `stub_env` arguments so real environment keys such
as `"to_hash"` remain ordinary stubbable keys.

If you want to make `stub_env` method available globally (without the `include_context` call),
you can add in the `spec_helper`.

I do not recommend the _global_ approach, as it results in a loss of clarity
on which tests are testing ENV-based behaviors.  Here's a foot-gun if you want it.

```ruby
RSpec.configure do |config|
  config.include(RSpec::StubbedEnv::StubHelpers)
  # Or you could include the context globally
  # config.include_context "with stubbed env"
end
```

### ENV hiding

- is opt-in, via a shared context, rather than global.
- *does not* affect the real ENV at all.  It is a true stub.
- has the same scope as a `before`, `subject`, or `let` at the same level.

See the spec suite for detailed examples.

```ruby
# This is normal, without hiding, ENV is set
ENV["MY_PATH"] = "/home/doodle"
describe "vanilla" do
  it "has ENV with nothing hidden" do
    expect(ENV.fetch("MY_PATH", nil)).to("/home/doodle")
    expect(ENV["MY_PATH"]).to("/home/doodle")
  end
end

# With a hidden ENV variable!
describe "my hidden test" do
  include_context "with hidden env"
  before do
    hide_env("MY_PATH")
  end
  it "MY_PATH is not set" do
    expect(ENV.fetch("MY_PATH", nil)).to(be_nil)
    expect(ENV["MY_PATH"]).to(be_nil)
  end
end
```

ENV variables can be hidden trough the `hide_env` method, or variable names to be hidden can be
provided directly to the `include_context` call:

```ruby
describe "my hidden test" do
  include_context "with hidden env", "MY_PATH"

  it "MY_PATH is not set" do
    expect(ENV.fetch("MY_PATH", nil)).to(be_nil)
    expect(ENV["MY_PATH"]).to(be_nil)
  end
end
```

If you want to make `hide_env` method available globally (without the `include_context` call),
you can add in the `spec_helper`:

I do not recommend the _global_ approach, as it results in a loss of clarity
on which tests are testing ENV-based behaviors.  Here's a foot-gun if you want it.

```ruby
RSpec.configure do |config|
  config.include(RSpec::StubbedEnv::HideHelpers)
  # Or you could include the context globally
  # config.include_context "with hidden env"
end
```

## 🔐 Security

See [SECURITY.md][🔐security].

## 🤝 Contributing

If you need some ideas of where to help, you could work on adding more code coverage,
or if it is already 💯 (see [below](#code-coverage)) check [issues][🤝gh-issues] or [PRs][🤝gh-pulls],
or use the gem and think about how it could be better.

We [![Keep A Changelog][📗keep-changelog-img]][📗keep-changelog] so if you make changes, remember to update it.

See [CONTRIBUTING.md][🤝contributing] for more detailed instructions.

## 📌 Versioning

This library follows [![Semantic Versioning 2.0.0][📌semver-img]][📌semver] for its public API where practical.
For most applications, prefer the [Pessimistic Version Constraint][📌pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency("rspec-stubbed_env", "~> 1.0")
```

<details markdown="1">
<summary>📌 Is "Platform Support" part of the public API? More details inside.</summary>

Dropping support for a platform can be a breaking change for affected users.
If a release changes supported platforms, it should be called out clearly in the changelog and versioned with that impact in mind.

To get a better understanding of how SemVer is intended to work over a project's lifetime,
read this article from the creator of SemVer:

- ["Major Version Numbers are Not Sacred"][📌major-versions-not-sacred]

</details>

See [CHANGELOG.md][📌changelog] for a list of releases.

## 📄 License

The gem is available as open source under the terms of
the [MIT](MIT.md) [![License: MIT][📄license-img]][📄license-ref].

[gh-discussions]: https://github.com/galtzo-floss/rspec-stubbed_env/discussions
[⛳liberapay-img]: https://img.shields.io/liberapay/goal/pboling.svg?logo=liberapay&color=a51611&style=flat
[⛳liberapay-bottom-img]: https://img.shields.io/liberapay/goal/pboling.svg?style=for-the-badge&logo=liberapay&color=a51611
[⛳liberapay]: https://liberapay.com/pboling/donate
[🖇sponsor-img]: https://img.shields.io/badge/Sponsor_Me!-pboling.svg?style=social&logo=github
[🖇sponsor-bottom-img]: https://img.shields.io/badge/Sponsor_Me!-pboling-blue?style=for-the-badge&logo=github
[🖇sponsor]: https://github.com/sponsors/pboling
[🖇kofi-img]: https://img.shields.io/badge/ko--fi-%E2%9C%93-a51611.svg?style=flat
[🖇kofi]: https://ko-fi.com/pboling
[🖇buyme-small-img]: https://img.shields.io/badge/buy_me_a_coffee-%E2%9C%93-a51611.svg?style=flat
[🖇buyme-img]: https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20latte&emoji=&slug=pboling&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff
[🖇buyme]: https://www.buymeacoffee.com/pboling
[🖇paypal-img]: https://img.shields.io/badge/donate-paypal-a51611.svg?style=flat&logo=paypal
[🖇paypal-bottom-img]: https://img.shields.io/badge/donate-paypal-a51611.svg?style=for-the-badge&logo=paypal&color=0A0A0A
[🖇paypal]: https://www.paypal.com/paypalme/peterboling
[🖇floss-funding.dev]: https://floss-funding.dev
[🖇floss-funding-gem]: https://github.com/galtzo-floss/floss_funding
[✉️discord-invite]: https://discord.gg/3qme4XHNKN
[✉️discord-invite-img-ftb]: https://img.shields.io/discord/1373797679469170758?style=for-the-badge&logo=discord
[✉️ruby-friends-img]: https://img.shields.io/badge/daily.dev-%F0%9F%92%8E_Ruby_Friends-0A0A0A?style=for-the-badge&logo=dailydotdev&logoColor=white
[✉️ruby-friends]: https://app.daily.dev/squads/rubyfriends
[✇bundle-group-pattern]: https://gist.github.com/pboling/4564780
[⛳️gem-namespace]: https://github.com/galtzo-floss/rspec-stubbed_env
[⛳️namespace-img]: https://img.shields.io/badge/namespace-RSpec::StubbedEnv-3C2D2D.svg?style=square&logo=ruby&logoColor=white
[⛳️gem-name]: https://bestgems.org/gems/rspec-stubbed_env
[⛳️name-img]: https://img.shields.io/badge/name-rspec--stubbed__env-3C2D2D.svg?style=square&logo=rubygems&logoColor=red
[⛳️tag-img]: https://img.shields.io/github/tag/galtzo-floss/rspec-stubbed_env.svg
[⛳️tag]: https://github.com/galtzo-floss/rspec-stubbed_env/releases
[🚂maint-blog]: http://www.railsbling.com/tags/rspec-stubbed_env
[🚂maint-blog-img]: https://img.shields.io/badge/blog-railsbling-0093D0.svg?style=for-the-badge&logo=rubyonrails&logoColor=orange
[🚂maint-contact]: http://www.railsbling.com/contact
[🚂maint-contact-img]: https://img.shields.io/badge/Contact-Maintainer-0093D0.svg?style=flat&logo=rubyonrails&logoColor=red
[💖🖇linkedin]: http://www.linkedin.com/in/peterboling
[💖🖇linkedin-img]: https://img.shields.io/badge/LinkedIn-Profile-0B66C2?style=flat&logo=newjapanprowrestling
[💖✌️wellfound]: https://wellfound.com/u/peter-boling
[💖✌️wellfound-img]: https://img.shields.io/badge/peter--boling-orange?style=flat&logo=wellfound
[💖💲crunchbase]: https://www.crunchbase.com/person/peter-boling
[💖💲crunchbase-img]: https://img.shields.io/badge/peter--boling-purple?style=flat&logo=crunchbase
[💖🐘ruby-mast]: https://ruby.social/@galtzo
[💖🐘ruby-mast-img]: https://img.shields.io/mastodon/follow/109447111526622197?domain=https://ruby.social&style=flat&logo=mastodon&label=Ruby%20@galtzo
[💖🦋bluesky]: https://bsky.app/profile/galtzo.com
[💖🦋bluesky-img]: https://img.shields.io/badge/@galtzo.com-0285FF?style=flat&logo=bluesky&logoColor=white
[💖🌳linktree]: https://linktr.ee/galtzo
[💖🌳linktree-img]: https://img.shields.io/badge/galtzo-purple?style=flat&logo=linktree
[💖💁🏼‍♂️devto]: https://dev.to/galtzo
[💖💁🏼‍♂️devto-img]: https://img.shields.io/badge/dev.to-0A0A0A?style=flat&logo=devdotto&logoColor=white
[💖💁🏼‍♂️aboutme]: https://about.me/peter.boling
[💖💁🏼‍♂️aboutme-img]: https://img.shields.io/badge/about.me-0A0A0A?style=flat&logo=aboutme&logoColor=white
[💖🧊berg]: https://codeberg.org/pboling
[💖🐙hub]: https://github.org/pboling
[💖🛖hut]: https://sr.ht/~galtzo/
[💖🧪lab]: https://gitlab.com/pboling
[👨🏼‍🏫expsup-upwork]: https://www.upwork.com/freelancers/~014942e9b056abdf86?mp_source=share
[👨🏼‍🏫expsup-upwork-img]: https://img.shields.io/badge/UpWork-13544E?style=for-the-badge&logo=Upwork&logoColor=white
[👨🏼‍🏫expsup-codementor]: https://www.codementor.io/peterboling?utm_source=github&utm_medium=button&utm_term=peterboling&utm_campaign=github
[👨🏼‍🏫expsup-codementor-img]: https://img.shields.io/badge/CodeMentor-Get_Help-1abc9c?style=for-the-badge&logo=CodeMentor&logoColor=white
[🏙️entsup-tidelift]: https://tidelift.com/subscription/pkg/rubygems-rspec-stubbed_env?utm_source=rubygems-rspec-stubbed_env&utm_medium=referral&utm_campaign=readme
[🏙️entsup-tidelift-img]: https://img.shields.io/badge/Tidelift_and_Sonar-Enterprise_Support-FD3456?style=for-the-badge&logo=sonar&logoColor=white
[🏙️entsup-tidelift-sonar]: https://blog.tidelift.com/tidelift-joins-sonar
[💁🏼‍♂️peterboling]: http://www.peterboling.com
[🚂railsbling]: http://www.railsbling.com
[📜src-gl-img]: https://img.shields.io/badge/GitLab-FBA326?style=for-the-badge&logo=Gitlab&logoColor=orange
[📜src-gl]: https://gitlab.com/galtzo-floss/rspec-stubbed_env
[📜src-cb-img]: https://img.shields.io/badge/CodeBerg-4893CC?style=for-the-badge&logo=CodeBerg&logoColor=blue
[📜src-cb]: https://codeberg.org/galtzo-floss/rspec-stubbed_env
[📜src-gh-img]: https://img.shields.io/badge/GitHub-238636?style=for-the-badge&logo=Github&logoColor=green
[📜src-gh]: https://github.com/galtzo-floss/rspec-stubbed_env
[📜docs-cr-rd-img]: https://img.shields.io/badge/RubyDoc-Current_Release-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜docs-head-rd-img]: https://img.shields.io/badge/YARD_on_Galtzo.com-HEAD-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜gl-wiki]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/wikis/home
[📜gh-wiki]: https://github.com/galtzo-floss/rspec-stubbed_env/wiki
[📜gl-wiki-img]: https://img.shields.io/badge/wiki-gitlab-943CD2.svg?style=for-the-badge&logo=gitlab&logoColor=white
[📜gh-wiki-img]: https://img.shields.io/badge/wiki-github-943CD2.svg?style=for-the-badge&logo=github&logoColor=white
[👽dl-rank]: https://bestgems.org/gems/rspec-stubbed_env
[👽dl-ranki]: https://img.shields.io/gem/rd/rspec-stubbed_env.svg
[👽version]: https://bestgems.org/gems/rspec-stubbed_env
[👽versioni]: https://img.shields.io/gem/v/rspec-stubbed_env.svg
[🏀qlty-mnt]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env
[🏀qlty-mnti]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env/maintainability.svg
[🏀qlty-cov]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env/metrics/code?sort=coverageRating
[🏀qlty-covi]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env/coverage.svg
[🏀codecov]: https://codecov.io/gh/galtzo-floss/rspec-stubbed_env
[🏀codecovi]: https://codecov.io/gh/galtzo-floss/rspec-stubbed_env/graph/badge.svg
[🏀coveralls]: https://coveralls.io/github/galtzo-floss/rspec-stubbed_env?branch=main
[🏀coveralls-img]: https://coveralls.io/repos/github/galtzo-floss/rspec-stubbed_env/badge.svg?branch=main
[🚎2-cov-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/coverage.yml
[🚎2-cov-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/coverage.yml/badge.svg
[🚎3-hd-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/heads.yml
[🚎3-hd-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/heads.yml/badge.svg
[🚎5-st-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/style.yml
[🚎5-st-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/style.yml/badge.svg
[🚎9-t-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/truffle.yml
[🚎9-t-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/truffle.yml/badge.svg
[🚎10-j-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/jruby.yml
[🚎10-j-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/jruby.yml/badge.svg
[🚎11-c-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/current.yml
[🚎11-c-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/current.yml/badge.svg
[💎ruby-1.8i]: https://img.shields.io/badge/Ruby-1.8_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-1.9i]: https://img.shields.io/badge/Ruby-1.9_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.0i]: https://img.shields.io/badge/Ruby-2.0_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.1i]: https://img.shields.io/badge/Ruby-2.1_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.2i]: https://img.shields.io/badge/Ruby-2.2_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.3i]: https://img.shields.io/badge/Ruby-2.3_(%F0%9F%9A%ABCI)-AABBCC?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-c-i]: https://img.shields.io/badge/Ruby-current-CC342D?style=for-the-badge&logo=ruby&logoColor=green
[💎ruby-headi]: https://img.shields.io/badge/Ruby-HEAD-CC342D?style=for-the-badge&logo=ruby&logoColor=blue
[💎truby-c-i]: https://img.shields.io/badge/Truffle_Ruby-current-34BCB1?style=for-the-badge&logo=ruby&logoColor=green
[💎truby-headi]: https://img.shields.io/badge/Truffle_Ruby-HEAD-34BCB1?style=for-the-badge&logo=ruby&logoColor=blue
[💎jruby-c-i]: https://img.shields.io/badge/JRuby-current-FBE742?style=for-the-badge&logo=ruby&logoColor=green
[💎jruby-headi]: https://img.shields.io/badge/JRuby-HEAD-FBE742?style=for-the-badge&logo=ruby&logoColor=blue
[🤝gh-issues]: https://github.com/galtzo-floss/rspec-stubbed_env/issues
[🤝gh-pulls]: https://github.com/galtzo-floss/rspec-stubbed_env/pulls
[🤝gl-issues]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/issues
[🤝gl-pulls]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/merge_requests
[🤝cb-issues]: https://codeberg.org/galtzo-floss/rspec-stubbed_env/issues
[🤝cb-pulls]: https://codeberg.org/galtzo-floss/rspec-stubbed_env/pulls
[🤝cb-donate]: https://donate.codeberg.org/
[🤝contributing]: https://github.com/galtzo-floss/rspec-stubbed_env/blob/main/CONTRIBUTING.md
[🏀codecov-g]: https://codecov.io/gh/galtzo-floss/rspec-stubbed_env/graph/badge.svg
[🖐contrib-rocks]: https://contrib.rocks
[🖐contributors]: https://github.com/galtzo-floss/rspec-stubbed_env/graphs/contributors
[🖐contributors-img]: https://contrib.rocks/image?repo=galtzo-floss/rspec-stubbed_env
[🪇conduct]: https://github.com/galtzo-floss/rspec-stubbed_env/blob/main/CODE_OF_CONDUCT.md
[🪇conduct-img]: https://img.shields.io/badge/Contributor_Covenant-2.1-259D6C.svg
[📌pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-259D6C.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📌changelog]: https://github.com/galtzo-floss/rspec-stubbed_env/blob/main/CHANGELOG.md
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-34495e.svg?style=flat
[📌gitmoji]: https://gitmoji.dev
[📌gitmoji-img]: https://img.shields.io/badge/gitmoji_commits-%20%F0%9F%98%9C%20%F0%9F%98%8D-34495e.svg?style=flat-square
[🧮kloc]: https://www.youtube.com/watch?v=dQw4w9WgXcQ
[🧮kloc-img]: https://img.shields.io/badge/KLOC-0.094-FFDD67.svg?style=for-the-badge&logo=YouTube&logoColor=blue
[🔐security]: https://github.com/galtzo-floss/rspec-stubbed_env/blob/main/SECURITY.md
[🔐security-img]: https://img.shields.io/badge/security-policy-259D6C.svg?style=flat
[📄copyright-notice-explainer]: https://opensource.stackexchange.com/questions/5778/why-do-licenses-such-as-the-mit-license-specify-a-single-year
[📄license]: LICENSE.md
[📄license-ref]: MIT.md
[📄license-img]: https://img.shields.io/badge/License-MIT-259D6C.svg
[📄license-compat]: https://www.apache.org/legal/resolved.html#category-a
[📄license-compat-img]: https://img.shields.io/badge/Apache_Compatible:_Category_A-%E2%9C%93-259D6C.svg?style=flat&logo=Apache
[📄ilo-declaration]: https://www.ilo.org/declaration/lang--en/index.htm
[📄ilo-declaration-img]: https://img.shields.io/badge/ILO_Fundamental_Principles-✓-259D6C.svg?style=flat
[🚎yard-current]: http://rubydoc.info/gems/rspec-stubbed_env
[🚎yard-head]: https://rspec-stubbed-env.galtzo.com
[💎stone_checksums]: https://github.com/galtzo-floss/stone_checksums
[💎SHA_checksums]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tree/main/checksums
[💎rlts]: https://github.com/rubocop-lts/rubocop-lts
[💎rlts-img]: https://img.shields.io/badge/code_style_&_linting-rubocop--lts-34495e.svg?plastic&logo=ruby&logoColor=white
[💎appraisal2]: https://github.com/appraisal-rb/appraisal2
[💎appraisal2-img]: https://img.shields.io/badge/appraised_by-appraisal2-34495e.svg?plastic&logo=ruby&logoColor=white
[💎d-in-dvcs]: https://railsbling.com/posts/dvcs/put_the_d_in_dvcs/
