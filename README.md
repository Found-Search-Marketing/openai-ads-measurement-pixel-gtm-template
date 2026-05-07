# OpenAI Ads Measurement Pixel — Web GTM Template

Loads the [OpenAI Ads Measurement Pixel](https://developers.openai.com/ads)
SDK and queues `oaiq("init")` / `oaiq("measure")` calls from a web
Google Tag Manager container.

This is the web companion to the
[OpenAI Ads Conversions API](https://github.com/Found-Search-Marketing/openai-ads-conversions-api-gtm-template)
server-side template. Use both together to dedupe browser and server events.

## Features

- Single tag with two modes:
  - **Initialize Pixel** — loads `https://bzrcdn.openai.com/sdk/oaiq.min.js`
    and calls `oaiq("init", { pixelId, debug? })`. Fire on All Pages, once.
  - **Measure Event** — calls
    `oaiq("measure", eventName, eventProps, eventOptions?)`. Fire on
    conversion triggers.
- Standard event dropdown matching the documented OpenAI events plus a
  Custom event mode
- Auto-derives `data.type` from the event name
  (`order_created` → `contents`, `lead_created` → `customer_action`,
  `subscription_created` → `plan_enrollment`, etc.)
- Built-in fields for `amount`, `currency`, `plan_id`, and a structured
  `contents[]` table
- Free-form **Additional Event Properties** table for fields not covered
  out of the box (useful for custom events)
- Auto decimal-to-integer-cents conversion (`25.99` → `2599`)
- `event_id` field for browser/server deduplication
- `custom_event_name` field shown only when Event Type is Custom
- `oppref` capture and the `__oppref` cookie are handled by the SDK

## Setup

1. Install this template: in your **web** GTM container, open
   **Templates → Tag Templates → New → ⋮ → Import** and pick
   [`template.tpl`](template.tpl).
2. Create an **Initialize Pixel** tag, plug in your Pixel ID, and trigger
   it on All Pages.
3. Create one **Measure Event** tag per conversion you want to track,
   trigger them on the relevant data layer events.

For browser/server deduplication, install the matching
[OpenAI Ads Conversions API](https://github.com/Found-Search-Marketing/openai-ads-conversions-api-gtm-template)
template on the server container and reuse the same `event_id` (browser) /
`id` (server). For custom events, also reuse the same `custom_event_name`.

## Permissions

The template requests the minimum needed:

- `inject_script` for `https://bzrcdn.openai.com/sdk/oaiq.min.js`
- `access_globals` read/write/execute on `oaiq` and read/write on `oaiq.q`
- `logging` (debug environments only)

## Tests

The template ships with scenario tests covering: SDK injection, debug flag,
standard / custom / 3-arg measure forms, `plan_enrollment` shape, and
`extraProps` merging. Open the template in GTM → **Tests** tab → **Run all**.

## Support

Open an issue on this repository.

## License

Licensed under the [Apache 2.0 License](LICENSE).
