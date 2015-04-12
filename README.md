# Growing Rails Controllers

## Overview

In the book [Growing Rails Applications in
Practice](https://leanpub.com/growing-rails), the authors present a standard way
of writing controllers.

This project illustrates my approach on how to test these controllers, based on
the following principles:

* The specs should fully isolated from the database
* No use of any fixtures or factories
* Use [verifying doubles](https://relishapp.com/rspec/rspec-mocks/docs/verifying-doubles)
* Generates no warnings from RuboCop default configuration
* Each scenario is clearly split into its [Setup, Execution and Verification
  phases](https://robots.thoughtbot.com/four-phase-test).
* No use of `before` blocks. [Minimal use of
  `let`](https://robots.thoughtbot.com/lets-not)
* Prefer [spies](https://robots.thoughtbot.com/a-closer-look-at-test-spies) over
  mocks where appropriate.
* Extract duplication into plain Ruby methods
* Uses `expect` instead of `allow` for more confident specs.
* Ruby 1.9 hash syntax
* No use of `tap`

I made some minor changes from the code in the book:

* Use `all` instead of `scoped` for Rails 4 compatibility
* Use `||` instead of `or` to avoid RuboCop warning
* Use single line `if` modifier to avoid RuboCop warning
