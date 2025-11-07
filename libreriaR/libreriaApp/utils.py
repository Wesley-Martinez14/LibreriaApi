import requests
import json
from django.conf import settings
from datetime import datetime

def enviar_webhook_n8n(payload):
    WEBHOOK_URL = getattr(settings, "N8N_WEBHOOK_URL", None)

    if not WEBHOOK_URL:
        print("ADVERTENCIA: N8N_WEBHOOK_URL no configurada en settings")
        return
    try:
        requests.post(
            WEBHOOK_URL,
            data=json.dumps(payload),
            headers={'Content-Type': 'application/json'},
            timeout=5
        )
    except requests.exceptions.RequestException as e:
        print(f"Error al enviar Webhook a n8n: {e}")