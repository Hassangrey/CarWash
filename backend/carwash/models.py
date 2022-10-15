from re import X
from django.db import models
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.

class Address(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             related_name='user_address',
                             on_delete=models.CASCADE)
    latitude = models.DecimalField(blank=True, decimal_places=2, max_digits=9999)
    longitude = models.DecimalField(blank=True,decimal_places=2, max_digits=9999)


class Item(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             related_name='resturant_Item',
                             on_delete=models.CASCADE)
    name = models.TextField(blank=True)
    description = models.TextField(blank=True)
    in_price = models.DecimalField(blank=True,decimal_places=2, max_digits=9999, null=True)
    out_price = models.DecimalField(blank=True,decimal_places=2, max_digits=9999, null=True)
    both = models.DecimalField(blank=True,decimal_places=2, max_digits=9999, null=True)
    photo = models.ImageField(upload_to='users/%Y/%m/%d/', blank=True)

class Order(models.Model):
    name = models.TextField(blank=True)
    items = models.ManyToManyField(Item,
                             related_name='order_items',
                             )
    user = models.ForeignKey(settings.AUTH_USER_MODEL,
                             related_name='user_Item',
                             on_delete=models.CASCADE)
    service_provider = models.ForeignKey(settings.AUTH_USER_MODEL,
                             related_name='service_provider',
                             on_delete=models.CASCADE)
    driver = models.ForeignKey(settings.AUTH_USER_MODEL,
                             related_name='driver',
                             on_delete=models.CASCADE,null=True)

class Profile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,  related_name='profile')
    date_of_birth = models.DateField(blank=True, null=True)
    photo = models.ImageField(upload_to='users/%Y/%m/%d/', blank=True)
    description = models.TextField(blank=True)

    real_name = models.TextField(null=True)
    phone = models.CharField(null=True, max_length=255)
    status = models.BooleanField(null=True, blank=True,default=True)
    CUSTOMER = '1'
    DRIVER = '2'
    SERVICE_PROVIDER = '3'
    types = (
    (CUSTOMER, 'CUSTOMER'),
    (DRIVER, 'DRIVER'),
    (SERVICE_PROVIDER, 'SERVICE_PROVIDER'),
)

    Type = models.CharField(
        max_length=2,
        choices=types,
        default=SERVICE_PROVIDER
    )
    def __str__(self):
        return f'Profile for user {self.user.username}'

class Location(models.Model):
    driver = models.ForeignKey(settings.AUTH_USER_MODEL,
                             related_name='driver_location',
                             on_delete=models.CASCADE)
    X = models.DecimalField(blank=True,decimal_places=2, max_digits=9999, null=True)
    y = models.DecimalField(blank=True,decimal_places=2, max_digits=9999, null=True)

@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

