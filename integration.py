integration_json={
  "data": {
    "date": {
      "created_at": "2025-02-19",
      "updated_at": "2025-02-19"
    },
    "descriptions": {
      "app_description": "A brief description of the application functionality.",
      "app_logo": "https://search.brave.com/images?q=location+free+lcons&source=web",
      "app_name": "Local event Notifier.",
      "app_url": "URL to the application or service.", 
      "background_color": "#HEXCODE"
    },
    "integration_category": "Social Media Management",
    "integration_type": "interval",
    "is_active": True,
    "output": [
      {
        "label": "output_channel_1",
        "value": True
      },
      {
        "label": "output_channel_2",
        "value": False
      }
    ],
    "key_features": [
      "Fetches events based on city, and category.",
      "Sends events to Telex.",
      "Notifys users of events.",
      "post events at intervals."
    ],
    "permissions": {
      "monitoring_user": {
        "always_online": True,
        "display_name": "Performance Monitor"
      }
    },
    "settings": [
      {
        "label": "interval",
        "type": "text",
        "required": True,
        "default": "* * * * *"
      },
      {
        "label": "location",
        "type": "text",
        "required": True,
        "default": "Yes"
      },
      {
        "label": "limit",
        "type": "text",
        "required": True,
        "default": "Yes"
      },
  
      {
        "label": "category",
        "type": "dropdown",
        "required": True,
        "default": "Low",
        "options": ["High", "Low"]
      }
 
    ],
    "tick_url": "URL for subscribing to Telex's clock.",
    "target_url": "https://ping.telex.im/v1/webhooks/01951fa7-6d0e-753d-ba67-e9ea376bcce4"
  }
}