# Generated by Django 4.0.3 on 2022-04-02 17:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('carwash', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profile',
            old_name='month',
            new_name='Type',
        ),
    ]
