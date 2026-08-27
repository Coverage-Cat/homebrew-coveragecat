# Coverage Cat Homebrew Tap

Homebrew tap for the official Coverage Cat CLI.

## Who this is for

This tap is for operator partners who need the official Coverage Cat CLI installed locally and already have an issued Coverage Cat bearer key.

If you are building a consumer-facing AI agent for an individual shopper, do not send them to the CLI or this tap. Install the Coverage Cat umbrella or homeowners skill in that agent instead, let the skill drive Coverage Cat's public consumer-prefill flow, keep the returned `uid` plus the freshest rotated `intake_access_token` in chat, continue the direct `/api/intake/:uid/...` follow-up loop there, and use the Coverage Cat `resume_url` only as a browser fallback.

For umbrella consumer handoffs specifically, keep the user out of the loop until `/api/intake/:uid/issues` reaches `ready_for_submission`, or until it returns a staged review plus bundled contact-detail `next_question`. On that staged review turn, show the assembled facts and ask for full name, email, and full address together in one message rather than one field at a time. Then submit from that same review turn, and only ask for soft-credit consent later if `/select` requires it after the user picks an offer. When Coverage Cat returns multiple offers, present the alternatives instead of collapsing the result to only the recommended default.

For homeowners consumer handoffs specifically, ask the user only for full name, email, and property address first, recover core shopper and occupancy facts such as date of birth, marital status, and owner-occupied vs new-purchase from the user's own context before calling `/api/consumer/homeowners/prefill`, let Coverage Cat estimate the remaining reviewable home fields, then show one completed review-and-soft-credit-consent card instead of a questionnaire.

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
