# Generated by Django 2.0.2 on 2018-04-13 21:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('search', '0004_battlephotos_used_as'),
    ]

    operations = [
        migrations.AlterField(
            model_name='battlephotos',
            name='batle_code',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='search.Battle'),
        ),
    ]
