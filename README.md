[![Galtzo FLOSS Logo by Aboling0, CC BY-SA 4.0][🖼️galtzo-i]][🖼️galtzo-discord] [![rspec Logo by Ninefold, a Macquarie Telecom company, CC BY-NC-SA 4.0][🖼️rspec-i]][🖼️rspec] [![ruby-lang Logo, Yukihiro Matsumoto, Ruby Visual Identity Team, CC BY-SA 2.5][🖼️ruby-lang-i]][🖼️ruby-lang] [![rspec-stubbed_env Logo by Aboling0, CC BY-SA 4.0][🖼️rspec-stubbed_env-i]][🖼️rspec-stubbed_env]

[🖼️galtzo-i]: https://logos.galtzo.com/assets/images/galtzo-floss/avatar-192px.svg
[🖼️galtzo-discord]: https://discord.gg/3qme4XHNKN
[🖼️rspec-i]: https://logos.galtzo.com/assets/images/rspec/avatar-192px.svg
[🖼️rspec]: https://github.com/rspec
[🖼️ruby-lang-i]: https://logos.galtzo.com/assets/images/ruby-lang/avatar-192px.svg
[🖼️ruby-lang]: https://www.ruby-lang.org/
[🖼️rspec-stubbed_env-i]: https://logos.galtzo.com/assets/images/galtzo-floss/rspec-stubbed_env/avatar-192px.svg
[🖼️rspec-stubbed_env]: https://github.com/galtzo-floss/rspec-stubbed_env

# 🫥 RSpec::StubbedEnv

[![Version][👽versioni]][👽version] [![License: MIT][📄license-img]][📄license-ref] [![Downloads Rank][👽dl-ranki]][👽dl-rank] [![Open Source Helpers][👽oss-helpi]][👽oss-help] [![Coveralls Test Coverage][🔑coveralls-img]][🔑coveralls] [![CodeCov Test Coverage][🔑codecovi♻️]][🔑codecov] [![QLTY Test Coverage][🔑qlty-covi]][🔑qlty-cov] [![QLTY Maintainability][🔑qlty-mnti]][🔑qlty-mnt] [![CI Heads][🚎3-hd-wfi]][🚎3-hd-wf] [![CI Current][🚎11-c-wfi]][🚎11-c-wf] [![CI Truffle Ruby][🚎9-t-wfi]][🚎9-t-wf] [![CI JRuby][🚎10-j-wfi]][🚎10-j-wf] [![Deps Locked][🚎13-🔒️-wfi]][🚎13-🔒️-wf] [![Deps Unlocked][🚎14-🔓️-wfi]][🚎14-🔓️-wf] [![CI Supported][🚎6-s-wfi]][🚎6-s-wf] [![CI Legacy][🚎4-lg-wfi]][🚎4-lg-wf] [![CI Unsupported][🚎7-us-wfi]][🚎7-us-wf] [![CI Ancient][🚎1-an-wfi]][🚎1-an-wf] [![CI Test Coverage][🚎2-cov-wfi]][🚎2-cov-wf] [![CI Style][🚎5-st-wfi]][🚎5-st-wf]

---

[![Liberapay Goal Progress][⛳liberapay-img]][⛳liberapay] [![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor] [![Buy me a coffee][🖇buyme-small-img]][🖇buyme] [![Donate on Polar][🖇polar-img]][🖇polar] [![Donate to my FLOSS or refugee efforts at ko-fi.com][🖇kofi-img]][🖇kofi] [![Donate to my FLOSS or refugee efforts using Patreon][🖇patreon-img]][🖇patreon]

## 🌻 Synopsis

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

### Federated DVCS

<details>
  <summary>Find this repo on other forges</summary>

| Federated [DVCS][💎d-in-dvcs] Repository               | Status                                                            | Issues                    | PRs                      | Wiki                      | CI                       | Discussions                  |
|--------------------------------------------------------|-------------------------------------------------------------------|---------------------------|--------------------------|---------------------------|--------------------------|------------------------------|
| 🧪 [galtzo-floss/rspec-stubbed_env on GitLab][📜src-gl]     | The Truth                                                         | [💚][🤝gl-issues]         | [💚][🤝gl-pulls]         | [💚][📜wiki]              | 🏀 Tiny Matrix           | ➖                            |
| 🧊 [galtzo-floss/rspec-stubbed_env on CodeBerg][📜src-cb] | An Ethical Mirror ([Donate][🤝cb-donate])                         | [💚][🤝cb-issues]         | [💚][🤝cb-pulls]         | ➖                         | ⭕️ No Matrix             | ➖                            |
| 🐙 [galtzo-floss/rspec-stubbed_env on GitHub][📜src-gh]   | A Dirty Mirror                                                    | [💚][🤝gh-issues]         | [💚][🤝gh-pulls]         | ➖                         | 💯 Full Matrix           | [💚][gh-discussions]         |
| 🎮️ [Discord Server][✉️discord-invite]                 | [![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite] | [Let's][✉️discord-invite] | [talk][✉️discord-invite] | [about][✉️discord-invite] | [this][✉️discord-invite] | [library!][✉️discord-invite] |

</details>

[gh-discussions]: https://github.com/galtzo-floss/rspec-stubbed_env/discussions

### Enterprise Support

<details>
  <summary>Need enterprise-level guarantees?</summary>

[![Get help from me on Tidelift][🏙️entsup-tidelift-img]][🏙️entsup-tidelift]

- 💡Subscribe for support guarantees covering _all_ FLOSS dependencies
- 💡Tidelift is part of [Sonar][🏙️entsup-tidelift-sonar]
- 💡Tidelift pays maintainers to maintain the software you depend on!<br/>📊`@`Pointy Haired Boss: An [enterprise support][🏙️entsup-tidelift] subscription is "[never gonna let you down][🧮kloc]", and *supports* open source maintainers

Alternatively:

- [![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite]
- [![Get help from me on Upwork][👨🏼‍🏫expsup-upwork-img]][👨🏼‍🏫expsup-upwork]
- [![Get help from me on Codementor][👨🏼‍🏫expsup-codementor-img]][👨🏼‍🏫expsup-codementor]

</details>

| Tokens to Remember      | [![Gem name][⛳️name-img]][⛳️gem-name] [![Gem namespace][⛳️namespace-img]][⛳️gem-namespace]                                                                                                                                                                                                                                       |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Works with JRuby        | [![JRuby 9.1 Compat][💎jruby-9.1i]][🚎10-j-wf] [![JRuby 9.2 Compat][💎jruby-9.2i]][🚎10-j-wf] [![JRuby 9.3 Compat][💎jruby-9.3i]][🚎10-j-wf] [![JRuby 9.4 Compat][💎jruby-9.4i]][🚎10-j-wf] [![JRuby 10.0 Compat][💎jruby-c-i]][🚎11-c-wf] [![JRuby HEAD Compat][💎jruby-headi]][🚎3-hd-wf]                                      |
| Works with Truffle Ruby | [![Truffle Ruby 22.3 Compat][💎truby-22.3i]][🚎9-t-wf] [![Truffle Ruby 23.0 Compat][💎truby-23.0i]][🚎9-t-wf] [![Truffle Ruby 23.1 Compat][💎truby-23.1i]][🚎9-t-wf] [![Truffle Ruby 24.1 Compat][💎truby-c-i]][🚎11-c-wf]                                                                                                       |
| Works with MRI Ruby 3   | [![Ruby 3.0 Compat][💎ruby-3.0i]][🚎4-lg-wf] [![Ruby 3.1 Compat][💎ruby-3.1i]][🚎6-s-wf] [![Ruby 3.2 Compat][💎ruby-3.2i]][🚎6-s-wf] [![Ruby 3.3 Compat][💎ruby-3.3i]][🚎6-s-wf] [![Ruby 3.4 Compat][💎ruby-c-i]][🚎11-c-wf] [![Ruby HEAD Compat][💎ruby-headi]][🚎3-hd-wf]                                                      |
| Works with MRI Ruby 2   | ![Ruby 2.0 Compat][💎ruby-2.0i] ![Ruby 2.1 Compat][💎ruby-2.1i] ![Ruby 2.2 Compat][💎ruby-2.2i] [![Ruby 2.3 Compat][💎ruby-2.3i]][🚎1-an-wf] [![Ruby 2.4 Compat][💎ruby-2.4i]][🚎1-an-wf] [![Ruby 2.5 Compat][💎ruby-2.5i]][🚎1-an-wf] [![Ruby 2.6 Compat][💎ruby-2.6i]][🚎7-us-wf] [![Ruby 2.7 Compat][💎ruby-2.7i]][🚎7-us-wf] |
| Works with MRI Ruby 1   | ![Ruby 1.8 Compat][💎ruby-1.8i] ![Ruby 1.9 Compat][💎ruby-1.9i]                                                                                                                                                                                                                                                                  |
| Source                  | [![Source on GitLab.com][📜src-gl-img]][📜src-gl] [![Source on CodeBerg.org][📜src-cb-img]][📜src-cb] [![Source on Github.com][📜src-gh-img]][📜src-gh] [![The best SHA: dQw4w9WgXcQ!][🧮kloc-img]][🧮kloc]                                                                                                                      |
| Documentation           | [![Current release on RubyDoc.info][📜docs-cr-rd-img]][🚎yard-current] [![YARD on Galtzo.com][📜docs-head-rd-img]][🚎yard-head] [![Maintainer Blog][🚂maint-blog-img]][🚂maint-blog] [![Wiki][📜wiki-img]][📜wiki]                                                                                                               |
| Compliance              | [![License: MIT][📄license-img]][📄license-ref] [![📄ilo-declaration-img]][📄ilo-declaration] [![Security Policy][🔐security-img]][🔐security] [![Contributor Covenant 2.1][🪇conduct-img]][🪇conduct] [![SemVer 2.0.0][📌semver-img]][📌semver]                                                                                 |
| Style                   | [![Enforced Code Style Linter][💎rlts-img]][💎rlts] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog] [![Gitmoji Commits][📌gitmoji-img]][📌gitmoji]                                                                                                                                                           |
| Support                 | [![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite] [![Get help from me on Upwork][👨🏼‍🏫expsup-upwork-img]][👨🏼‍🏫expsup-upwork] [![Get help from me on Codementor][👨🏼‍🏫expsup-codementor-img]][👨🏼‍🏫expsup-codementor]                                                                                    |
| Maintainer 🎖️          | [![Follow Me on LinkedIn][💖🖇linkedin-img]][💖🖇linkedin] [![Follow Me on Ruby.Social][💖🐘ruby-mast-img]][💖🐘ruby-mast] [![Follow Me on Bluesky][💖🦋bluesky-img]][💖🦋bluesky] [![Contact Maintainer][🚂maint-contact-img]][🚂maint-contact] [![My technical writing][💖💁🏼‍♂️devto-img]][💖💁🏼‍♂️devto]                   |
| `...` 💖                | [![Find Me on WellFound:][💖✌️wellfound-img]][💖✌️wellfound] [![Find Me on CrunchBase][💖💲crunchbase-img]][💖💲crunchbase] [![My LinkTree][💖🌳linktree-img]][💖🌳linktree] [![More About Me][💖💁🏼‍♂️aboutme-img]][💖💁🏼‍♂️aboutme] [🧊][💖🧊berg] [🐙][💖🐙hub]  [🛖][💖🛖hut] [🧪][💖🧪lab]                                |

## ✨ Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rspec-stubbed_env

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rspec-stubbed_env

### 🔒 Secure Installation

<details>
  <summary>For Medium or High Security Installations</summary>

This gem is cryptographically signed, and has verifiable [SHA-256 and SHA-512][💎SHA_checksums] checksums by
[stone_checksums][💎stone_checksums]. Be sure the gem you install hasn’t been tampered with
by following the instructions below.

Add my public key (if you haven’t already, expires 2045-04-29) as a trusted certificate:

```console
gem cert --add <(curl -Ls https://raw.github.com/galtzo-floss/certs/main/pboling.pem)
```

You only need to do that once.  Then proceed to install with:

```console
gem install rspec-stubbed_env -P HighSecurity
```

The `HighSecurity` trust profile will verify signed gems, and not allow the installation of unsigned dependencies.

If you want to up your security game full-time:

```console
bundle config set --global trust-policy MediumSecurity
```

`MediumSecurity` instead of `HighSecurity` is necessary if not all the gems you use are signed.

NOTE: Be prepared to track down certs for signed gems and add them the same way you added mine.

</details>

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

## 🚚 Switch to `main` branch

We migrated from `master` to `main` as the default branch.  If this affected your local checkout:

```console
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## 🔐 Security

See [SECURITY.md][🔐security].

## 🤝 Contributing

If you need some ideas of where to help, you could work on adding more code coverage,
or if it is already 💯 (see [below](#code-coverage)) check [issues][🤝gh-issues], or [PRs][🤝gh-pulls],
or use the gem and think about how it could be better.

We [![Keep A Changelog][📗keep-changelog-img]][📗keep-changelog] so if you make changes, remember to update it.

See [CONTRIBUTING.md][🤝contributing] for more detailed instructions.

### 🚀 Release Instructions

See [CONTRIBUTING.md][🤝contributing].

### Code Coverage

[![Coverage Graph][🔑codecov-g♻️]][🔑codecov]

[![Coveralls Test Coverage][🔑coveralls-img]][🔑coveralls]

[![QLTY Test Coverage][🔑qlty-covi]][🔑qlty-cov]

### 🪇 Code of Conduct

Everyone interacting with this project's codebases, issue trackers,
chat rooms and mailing lists agrees to follow the [![Contributor Covenant 2.1][🪇conduct-img]][🪇conduct].

## 🌈 Contributors

[![Contributors][🖐contributors-img]][🖐contributors]

Made with [contributors-img][🖐contrib-rocks].

Also see GitLab Contributors: [https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/graphs/main][🚎contributors-gl]

## ⭐️ Star History

<a href="https://star-history.com/#galtzo-floss/rspec-stubbed_env&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=galtzo-floss/rspec-stubbed_env&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=galtzo-floss/rspec-stubbed_env&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=galtzo-floss/rspec-stubbed_env&type=Date" />
 </picture>
</a>

## 📌 Versioning

This Library adheres to [![Semantic Versioning 2.0.0][📌semver-img]][📌semver].
Violations of this scheme should be reported as bugs.
Specifically, if a minor or patch version is released that breaks backward compatibility,
a new version should be immediately released that restores compatibility.
Breaking changes to the public API will only be introduced with new major versions.

### 📌 Is "Platform Support" part of the public API?

Yes.  But I'm obligated to include notes...

SemVer should, but doesn't explicitly, say that dropping support for specific Platforms
is a *breaking change* to an API.
It is obvious to many, but not all, and since the spec is silent, the bike shedding is endless.

> dropping support for a platform is both obviously and objectively a breaking change

- Jordan Harband (@ljharb, maintainer of SemVer) [in SemVer issue 716][📌semver-breaking]

To get a better understanding of how SemVer is intended to work over a project's lifetime,
read this article from the creator of SemVer:

- ["Major Version Numbers are Not Sacred"][📌major-versions-not-sacred]

As a result of this policy, and the interpretive lens used by the maintainer,
you can (and should) specify a dependency on these libraries using
the [Pessimistic Version Constraint][📌pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency("rspec-stubbed_env", "~> 1.0")
```

See [CHANGELOG.md][📌changelog] for a list of releases.

## 📄 License

The gem is available as open source under the terms of
the [MIT License][📄license] [![License: MIT][📄license-img]][📄license-ref].
See [LICENSE.txt][📄license] for the official [Copyright Notice][📄copyright-notice-explainer].

### © Copyright

<ul>
    <li>
        Copyright (c) 2018-2020, 2024-2025 Peter H. Boling, of
        <a href="https://discord.gg/3qme4XHNKN">
            Galtzo.com
            <picture>
              <img src="https://logos.galtzo.com/assets/images/galtzo-floss/avatar-128px-blank.svg" alt="Galtzo.com Logo (Wordless) by Aboling0, CC BY-SA 4.0" width="24">
            </picture>
        </a>, and rspec-stubbed_env contributors
    </li>
</ul>

## 🤑 One more thing

Having arrived at the bottom of the page, please endure a final supplication.
The primary maintainer of this gem, Peter Boling, wants
Ruby to be a great place for people to solve problems, big and small.
Please consider supporting his efforts via the giant yellow link below,
or one of the smaller ones, depending on button size preference.

[![Buy me a latte][🖇buyme-img]][🖇buyme]

[![Liberapay Goal Progress][⛳liberapay-img]][⛳liberapay] [![Sponsor Me on Github][🖇sponsor-img]][🖇sponsor] [![Donate on Polar][🖇polar-img]][🖇polar] [![Donate to my FLOSS or refugee efforts at ko-fi.com][🖇kofi-img]][🖇kofi] [![Donate to my FLOSS or refugee efforts using Patreon][🖇patreon-img]][🖇patreon]

P.S. If you need help️ or want to say thanks, 👇 Join the Discord.

[![Live Chat on Discord][✉️discord-invite-img]][✉️discord-invite]

[⛳liberapay-img]: https://img.shields.io/liberapay/goal/pboling.svg?logo=liberapay
[⛳liberapay]: https://liberapay.com/pboling/donate
[🖇sponsor-img]: https://img.shields.io/badge/Sponsor_Me!-pboling.svg?style=social&logo=github
[🖇sponsor]: https://github.com/sponsors/pboling
[🖇polar-img]: https://img.shields.io/badge/polar-donate-yellow.svg
[🖇polar]: https://polar.sh/pboling
[🖇kofi-img]: https://img.shields.io/badge/a_more_different_coffee-✓-yellow.svg
[🖇kofi]: https://ko-fi.com/O5O86SNP4
[🖇patreon-img]: https://img.shields.io/badge/patreon-donate-yellow.svg
[🖇patreon]: https://patreon.com/galtzo
[🖇buyme-small-img]: https://img.shields.io/badge/buy_me_a_coffee-✓-yellow.svg?style=flat
[🖇buyme-img]: https://img.buymeacoffee.com/button-api/?text=Buy%20me%20a%20latte&emoji=&slug=pboling&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff
[🖇buyme]: https://www.buymeacoffee.com/pboling
[✉️discord-invite]: https://discord.gg/3qme4XHNKN
[✉️discord-invite-img]: https://img.shields.io/discord/1373797679469170758?style=for-the-badge

[✇bundle-group-pattern]: https://gist.github.com/pboling/4564780
[⛳️gem-namespace]: https://github.com/galtzo-floss/rspec-stubbed_env
[⛳️namespace-img]: https://img.shields.io/badge/namespace-RSpec%3A%3AStubbedEnv-brightgreen.svg?style=flat&logo=ruby&logoColor=white
[⛳️gem-name]: https://rubygems.org/gems/rspec-stubbed_env
[⛳️name-img]: https://img.shields.io/badge/name-rspec--stubbed__env-brightgreen.svg?style=flat&logo=rubygems&logoColor=red
[🚂maint-blog]: http://www.railsbling.com/tags/rspec-stubbed_env
[🚂maint-blog-img]: https://img.shields.io/badge/blog-railsbling-0093D0.svg?style=for-the-badge&logo=rubyonrails&logoColor=orange
[🚂maint-contact]: http://www.railsbling.com/contact
[🚂maint-contact-img]: https://img.shields.io/badge/Contact-Maintainer-0093D0.svg?style=flat&logo=rubyonrails&logoColor=red
[💖🖇linkedin]: http://www.linkedin.com/in/peterboling
[💖🖇linkedin-img]: https://img.shields.io/badge/PeterBoling-LinkedIn-0B66C2?style=flat&logo=newjapanprowrestling
[💖✌️wellfound]: https://wellfound.com/u/peter-boling/u/peter-boling
[💖✌️wellfound-img]: https://img.shields.io/badge/peter--boling-orange?style=flat&logo=wellfound
[💖💲crunchbase]: https://www.crunchbase.com/person/peter-boling
[💖💲crunchbase-img]: https://img.shields.io/badge/peter--boling-purple?style=flat&logo=crunchbase
[💖🐘ruby-mast]: https://ruby.social/@galtzo
[💖🐘ruby-mast-img]: https://img.shields.io/mastodon/follow/109447111526622197?domain=https%3A%2F%2Fruby.social&style=flat&logo=mastodon&label=Ruby%20%40galtzo
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
[🏙️entsup-tidelift]: https://tidelift.com/subscription
[🏙️entsup-tidelift-img]: https://img.shields.io/badge/Tidelift_and_Sonar-Enterprise_Support-FD3456?style=for-the-badge&logo=sonar&logoColor=white
[🏙️entsup-tidelift-sonar]: https://blog.tidelift.com/tidelift-joins-sonar
[💁🏼‍♂️peterboling]: http://www.peterboling.com
[🚂railsbling]: http://www.railsbling.com
[📜src-gl-img]: https://img.shields.io/badge/GitLab-FBA326?style=for-the-badge&logo=Gitlab&logoColor=orange
[📜src-gl]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/
[📜src-cb-img]: https://img.shields.io/badge/CodeBerg-4893CC?style=for-the-badge&logo=CodeBerg&logoColor=blue
[📜src-cb]: https://codeberg.org/galtzo-floss/rspec-stubbed_env
[📜src-gh-img]: https://img.shields.io/badge/GitHub-238636?style=for-the-badge&logo=Github&logoColor=green
[📜src-gh]: https://github.com/galtzo-floss/rspec-stubbed_env
[📜docs-cr-rd-img]: https://img.shields.io/badge/RubyDoc-Current_Release-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜docs-head-rd-img]: https://img.shields.io/badge/YARD_on_Galtzo.com-HEAD-943CD2?style=for-the-badge&logo=readthedocs&logoColor=white
[📜wiki]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/wikis/home
[📜wiki-img]: https://img.shields.io/badge/wiki-examples-943CD2.svg?style=for-the-badge&logo=Wiki&logoColor=white
[👽dl-rank]: https://rubygems.org/gems/rspec-stubbed_env
[👽dl-ranki]: https://img.shields.io/gem/rd/rspec-stubbed_env.svg
[👽oss-help]: https://www.codetriage.com/galtzo-floss/rspec-stubbed_env
[👽oss-helpi]: https://www.codetriage.com/galtzo-floss/rspec-stubbed_env/badges/users.svg
[👽version]: https://rubygems.org/gems/rspec-stubbed_env
[👽versioni]: https://img.shields.io/gem/v/rspec-stubbed_env.svg
[🔑qlty-mnt]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env
[🔑qlty-mnti]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env/maintainability.svg
[🔑qlty-cov]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env/metrics/code?sort=coverageRating
[🔑qlty-covi]: https://qlty.sh/gh/galtzo-floss/projects/rspec-stubbed_env/coverage.svg
[🔑codecov]: https://codecov.io/gh/galtzo-floss/rspec-stubbed_env
[🔑codecovi♻️]: https://codecov.io/gh/galtzo-floss/rspec-stubbed_env/graph/badge.svg?token=hRnUCPqxMu
[🔑coveralls]: https://coveralls.io/github/galtzo-floss/rspec-stubbed_env?branch=main
[🔑coveralls-img]: https://coveralls.io/repos/github/galtzo-floss/rspec-stubbed_env/badge.svg?branch=main
[🖐codeQL]: https://github.com/galtzo-floss/rspec-stubbed_env/security/code-scanning
[🖐codeQL-img]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/codeql-analysis.yml/badge.svg
[🚎1-an-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/ancient.yml
[🚎1-an-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/ancient.yml/badge.svg
[🚎2-cov-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/coverage.yml
[🚎2-cov-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/coverage.yml/badge.svg
[🚎3-hd-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/heads.yml
[🚎3-hd-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/heads.yml/badge.svg
[🚎4-lg-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/legacy.yml
[🚎4-lg-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/legacy.yml/badge.svg
[🚎5-st-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/style.yml
[🚎5-st-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/style.yml/badge.svg
[🚎6-s-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/supported.yml
[🚎6-s-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/supported.yml/badge.svg
[🚎7-us-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/unsupported.yml
[🚎7-us-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/unsupported.yml/badge.svg
[🚎8-ho-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/hoary.yml
[🚎8-ho-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/hoary.yml/badge.svg
[🚎9-t-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/truffle.yml
[🚎9-t-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/truffle.yml/badge.svg
[🚎10-j-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/jruby.yml
[🚎10-j-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/jruby.yml/badge.svg
[🚎11-c-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/current.yml
[🚎11-c-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/current.yml/badge.svg
[🚎13-🔒️-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/deps_locked.yml
[🚎13-🔒️-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/deps_locked.yml/badge.svg
[🚎14-🔓️-wf]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/deps_unlocked.yml
[🚎14-🔓️-wfi]: https://github.com/galtzo-floss/rspec-stubbed_env/actions/workflows/deps_unlocked.yml/badge.svg
[💎ruby-1.8i]: https://img.shields.io/badge/Ruby-1.8-412BD3?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-1.9i]: https://img.shields.io/badge/Ruby-1.9-412BD3?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.0i]: https://img.shields.io/badge/Ruby-2.0-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.1i]: https://img.shields.io/badge/Ruby-2.1-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.2i]: https://img.shields.io/badge/Ruby-2.2-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.3i]: https://img.shields.io/badge/Ruby-2.3-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.4i]: https://img.shields.io/badge/Ruby-2.4-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.5i]: https://img.shields.io/badge/Ruby-2.5-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.6i]: https://img.shields.io/badge/Ruby-2.6-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-2.7i]: https://img.shields.io/badge/Ruby-2.7-DF00CA?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.0i]: https://img.shields.io/badge/Ruby-3.0-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.1i]: https://img.shields.io/badge/Ruby-3.1-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.2i]: https://img.shields.io/badge/Ruby-3.2-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-3.3i]: https://img.shields.io/badge/Ruby-3.3-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[💎ruby-c-i]: https://img.shields.io/badge/Ruby-current-CC342D?style=for-the-badge&logo=ruby&logoColor=green
[💎ruby-headi]: https://img.shields.io/badge/Ruby-HEAD-CC342D?style=for-the-badge&logo=ruby&logoColor=blue
[💎truby-22.3i]: https://img.shields.io/badge/Truffle_Ruby-22.3-34BCB1?style=for-the-badge&logo=ruby&logoColor=pink
[💎truby-23.0i]: https://img.shields.io/badge/Truffle_Ruby-23.0-34BCB1?style=for-the-badge&logo=ruby&logoColor=pink
[💎truby-23.1i]: https://img.shields.io/badge/Truffle_Ruby-23.1-34BCB1?style=for-the-badge&logo=ruby&logoColor=pink
[💎truby-c-i]: https://img.shields.io/badge/Truffle_Ruby-current-34BCB1?style=for-the-badge&logo=ruby&logoColor=green
[💎truby-headi]: https://img.shields.io/badge/Truffle_Ruby-HEAD-34BCB1?style=for-the-badge&logo=ruby&logoColor=blue
[💎jruby-9.1i]: https://img.shields.io/badge/JRuby-9.1-FBE742?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-9.2i]: https://img.shields.io/badge/JRuby-9.2-FBE742?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-9.3i]: https://img.shields.io/badge/JRuby-9.3-FBE742?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-9.4i]: https://img.shields.io/badge/JRuby-9.4-FBE742?style=for-the-badge&logo=ruby&logoColor=red
[💎jruby-c-i]: https://img.shields.io/badge/JRuby-current-FBE742?style=for-the-badge&logo=ruby&logoColor=green
[💎jruby-headi]: https://img.shields.io/badge/JRuby-HEAD-FBE742?style=for-the-badge&logo=ruby&logoColor=blue
[🤝gh-issues]: https://github.com/galtzo-floss/rspec-stubbed_env/issues
[🤝gh-pulls]: https://github.com/galtzo-floss/rspec-stubbed_env/pulls
[🤝gl-issues]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/issues
[🤝gl-pulls]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/merge_requests
[🤝cb-issues]: https://codeberg.org/galtzo-floss/rspec-stubbed_env/issues
[🤝cb-pulls]: https://codeberg.org/galtzo-floss/rspec-stubbed_env/pulls
[🤝cb-donate]: https://donate.codeberg.org/
[🤝contributing]: CONTRIBUTING.md
[🔑codecov-g♻️]: https://codecov.io/gh/galtzo-floss/rspec-stubbed_env/graphs/tree.svg?token=hRnUCPqxMu
[🖐contrib-rocks]: https://contrib.rocks
[🖐contributors]: https://github.com/galtzo-floss/rspec-stubbed_env/graphs/contributors
[🖐contributors-img]: https://contrib.rocks/image?repo=galtzo-floss/rspec-stubbed_env
[🚎contributors-gl]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/graphs/main
[🪇conduct]: CODE_OF_CONDUCT.md
[🪇conduct-img]: https://img.shields.io/badge/Contributor_Covenant-2.1-259D6C.svg
[📌pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-259D6C.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📌changelog]: CHANGELOG.md
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-34495e.svg?style=flat
[📌gitmoji]:https://gitmoji.dev
[📌gitmoji-img]:https://img.shields.io/badge/gitmoji_commits-%20😜%20😍-34495e.svg?style=flat-square
[🧮kloc]: https://www.youtube.com/watch?v=dQw4w9WgXcQ
[🧮kloc-img]: https://img.shields.io/badge/KLOC-0.073-FFDD67.svg?style=for-the-badge&logo=YouTube&logoColor=blue
[🔐security]: SECURITY.md
[🔐security-img]: https://img.shields.io/badge/security-policy-259D6C.svg?style=flat
[📄copyright-notice-explainer]: https://opensource.stackexchange.com/questions/5778/why-do-licenses-such-as-the-mit-license-specify-a-single-year
[📄license]: LICENSE.txt
[📄license-ref]: https://opensource.org/licenses/MIT
[📄license-img]: https://img.shields.io/badge/License-MIT-259D6C.svg
[📄ilo-declaration]: https://www.ilo.org/declaration/lang--en/index.htm
[📄ilo-declaration-img]: https://img.shields.io/badge/ILO_Fundamental_Principles-✓-259D6C.svg?style=flat
[🚎yard-current]: http://rubydoc.info/gems/rspec-stubbed_env
[🚎yard-head]: https://rspec-stubbed-env.galtzo.com
[💎stone_checksums]: https://github.com/galtzo-floss/stone_checksums
[💎SHA_checksums]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tree/main/checksums
[💎rlts]: https://github.com/rubocop-lts/rubocop-lts
[💎rlts-img]: https://img.shields.io/badge/code_style_%26_linting-rubocop--lts-34495e.svg?plastic&logo=ruby&logoColor=white
[💎d-in-dvcs]: https://railsbling.com/posts/dvcs/put_the_d_in_dvcs/
