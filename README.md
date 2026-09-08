# Coverage Cat Homebrew Tap

Homebrew tap for the official Coverage Cat CLI.

## Who this is for

This tap is for operator partners who need the official Coverage Cat CLI installed locally and already have an issued Coverage Cat bearer key.

If you are building a consumer-facing AI agent for an individual shopper, do not send them to the CLI or this tap. Install the Coverage Cat umbrella or homeowners skill in that agent instead, let the skill drive Coverage Cat's public consumer-prefill flow, keep the returned `uid` plus the freshest rotated `intake_access_token` in chat, continue the direct `/api/intake/:uid/...` follow-up loop there, and use the Coverage Cat `resume_url` only as a browser fallback.

If that consumer-facing runtime supports MCP, register `https://www.coveragecat.com/.well-known/mcp.json` and keep the session on the product MCP consumer subset: `umbrella_consumer_prefill`, `homeowners_consumer_prefill`, `consumer_intake_issues`, `consumer_intake_patch`, plus `umbrella_consumer_select`, `umbrella_consumer_bind`, and `umbrella_consumer_attach` for umbrella post-quote follow-up. For umbrella, stay on that no-operator subset through `payment_needed` and `payment_url` instead of switching to delegated tools just to reach checkout. For homeowners, stay on the no-operator subset through review and quote follow-up, then let Coverage Cat's consumer portal finish final bind.

For umbrella consumer handoffs specifically, do not open with a questionnaire on a cold start. Call `/api/consumer/umbrella/prefill` first with the fullest estimate you can justify, keep the user out of the loop until `/api/intake/:uid/issues` reaches `ready_for_submission`, or until it returns a staged review plus bundled shopper-detail `next_question`. On every pre-submit user-facing turn, say explicitly that the application is not submitted yet and Coverage Cat has not received a submitted application yet. On that staged review turn, show the assembled facts and ask for the shopper-owned bundle together in one plain-English message. When you list gathered details or remaining items, render them as short labeled bullets or sections rather than a prose paragraph. If any shown value is estimated, mark that bullet or value with `*`, include `* = estimated` once above and once below the list, and do not prefix every estimated line with `[Estimated]`. When Coverage Cat asks for it, that bundle can include full name, email, phone, full address, birthday, marital status, driver's license state, driver's license number, net worth, and corrections to any estimated facts. If marital status means Coverage Cat still needs spouse or partner details, keep spouse full name, spouse date of birth, spouse driver's license state, and spouse driver's license number in that same single review turn instead of opening a second follow-up. If the shopper gives a birthday in normal US `MM-DD-YYYY` form, normalize it to `YYYY-MM-DD` before patching Coverage Cat. Then submit from that same review turn, and only ask for soft-credit consent later if `/select` requires it after the user picks an offer. When Coverage Cat returns multiple offers, present the alternatives instead of collapsing the result to only the recommended default. When quoted offers include Monoline or Markel, tell the shopper at quote review time that current home and auto declarations are still required before payment and that once those uploads are on file secure checkout is usually ready within about 5-10 minutes while declarations verification continues in parallel. For Monoline and Markel, keep the post-choose loop in chat too: after the user selects the offer, upload any required home and auto declarations through `/api/intake/:uid/attach`, then keep polling `/api/intake/:uid/issues`; once those uploads are on file, `documents_pending_review` usually advances to `payment_needed` with a secure `payment_url` within about 5-10 minutes while declarations verification continues in parallel.

For homeowners consumer handoffs specifically, ask the user only for full name, email, and property address first, recover core shopper and occupancy facts such as date of birth, marital status, and owner-occupied vs new-purchase from the user's own context before calling `/api/consumer/homeowners/prefill`, keep current-policy expiration in that same review turn as an estimated value two months from today instead of breaking it into a separate follow-up, let Coverage Cat estimate the remaining reviewable home fields, allow numbered choices where a number alone as shorthand is easier for occupancy or property type, then show one completed review-and-soft-credit-consent card with clearly separated applicant details, property details, estimated structure details, estimated systems details, and other sections instead of a questionnaire. On every pre-submit user-facing turn, say explicitly that the application is not submitted yet and Coverage Cat has not received a submitted application yet, ask for any remaining items in plain English, and render gathered details plus remaining items as short labeled bullets or sections rather than a prose paragraph. If any shown value is estimated, mark that bullet or value with `*`, include `* = estimated` once above and once below the list, and do not prefix every estimated line with `[Estimated]`.

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
