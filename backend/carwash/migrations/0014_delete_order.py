# Generated by Django 4.0.3 on 2022-09-16 18:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('carwash', '0013_remove_address_latitude_remove_address_longitude_and_more'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Order',
        ),
    ]
