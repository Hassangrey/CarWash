# Generated by Django 4.0.3 on 2022-04-02 17:04

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(blank=True)),
                ('price', models.DecimalField(blank=True, decimal_places=5, max_digits=9999)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_of_birth', models.DateField(blank=True, null=True)),
                ('real_name', models.TextField(null=True)),
                ('phone', models.CharField(max_length=255, null=True)),
                ('month', models.CharField(choices=[('1', 'CUSTOMER'), ('2', 'DRIVER'), ('3', 'SERVICE_PROVIDER')], default='1', max_length=2)),
                ('following', models.ManyToManyField(blank=True, related_name='followers', to=settings.AUTH_USER_MODEL)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(blank=True)),
                ('description', models.TextField(blank=True)),
                ('price', models.DecimalField(blank=True, decimal_places=5, max_digits=9999)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_Item', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('latitude', models.DecimalField(blank=True, decimal_places=5, max_digits=9999)),
                ('longitude', models.DecimalField(blank=True, decimal_places=5, max_digits=9999)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_address', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
