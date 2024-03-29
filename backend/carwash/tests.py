from django.test import TestCase
from rest_framework import status

# Create your tests here.
from django.test import TestCase
from rest_framework.test import APITestCase
from rest_framework.reverse import reverse

class userProfileTestCase(APITestCase):
    profile_list_url=reverse('profile-list')
    def setUp(self):
        # create a new user making a post request to djoser endpoint
        self.user=self.client.post('/auth/users/',data={'username':'mario','password':'i-keep-jumping'})
        # obtain a json web token for the newly created user
        response=self.client.post('/auth/jwt/create/',data={'username':'mario','password':'i-keep-jumping'})

        self.token=response.data['access']
        self.api_authentication()
        profile_data={'description':'I am a very famous game character','location':'nintendo world','is_creator':'true',}



    def api_authentication(self):
        self.client.credentials(HTTP_AUTHORIZATION='JWT '+self.token)

    # retrieve a list of all user profiles while the request user is authenticated
    def test_userprofile_list_authenticated(self):
        response=self.client.get(self.profile_list_url)
        print(response.content)
        self.assertEqual(response.status_code,status.HTTP_301_MOVED_PERMANENTLY)

    # retrieve a list of all user profiles while the request user is unauthenticated
    def test_userprofile_list_unauthenticated(self):
        self.client.force_authenticate(user=None)
        response=self.client.get('self.profile_list_url')
        self.assertEqual(response.status_code,status.HTTP_404_NOT_FOUND)

    # check to retrieve the profile details of the authenticated user
    def test_userprofile_detail_retrieve(self):
        response=self.client.get('/api/profiles/1')
        self.assertEqual(response.status_code,status.HTTP_301_MOVED_PERMANENTLY)


    # populate the user profile that was automatically created using the signals
    def test_userprofile_profile(self):
        profile_data={'description':'I am a very famous game character','location':'nintendo world','is_creator':'true',}
        response=self.client.put('/api/profiles/1',data=profile_data)
        self.assertEqual(response.status_code,status.HTTP_301_MOVED_PERMANENTLY)

class userItemTestCase(APITestCase):
    item_list_url=reverse('item-list')
    def setUp(self):
        # create a new user making a post request to djoser endpoint
        self.user=self.client.post('/auth/users/',data={'username':'mario','password':'i-keep-jumping'})
        # obtain a json web token for the newly created user
        response=self.client.post('/auth/jwt/create/',data={'username':'mario','password':'i-keep-jumping'})
        self.token=response.data['access']
        self.api_authentication()

    def api_authentication(self):
        self.client.credentials(HTTP_AUTHORIZATION='JWT '+self.token)

    # retrieve a list of all user items while the request user is authenticated
    def test_useritem_list_authenticated(self):
        response=self.client.get(self.item_list_url)
        self.assertEqual(response.status_code,status.HTTP_200_OK)

    # retrieve a list of all user profiles while the request user is unauthenticated
    def test_useritem_list_unauthenticated(self):
        self.client.force_authenticate(user=None)
        response=self.client.get(self.item_list_url)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    # check to retrieve the profile details of the authenticated user
    def test_useritem_detail_retrieve(self):
        response=self.client.get(reverse('item-detail',kwargs={'pk':1}))
        self.assertEqual(response.status_code,status.HTTP_200_OK)


    # populate the user profile that was automatically created using the signals
    def test_useritem_profile(self):
        profile_data={'description':'I am a very famous game character','name':'nintendo world','user':'ziyad',}
        response=self.client.put(reverse('item-detail',kwargs={'pk':1}),data=profile_data)
        self.assertEqual(response.status_code,status.HTTP_301_MOVED_PERMANENTLY)


class userAddressTestCase(APITestCase):
    address_list_url=reverse('address-list')
    def setUp(self):
        # create a new user making a post request to djoser endpoint
        self.user=self.client.post('/auth/users/',data={'username':'mario','password':'i-keep-jumping'})
        # obtain a json web token for the newly created user
        response=self.client.post('/auth/jwt/create/',data={'username':'mario','password':'i-keep-jumping'})
        self.token=response.data['access']
        self.api_authentication()

    def api_authentication(self):
        self.client.credentials(HTTP_AUTHORIZATION='JWT '+self.token)

    # retrieve a list of all user items while the request user is authenticated
    def test_useraddress_list_authenticated(self):
        response=self.client.get(self.address_list_url)
        self.assertEqual(response.status_code,status.HTTP_200_OK)

    # retrieve a list of all user profiles while the request user is unauthenticated
    def test_useraddress_list_unauthenticated(self):
        self.client.force_authenticate(user=None)
        response=self.client.get(self.address_list_url)
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)

    # check to retrieve the profile details of the authenticated user
    def test_useraddress_detail_retrieve(self):
        response=self.client.get(reverse('address-detail',kwargs={'pk':1}))
        self.assertEqual(response.status_code,status.HTTP_200_OK)


    # populate the user profile that was automatically created using the signals
    def test_useraddress_profile(self):
        profile_data={'latitude':'292299','longitude':'122',}
        response=self.client.put(reverse('address-detail',kwargs={'pk':1}),data=profile_data)
        self.assertEqual(response.status_code,status.HTTP_200_OK)