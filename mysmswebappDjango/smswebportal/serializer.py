from rest_framework import serializers
from .models import Template 
from .models import SW_HR_V
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import OutgoingSMS

# class OutgoingSMSSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = OutgoingSMS
#         fields = ['sender_number', 'receiver_no', 'msg']

# class SendMessageSerializer(serializers.ModelSerializer):
#     def post(self, request, *args, **kwargs):
#         serializer = OutgoingSMSSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# class EmployeeSerializer(serializers.ModelSerializer):
#     branch = serializers.StringRelatedField()
#     class Meta:
#         model = Employee
        
#         fields = '__all__'
          
class TemplateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Template
        fields = '__all__'

class SWHRSerializer(serializers.ModelSerializer):
    class Meta:
        model = SW_HR_V
        fields = '__all__'

from django.contrib.auth.models import User
class UserSerializer(serializers.ModelSerializer):
    class Meta:
         model = User 
         fields = ('username', 'password')
    def create(self, validated_data):
             user = User.objects.create_user(**validated_data) 
             return user


class OutgoingSMSSerializer(serializers.ModelSerializer):
    class Meta:
        model = OutgoingSMS
        fields = [ 'MSG', 'RECEIVER', 'SENTTIME', 'STATUS']

