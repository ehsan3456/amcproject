from django.db import migrations, models
import json

def clean_receiver_no_data(apps, schema_editor):
    OutgoingSMS = apps.get_model('smswebportal', 'OutgoingSMS')
    for sms in OutgoingSMS.objects.all():
        try:
            if isinstance(sms.receiver_no, dict):
                sms.receiver_no = json.dumps(sms.receiver_no)
                sms.save()
        except ValueError:
            pass  # Handle invalid JSON data

class Migration(migrations.Migration):

    dependencies = [
        ('smswebportal', '0006_remove_outgoingsms_group'),
    ]

    operations = [
        migrations.RunPython(clean_receiver_no_data),
    ]
