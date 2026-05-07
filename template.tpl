___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "OpenAI Ads Measurement Pixel",
  "categories": ["CONVERSIONS", "ADVERTISING"],
  "description": "Loads the OpenAI Ads Measurement Pixel and sends standard or custom conversion events. Use one tag in 'Initialize' mode on All Pages and additional tags in 'Measure event' mode on conversion triggers.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "tagType",
    "displayName": "Tag Type",
    "radioItems": [
      {
        "value": "init",
        "displayValue": "Initialize Pixel"
      },
      {
        "value": "measure",
        "displayValue": "Measure Event"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "init"
  },
  {
    "type": "GROUP",
    "name": "credentials",
    "displayName": "Credentials",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "pixelId",
        "displayName": "Pixel ID",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Your Pixel ID from the Conversions tab in OpenAI Ads Manager.",
        "enablingConditions": [
          {
            "paramName": "tagType",
            "paramValue": "init",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "debug",
        "checkboxText": "Enable debug logging in browser console",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "tagType",
            "paramValue": "init",
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "event",
    "displayName": "Event",
    "groupStyle": "ZIPPY_OPEN",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "measure",
        "type": "EQUALS"
      }
    ],
    "subParams": [
      {
        "type": "RADIO",
        "name": "eventName",
        "displayName": "Event Type",
        "radioItems": [
          {
            "value": "standard",
            "displayValue": "Standard"
          },
          {
            "value": "custom",
            "displayValue": "Custom"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "standard"
      },
      {
        "type": "SELECT",
        "name": "eventNameStandard",
        "displayName": "Standard Event",
        "selectItems": [
          { "value": "page_viewed", "displayValue": "page_viewed (contents)" },
          { "value": "contents_viewed", "displayValue": "contents_viewed (contents)" },
          { "value": "items_added", "displayValue": "items_added (contents)" },
          { "value": "checkout_started", "displayValue": "checkout_started (contents)" },
          { "value": "order_created", "displayValue": "order_created (contents)" },
          { "value": "lead_created", "displayValue": "lead_created (customer_action)" },
          { "value": "registration_completed", "displayValue": "registration_completed (customer_action)" },
          { "value": "appointment_scheduled", "displayValue": "appointment_scheduled (customer_action)" },
          { "value": "subscription_created", "displayValue": "subscription_created (plan_enrollment)" },
          { "value": "trial_started", "displayValue": "trial_started (plan_enrollment)" }
        ],
        "simpleValueType": true,
        "defaultValue": "order_created",
        "enablingConditions": [
          {
            "paramName": "eventName",
            "paramValue": "standard",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "eventNameCustom",
        "displayName": "Custom Event Type Value",
        "simpleValueType": true,
        "help": "Sent as the eventName argument to oaiq('measure', ...). Use 'custom' for fully custom events.",
        "defaultValue": "custom",
        "enablingConditions": [
          {
            "paramName": "eventName",
            "paramValue": "custom",
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventProps",
    "displayName": "Event Properties",
    "groupStyle": "ZIPPY_OPEN",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "measure",
        "type": "EQUALS"
      }
    ],
    "subParams": [
      {
        "type": "TEXT",
        "name": "amount",
        "displayName": "Amount (integer minor units, e.g. 2599 for $25.99)",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "currency",
        "displayName": "Currency (ISO 4217)",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "planId",
        "displayName": "plan_id (for plan_enrollment events)",
        "simpleValueType": true
      },
      {
        "type": "PARAM_TABLE",
        "name": "contents",
        "displayName": "Contents (for 'contents' data shape)",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "id",
              "displayName": "id",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "name",
              "displayName": "name",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "content_type",
              "displayName": "content_type",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "quantity",
              "displayName": "quantity",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "amount",
              "displayName": "amount",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "currency",
              "displayName": "currency",
              "simpleValueType": true
            },
            "isUnique": false
          }
        ]
      },
      {
        "type": "PARAM_TABLE",
        "name": "extraProps",
        "displayName": "Additional Event Properties",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "name",
              "displayName": "Property",
              "simpleValueType": true
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "TEXT",
              "name": "value",
              "displayName": "Value",
              "simpleValueType": true
            },
            "isUnique": false
          }
        ],
        "help": "Merged into eventProps. Use this for fields not covered above (e.g. on custom events)."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "eventOptions",
    "displayName": "Event Options",
    "groupStyle": "ZIPPY_CLOSED",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "measure",
        "type": "EQUALS"
      }
    ],
    "subParams": [
      {
        "type": "TEXT",
        "name": "eventId",
        "displayName": "event_id (for browser/server dedup)",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "customEventName",
        "displayName": "custom_event_name",
        "simpleValueType": true,
        "help": "Required when Event Type is Custom. Used by OpenAI for dedup matching alongside the standard event name.",
        "enablingConditions": [
          {
            "paramName": "eventName",
            "paramValue": "custom",
            "type": "EQUALS"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const createArgumentsQueue = require("createArgumentsQueue");
const injectScript = require("injectScript");
const makeNumber = require("makeNumber");
const makeInteger = require("makeInteger");
const Math = require("Math");
const getType = require("getType");
const logToConsole = require("logToConsole");

const SDK_URL = "https://bzrcdn.openai.com/sdk/oaiq.min.js";

const STANDARD_EVENTS = {
  page_viewed: "contents",
  contents_viewed: "contents",
  items_added: "contents",
  checkout_started: "contents",
  order_created: "contents",
  lead_created: "customer_action",
  registration_completed: "customer_action",
  appointment_scheduled: "customer_action",
  subscription_created: "plan_enrollment",
  trial_started: "plan_enrollment",
};

const oaiq = createArgumentsQueue("oaiq", "oaiq.q");

if (data.tagType === "init") {
  const initConfig = { pixelId: data.pixelId };
  if (data.debug) initConfig.debug = true;
  oaiq("init", initConfig);

  injectScript(SDK_URL, data.gtmOnSuccess, data.gtmOnFailure, "openai-pixel");
} else {
  const eventName = getEventName();
  const eventProps = buildEventProps(eventName);
  const eventOptions = buildEventOptions();

  if (eventOptions) {
    oaiq("measure", eventName, eventProps, eventOptions);
  } else {
    oaiq("measure", eventName, eventProps);
  }

  data.gtmOnSuccess();
}

/*==============================================================================
  Helpers
==============================================================================*/

function getEventName() {
  if (data.eventName === "standard") return data.eventNameStandard;
  return data.eventNameCustom || "custom";
}

function getDataType(eventName) {
  return STANDARD_EVENTS[eventName] || "custom";
}

function buildEventProps(eventName) {
  const props = { type: getDataType(eventName) };

  if (isPresent(data.amount)) props.amount = toAmount(data.amount);
  if (isPresent(data.currency)) props.currency = data.currency;
  if (isPresent(data.planId)) props.plan_id = data.planId;

  if (data.contents && data.contents.length) {
    props.contents = data.contents.map(buildContentItem).filter(hasKeys);
    if (props.contents.length === 0) props.contents = undefined;
  }

  if (data.extraProps && data.extraProps.length) {
    data.extraProps.forEach((row) => {
      if (row.name && isPresent(row.value)) props[row.name] = row.value;
    });
  }

  return stripEmpty(props);
}

function buildContentItem(row) {
  const item = {};
  if (isPresent(row.id)) item.id = row.id;
  if (isPresent(row.name)) item.name = row.name;
  if (isPresent(row.content_type)) item.content_type = row.content_type;
  else item.content_type = "product";
  if (isPresent(row.quantity)) item.quantity = makeInteger(row.quantity);
  if (isPresent(row.amount)) item.amount = toAmount(row.amount);
  if (isPresent(row.currency)) item.currency = row.currency;
  return item;
}

function buildEventOptions() {
  const opts = {};
  if (isPresent(data.eventId)) opts.event_id = data.eventId;
  if (data.eventName === "custom" && isPresent(data.customEventName)) {
    opts.custom_event_name = data.customEventName;
  }
  for (const k in opts) {
    if (opts.hasOwnProperty(k)) return opts;
  }
  return undefined;
}

// OpenAI expects integer minor-currency-unit values (2599 = $25.99).
// Convert decimals to cents.
function toAmount(v) {
  const n = makeNumber(v);
  if (n !== n) return 0;
  if (Math.floor(n) === n) return makeInteger(n);
  return makeInteger(Math.round(n * 100));
}

function isPresent(v) {
  const t = getType(v);
  return t !== "null" && t !== "undefined" && v !== "";
}

function hasKeys(obj) {
  for (const k in obj) {
    if (obj.hasOwnProperty(k)) return true;
  }
  return false;
}

function stripEmpty(obj) {
  const out = {};
  for (const k in obj) {
    if (obj.hasOwnProperty(k) && isPresent(obj[k])) out[k] = obj[k];
  }
  return out;
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "oaiq" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "oaiq.q" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": false }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://bzrcdn.openai.com/sdk/oaiq.min.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


