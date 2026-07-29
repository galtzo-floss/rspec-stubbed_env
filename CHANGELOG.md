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

## [1.0.10] - 2026-07-28

- TAG: [v1.0.10][1.0.10t]
- COVERAGE: 100.00% -- 95/95 lines in 5 files
- BRANCH COVERAGE: 100.00% -- 19/19 branches in 5 files
- 100.00% documented

### Fixed

- kettle-jem-template-20260728-004 - Generated dep-heads workflows now use the
  setup-ruby Bundler install path for direct appraisal Gemfiles, avoiding rv
  lockfile parser failures on Git and path dependencies.

## [1.0.9] - 2026-07-28

- TAG: [v1.0.9][1.0.9t]
- COVERAGE: 100.00% -- 95/95 lines in 5 files
- BRANCH COVERAGE: 100.00% -- 19/19 branches in 5 files
- 100.00% documented

### Added

- Documentation linting now has its generated `yard-lint` dependency and severity config available in the local bundle.

- kettle-jem-template-20260726-001 - Projects now include YARD lint
  configuration and documentation dependencies so documentation issues fail
  before generated docs are refreshed.

- kettle-jem-template-20260727-001 - Spec harness documentation now lists the
  RSpec helpers provided by `kettle-test`.

### Changed

- kettle-jem-template-20260728-001 - Generated Ruby workflows now use clearer
  setup-ruby-flash planning and can prepare appraisal-only jobs without
  installing the main Gemfile bundle.

### Fixed

- kettle-jem-template-20260726-002 - Generated version files now document their
  version namespace and constants, reducing warning-only YARD lint output.

- kettle-jem-template-20260726-003 - Coverage upload steps now treat Coveralls,
  QLTY, and Codecov as optional, so provider outages do not fail CI when local
  coverage thresholds still pass.
- kettle-jem-template-20260728-002 - Generated RuboCop configs now ignore the
  same `gemfiles/vendor/bundle` tree as `.gitignore`, so vendored dependency
  installs are not reported as project lint debt.
- kettle-jem-template-20260728-003 - Generated dep-heads workflows now run
  TruffleRuby jobs with current RubyGems and Bundler, avoiding setup failures
  before the test suite starts.

## [1.0.8] - 2026-07-25

- TAG: [v1.0.8][1.0.8t]
- COVERAGE: 100.00% -- 95/95 lines in 5 files
- BRANCH COVERAGE: 100.00% -- 19/19 branches in 5 files
- 80.00% documented

### Changed

- kettle-jem-template-20260725-002 - Generated gemspec templates now include
  `anonymous_loader` as a development dependency, and version specs use it to
  execute generated `version.rb` files for coverage without redefining package
  constants. Managed version specs are removed when `version_gem` is disabled
  or incompatible with the project's runtime Ruby floor.

## [1.0.7] - 2026-07-25

- TAG: [v1.0.7][1.0.7t]
- COVERAGE: 100.00% -- 95/95 lines in 5 files
- BRANCH COVERAGE: 100.00% -- 19/19 branches in 5 files
- 80.00% documented

### Changed

- kettle-jem-template-20260716-001 - Shim gemspec manifests now include
  `LICENSE.md` instead of nonexistent `LICENSE.txt`.
- kettle-jem-template-20260716-002 - Generated gemspec manifests now ship fewer
  repository-only files by default to reduce downstream distro packaging churn.
- kettle-jem-template-20260720-001 - Generated READMEs can now render
  template-managed corporate sponsor logos from project or family config.
- kettle-jem-template-20260720-002 - Generated development Gemfiles now use the
  released `tree_sitter_language_pack` gem 1.13.3 or newer by default.
- kettle-jem-template-20260720-003 - Generated StructuredMerge Git diff driver
  config now uses the installed `smorg-rb` Ruby driver name.
- kettle-jem-template-20260720-004 - Generated multi-engine workflow files now
  omit JRuby and TruffleRuby jobs when project config declares MRI-only engines.
- kettle-jem-template-20260720-005 - Generated README Support & Community rows
  now include a RubyForum help badge.
- kettle-jem-template-20260725-001 - Generated JRuby and TruffleRuby workflow
  files now run when pull request head branches start with `feature/release`,
  so release CI monitoring does not report intentionally skipped engine
  workflows as failures.

### Fixed

- Added branch coverage for hash accessor stubbing edge cases so the suite meets
  its 100% branch coverage release threshold.

## [1.0.6] - 2026-07-02

- TAG: [v1.0.6][1.0.6t]
- COVERAGE: 100.00% -- 95/95 lines in 5 files
- BRANCH COVERAGE: 84.21% -- 16/19 branches in 5 files
- 80.00% documented

### Fixed

- Package configured license files in gem release file lists.

- Avoid duplicate generated appraisal declarations for stdlib gems already
  supplied by the modular `x_std_libs` gemfiles.

## [1.0.5] - 2026-06-27

- TAG: [v1.0.5][1.0.5t]
- COVERAGE: 100.00% -- 95/95 lines in 5 files
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

[Unreleased]: https://github.com/galtzo-floss/rspec-stubbed_env/compare/v1.0.10...HEAD
[1.0.10]: https://github.com/galtzo-floss/rspec-stubbed_env/compare/v1.0.9...v1.0.10
[1.0.10t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.10
[1.0.9]: https://github.com/galtzo-floss/rspec-stubbed_env/compare/v1.0.8...v1.0.9
[1.0.9t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.9
[1.0.8]: https://github.com/galtzo-floss/rspec-stubbed_env/compare/v1.0.7...v1.0.8
[1.0.8t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.8
[1.0.7]: https://github.com/galtzo-floss/rspec-stubbed_env/compare/v1.0.6...v1.0.7
[1.0.7t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.7
[1.0.6]: https://github.com/galtzo-floss/rspec-stubbed_env/compare/v1.0.5...v1.0.6
[1.0.6t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.6
[1.0.5]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.4...v1.0.5
[1.0.5t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.5
[1.0.4]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.3...v1.0.4
[1.0.4t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.4
[1.0.3]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.2...v1.0.3
[1.0.3t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.3
[1.0.2]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.1...v1.0.2
[1.0.2t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.2
[1.0.1]: https://gitlab.com/galtzo-floss/rspec-stubbed_env/-/compare/v1.0.0...v1.0.1
[1.0.1t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.1
[1.0.0]: https://github.com/galtzo-floss/rspec-stubbed_env/compare/a3055964517c159bf214712940982034b75264be...v1.0.0
[1.0.0t]: https://github.com/galtzo-floss/rspec-stubbed_env/releases/tag/v1.0.0
