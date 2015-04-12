# Growing Rails Controllers

## Overview

In the book [Growing Rails Applicationsin
Practice](https://leanpub.com/growing-rails), the authors present a standard way
of writing controllers.

This project illustrates my approach on how to test these controllers, based on
the following principles:

### Principles

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

I made some minor changes from the code in the book:

* Use `all` instead of `scoped` for Rails 4 compatability
* USe `||` instead of `or` to avoid RuboCop warning
* Use single line `if` modifier to avoid RuboCop warning

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
