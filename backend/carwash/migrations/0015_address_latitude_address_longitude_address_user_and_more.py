# Generated by Django 4.0.3 on 2022-09-16 18:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('carwash', '0014_delete_order'),
    ]

    operations = [
        migrations.AddField(
            model_name='address',
            name='latitude',
            field=models.DecimalField(blank=True, decimal_places=2, default=0, max_digits=9999),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='address',
            name='longitude',
            field=models.DecimalField(blank=True, decimal_places=2, default=1, max_digits=9999),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='address',
            name='user',
            field=models.ForeignKey(default=2, on_delete=django.db.models.deletion.CASCADE, related_name='user_address', to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='item',
            name='both',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=9999, null=True),
        ),
        migrations.AddField(
            model_name='item',
            name='description',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='item',
            name='in_price',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=9999, null=True),
        ),
        migrations.AddField(
            model_name='item',
            name='name',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='item',
            name='out_price',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=9999, null=True),
        ),
        migrations.AddField(
            model_name='item',
            name='photo',
            field=models.ImageField(blank=True, upload_to='users/%Y/%m/%d/'),
        ),
        migrations.AddField(
            model_name='item',
            name='user',
            field=models.ForeignKey(default=3, on_delete=django.db.models.deletion.CASCADE, related_name='resturant_Item', to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='profile',
            name='Type',
            field=models.CharField(choices=[('1', 'CUSTOMER'), ('2', 'DRIVER'), ('3', 'SERVICE_PROVIDER')], default='1', max_length=2),
        ),
        migrations.AddField(
            model_name='profile',
            name='date_of_birth',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='profile',
            name='description',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='profile',
            name='phone',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='profile',
            name='photo',
            field=models.ImageField(blank=True, upload_to='users/%Y/%m/%d/'),
        ),
        migrations.AddField(
            model_name='profile',
            name='real_name',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='profile',
            name='user',
            field=models.OneToOneField(default=4, on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL),
            preserve_default=False,
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.TextField(blank=True)),
                ('driver', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='driver', to=settings.AUTH_USER_MODEL)),
                ('items', models.ManyToManyField(related_name='order_items', to='carwash.item')),
                ('service_provider', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='service_provider', to=settings.AUTH_USER_MODEL)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_Item', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='location',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('X', models.DecimalField(blank=True, decimal_places=2, max_digits=9999, null=True)),
                ('y', models.DecimalField(blank=True, decimal_places=2, max_digits=9999, null=True)),
                ('driver', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='driver_location', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
