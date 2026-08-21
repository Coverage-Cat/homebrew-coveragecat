# Coverage Cat Homebrew Tap

Homebrew tap for the official Coverage Cat CLI.

## Who this is for

This tap is for operator partners who need the official Coverage Cat CLI installed locally and already have an issued Coverage Cat bearer key.

If you are building a consumer-facing AI agent for an individual shopper, do not send them to the CLI or this tap. Install the Coverage Cat umbrella or homeowners skill in that agent instead, and let the skill drive Coverage Cat's public consumer handoff flow.

## Install

```sh
brew tap Coverage-Cat/coveragecat
brew install coveragecat
coveragecat help
```

## Source of truth

- CLI source repo: `https://github.com/Coverage-Cat/coveragecat-cli`
- Product docs: `https://www.coveragecat.com/developers/cli`

The formula in `Formula/coveragecat.rb` installs the published CLI from the public `coveragecat-cli` source repository.
