# Generated by Django 2.0.2 on 2018-06-11 21:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('search', '0015_battletag_in_a_group'),
    ]

    operations = [
        migrations.AddField(
            model_name='battletag',
            name='description',
            field=models.CharField(max_length=500, null=True),
        ),
    ]
