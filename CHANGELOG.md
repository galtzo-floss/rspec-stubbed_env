# Changelog

[![SemVer 2.0.0][📌semver-img]][📌semver] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog]

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][📗keep-changelog],
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html),
and [yes][📌major-versions-not-sacred], platform and engine support are part of the [public API][📌semver-breaking].
Please file a bug if you notice a violation of semantic versioning.

[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-FFDD67.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-FFDD67.svg?style=flat

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [1.0.5] - 2026-06-27
- TAG: [v1.0.5][1.0.5t]
- COVERAGE: 100.00% -- 94/94 lines in 5 files
- BRANCH COVERAGE: 84.21% -- 16/19 branches in 5 files
- 80.00% documented
### Added
- `stub_env_hash_accessors` opt-in helper for stubbing `ENV.to_hash` and
  `ENV.to_h` with a mixed real, stubbed, and hidden environment hash.
- More documentation
- Release notifications to Galtzo FLOSS Discord
  - Join: https://discord.gg/3qme4XHNKN
- REEK list of things to work on (for devs)
- More binstubs (for devs)
- `Version` module, with backwards compatibility for deprecated `VERSION` constant
### Fixed
- Bad links in documentation
- Compat with Ruby 1.8.7, and 1.9.0
- Rake tasks (for dev)

## [1.0.4] - 2025-08-04
- TAG: [v1.0.4][1.0.4t]
- COVERAGE: 100.00% -- 73/73 lines in 5 files
- BRANCH COVERAGE: 100.00% -- 10/10 branches in 5 files
- 85.71% documented
### Added
- Discord notifications for CI, issues, pulls, etc
### Changed
- Ownership transfer from pboling to galtzo-floss
- gemspec metadata (homepage, funding, etc)

## [1.0.3] - 2025-07-28
- TAG: [v1.0.3][1.0.3t]
- COVERAGE: 100.00% -- 73/73 lines in 5 files
- BRANCH COVERAGE: 100.00% -- 10/10 branches in 5 files
- 85.71% documented
### Added
- More documentation
- Tracking maintainability and coverage with QLTY.sh
- Documentation site
  - https://rspec-stubbed-env.galtzo.com
### Changed
- gemspec metadata

## [1.0.2] - 2025-05-06
- TAG: [v1.0.2][1.0.2t]
- COVERAGE: 100.00% -- 73/73 lines in 5 files
- BRANCH COVERAGE: 100.00% -- 10/10 branches in 5 files
- 85.71% documented
### Added
- `hide_env`
  - `include_context "with hidden env", "FOO"`
- Allow providing the env key/value pairs to be stubbed to `include_context` (@darhazer)
  - `include_context "with stubbed env", "FOO" => "is bar"`
- Security policy (SECURITY.md)
- Random ordering of test suite
- 20 year signing cert expires 2045-04-29
- dev container config for development
- Added appraisals to test on many supported Rubies
  - Ruby 2.3+, including head
  - JRuby 9.1+, including head
  - Truffleruby 22.3+, including head
- Added CITATION.cff
- Upgraded Code of Conduct based on Contributor Covenant v2.1
- New pattern for loading version.rb in gemspec allows (real) 100% code coverage

## [1.0.1] - 2023-04-01
- TAG: [v1.0.1][1.0.1t]
### Added
- support for values_at (@darhazer)
- support for symbol keys (@hosamaly)
- Structured gemfiles
- Rubocop with standard, gradual, & more
- Releases are now signed
- Releases now have checksums
### Changed
- Required ruby version in gemspec >= 1.8.7
  - not bumping major version, because this was already the de-facto minimum
- TravisCI => GitHub Actions
- CODE_OF_CONDUCT.md upgraded to v2.0
- Moved from master to main default branch
### Fixed
- README Badges (CI status)

## [1.0.0] - 2018-10-06
- TAG: [v1.0.0][1.0.0t]
### Added
- negated matchers
- rubocop config

<!-- Contributors (alphabetically) -->
[@darhazer]: https://github.com/darhazer
[@hosamaly]: https://github.com/hosamaly

[Unreleased]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.5...main
[1.0.5]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.4...v1.0.5
[1.0.5t]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tags/v1.0.5
[1.0.4]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.3...v1.0.4
[1.0.4t]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tags/v1.0.4
[1.0.3]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.2...v1.0.3
[1.0.3t]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tags/v1.0.3
[1.0.2]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.1...v1.0.2
[1.0.2t]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tags/v1.0.2
[1.0.1]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.0...v1.0.1
[1.0.1t]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tags/v1.0.1
[1.0.0]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/a3055964517c159bf214712940982034b75264be...v1.0.0
[1.0.0t]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/tags/v1.0.0
