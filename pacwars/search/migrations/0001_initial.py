# Generated by Django 2.0.2 on 2018-04-04 22:39

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Battle',
            fields=[
                ('battle_id', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('battle_name', models.CharField(max_length=500)),
                ('starting_date', models.DateField()),
                ('ending_date', models.DateField()),
                ('description', models.TextField(null=True)),
                ('result', models.CharField(max_length=300)),
                ('total_strength', models.IntegerField()),
                ('total_losses', models.IntegerField()),
                ('real_location', models.CharField(max_length=500)),
                ('coord_top', models.FloatField(null=True)),
                ('coord_left', models.FloatField(null=True)),
                ('size_width', models.FloatField(null=True)),
                ('size_height', models.FloatField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Countries',
            fields=[
                ('country_id', models.CharField(max_length=2, primary_key=True, serialize=False)),
                ('country_name', models.CharField(max_length=50)),
                ('shortened', models.CharField(max_length=50)),
            ],
        ),
    ]
