# Generated by Django 2.0.2 on 2018-04-05 16:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('search', '0003_battlephotos'),
    ]

    operations = [
        migrations.AddField(
            model_name='battlephotos',
            name='used_as',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
