# Generated by Django 2.0.2 on 2018-06-06 20:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('search', '0008_people'),
    ]

    operations = [
        migrations.AlterField(
            model_name='battleparticipants',
            name='commander_code',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='search.People'),
        ),
    ]