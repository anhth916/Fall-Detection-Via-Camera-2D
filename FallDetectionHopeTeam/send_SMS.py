import os
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
# and set the environment variables. See http://twil.io/secure

client = Client("AC5ac402e636402e657572ba8e54df5bd8", "2d9905b9f26f553af07c9c8c850c7e0d")

message = client.messages \
    .create(
         body='maybe have human fall in your house, please check video in website',
         from_='+13396746852',
         to='+84975796998'
     )

print(message.sid)