# Generated by Django 5.1.4 on 2025-01-01 09:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('smswebportal', '0018_remove_outgoingsms_senttime'),
    ]

    operations = [
        migrations.AddField(
            model_name='outgoingsms',
            name='SENTTIME',
            field=models.DateTimeField(blank=True, max_length=100, null=True),
        ),
    ]
