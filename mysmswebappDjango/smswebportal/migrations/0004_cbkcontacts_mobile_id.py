# Generated by Django 5.1.4 on 2024-12-10 08:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('smswebportal', '0003_cbknumbers_contactno_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='cbkcontacts',
            name='mobile_id',
            field=models.BigIntegerField(blank=True, null=True),
        ),
    ]
