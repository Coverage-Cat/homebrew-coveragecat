# Coverage Cat Homebrew Tap

Homebrew tap for the official Coverage Cat CLI.

## Who this is for

This tap is for operator partners who need the official Coverage Cat CLI installed locally and already have an issued Coverage Cat bearer key.

If you are building a consumer-facing AI agent for an individual shopper, do not send them to the CLI or this tap. Install the Coverage Cat umbrella or homeowners skill in that agent instead, let the skill drive Coverage Cat's public consumer-prefill flow, keep the returned `uid` plus the freshest rotated `intake_access_token` in chat, continue the direct `/api/intake/:uid/...` follow-up loop there, and use the Coverage Cat `resume_url` only as a browser fallback.

For umbrella consumer handoffs specifically, do not open with a questionnaire on a cold start. Call `/api/consumer/umbrella/prefill` first with the fullest estimate you can justify, keep the user out of the loop until `/api/intake/:uid/issues` reaches `ready_for_submission`, or until it returns a staged review plus bundled shopper-detail `next_question`. On that staged review turn, show the assembled facts and ask for the shopper-owned bundle together in one message. When Coverage Cat asks for it, that bundle can include full name, email, phone, full address, birthday, marital status, driver's license number, net worth, and corrections to any estimated facts. If the shopper gives a birthday in normal US `MM-DD-YYYY` form, normalize it to `YYYY-MM-DD` before patching Coverage Cat. Then submit from that same review turn, and only ask for soft-credit consent later if `/select` requires it after the user picks an offer. When Coverage Cat returns multiple offers, present the alternatives instead of collapsing the result to only the recommended default.

For homeowners consumer handoffs specifically, ask the user only for full name, email, and property address first, recover core shopper and occupancy facts such as date of birth, marital status, and owner-occupied vs new-purchase from the user's own context before calling `/api/consumer/homeowners/prefill`, keep current-policy expiration in that same review turn as an estimated value two months from today instead of breaking it into a separate follow-up, let Coverage Cat estimate the remaining reviewable home fields, allow numbered choices where a number alone as shorthand is easier for occupancy or property type, then show one completed review-and-soft-credit-consent card with clearly separated applicant details, property details, estimated structure details, estimated systems details, and other sections instead of a questionnaire.

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
