# Create your views here.
import json
import logging
from django.db.models import Count
from django.db.models import Q
from django.db import models
from django.db.models import Case
from django.db.models import When
from django.db.models import F
from django.db.models import Sum
from django.db.models.functions import TruncMonth
from django.contrib.auth.models import User
from django.middleware.csrf import get_token
from django.shortcuts import render, redirect
from rest_framework.permissions import IsAuthenticated
from django.contrib import messages
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import ensure_csrf_cookie
from django.contrib.auth import authenticate, login
from rest_framework.views import APIView
from rest_framework.response import Response 
from .models import SW_HR_V
from .models import Template
from django.views.decorators.csrf import csrf_exempt
from .models import CBKContacts
from  rest_framework import status 
from .models import CBKNumbers
from .models import OutgoingSMS
from django.views.decorators.http import require_http_methods
from .models import OutgoingSMS
from .serializer import  TemplateSerializer , SWHRSerializer , OutgoingSMSSerializer
from django.views.decorators.csrf import csrf_exempt



from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes

logger = logging.getLogger(__name__)

# from .serializers import TemplateSerializer

# class EmployeeListAPIView(APIView):
#     def get(self, request):
#         employees = Employee.objects.all()
#         serializer = EmployeeSerializer(employees, many=True)
#         return Response(serializer.data)

class TemplateListView(APIView):
    def get(self, request):
        templates = Template.objects.all()
        serializer = TemplateSerializer(templates, many=True)
        return Response(serializer.data)
    
class SWHRListAPIView(APIView):
    def get(self, request): 
        SWHRV = SW_HR_V.objects.all()
        serializer = SWHRSerializer(SWHRV, many = True)
        return Response(serializer.data)

# class SendMessageAPIView(APIView):
#         def post(self, request):
#             try:
#                 # Step 1: Get data from the request
#                 message = request.data.get('message')
#                 staff_numbers = request.data.get('staff_numbers', [])  # List of staff_no

#                 if not message or not staff_numbers:
#                     return Response(
#                         {"error": "Message and staff numbers are required."},
#                         status=status.HTTP_400_BAD_REQUEST
#                     )

#                 # Step 2: Fetch contacts for the given staff numbers
#                 contacts = CBKContacts.objects.filter(staff_no__in=staff_numbers)

#                 if not contacts.exists():
#                     return Response(
#                         {"error": "No contacts found for the selected employees."},
#                         status=status.HTTP_404_NOT_FOUND
#                     )

#                 # Step 3: Fetch mobile numbers using `mobile_id` from the contacts
#                 mobile_ids = contacts.values_list('mobile_id', flat=True)
#                 numbers = CBKNumbers.objects.filter(contact_no_id__in=mobile_ids, status='1')

#                 if not numbers.exists():
#                     return Response(
#                         {"error": "No active mobile numbers found."},
#                         status=status.HTTP_404_NOT_FOUND
#                     )

#                 # Step 4: Create entries in the OutgoingSMS table using the serializer
#                 sms_entries = []
#                 for number in numbers:
#                     sms_entry_data = {
#                         'sender_number': 'System',  # Example sender
#                         'receiver_no': number.contact_no,  # Receiver's number
#                         'msg': message,  # The actual message
#                         'status': 'Pending',  # Default status
#                     }
#                     serializer = OutgoingSMSSerializer(data=sms_entry_data)
                    
#                     if serializer.is_valid():
#                         sms_entries.append(serializer.validated_data)
#                     else:
#                         return Response(
#                             {"error": f"Invalid data for number {number.contact_no}."},
#                             status=status.HTTP_400_BAD_REQUEST
#                         )

#                 # Step 5: Save the valid entries into the database
#                 OutgoingSMS.objects.bulk_create([OutgoingSMS(**entry) for entry in sms_entries])

#                 # Step 6: Respond with success
#                 return Response(
#                     {"success": f"Messages sent to {len(sms_entries)} employees."},
#                     status=status.HTTP_201_CREATED
#                 )

#             except Exception as e:
#                 return Response(
#                     {"error": f"An error occurred: {str(e)}"},
#                     status=status.HTTP_500_INTERNAL_SERVER_ERROR
#                 )
# @api_view(['POST'])
@ensure_csrf_cookie
def csrf(request):
    if request.method == "GET":
        token = get_token(request)  # Generate and retrieve CSRF token
        return JsonResponse({'csrfToken': token})  # Respond with the token
    else:
        return JsonResponse({'error': 'Method not allowed.'}, status=405)  

# @permission_classes([IsAuthenticated])
# def send_message(request):
#     if request.method == "POST":
#         message = request.POST.get('message')
#         staff_numbers = request.POST.getlist('staff_numbers')

#         if not message or not staff_numbers:
#             return JsonResponse({"error": "Message and staff numbers are required."}, status=400)

#         contacts = CBKContacts.objects.filter(staff_no__in=staff_numbers)
#         if not contacts.exists():
#             return JsonResponse({"error": "No contacts found for the selected employees."}, status=404)

#         mobile_ids = contacts.values_list('mobile_id', flat=True)
#         numbers = CBKNumbers.objects.filter(contact_no_id__in=mobile_ids, status='1')

#         if not numbers.exists():
#             return JsonResponse({"error": "No active mobile numbers found."}, status=404)

#         sms_entries = [
#             OutgoingSMS(sender_number="System", receiver_no=number.contact_no, msg=message, status="Pending")
#             for number in numbers
#         ]
#         OutgoingSMS.objects.bulk_create(sms_entries)

#         return JsonResponse({"success": f"Messages saved for {len(sms_entries)} employees."}, status=201)

#     return JsonResponse({"error": "Invalid request method."}, status=405)
# @csrf_exempt

# @require_http_methods(["POST"])
# @api_view(['POST'])





@permission_classes([IsAuthenticated])
def get_contact_number(request, staff_no):
    try:
        # Fetch the employee using staff_no
        employee = SW_HR_V.objects.get(staff_no=staff_no)

        # Get the contact using the related table CBKContacts
        contact = CBKContacts.objects.get(staff_no=employee)

        # Get the mobile number from the mobile_temp field
        mobile_number = contact.mobile_temp

        if not mobile_number:
            return JsonResponse({"error": "Mobile number not found"}, status=404)

        # Return the mobile number in a JSON response
        return JsonResponse({"contactNumber": mobile_number}, status=200)

    except SW_HR_V.DoesNotExist:
        return JsonResponse({"error": "Employee not found"}, status=404)
    
    except CBKContacts.DoesNotExist:
        return JsonResponse({"error": "Contact details not found"}, status=404)
    
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def send_message(request):
    # Validate and process the request data
    message_content = request.data.get('message')
    contact_numbers = request.data.get('contactNumbers')  # Renamed to match frontend

    if not message_content or not contact_numbers:
        return Response({'error': 'Message content and contact numbers are required.'}, status=status.HTTP_400_BAD_REQUEST)

    # Save the outgoing message to the database
    messages = []
    for number in contact_numbers:
        # Create OutgoingSMS with the correct contact number
        messages.append(OutgoingSMS(MSG=message_content, RECEIVER=number,STATUS = 'send'))
    OutgoingSMS.objects.bulk_create(messages)

    return Response({'success': 'Messages sent successfully!'}, status=status.HTTP_201_CREATED)

# from django.views.decorators.csrf import csrf_exempt
from rest_framework.authtoken.models import Token
# from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_protect


# @csrf_exempt
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
@api_view(['POST'])
@permission_classes([AllowAny])
def login_view(request):
    username = request.data.get('username')
    password = request.data.get('password')

    user = authenticate(username=username, password=password)

    if user:
        token, _ = Token.objects.get_or_create(user=user)
        return Response({
            'success': True,
            'token': token.key,
            'user': {'username': user.username}
        })
    else:
        return Response({
            'success': False,
            'message': 'Invalid credentials'
        }, status=status.HTTP_401_UNAUTHORIZED)
from rest_framework.authentication import TokenAuthentication
from rest_framework.exceptions import AuthenticationFailed
def verify_token(request):
    # Retrieve Authorization header
    auth_header = request.headers.get("Authorization")

    if not auth_header:
        return JsonResponse({"error": "Authorization header missing"}, status=400)

    # Ensure the header is correctly formatted
    try:
        token = auth_header.split()[1]  # Extract the token part
    except IndexError:
        return JsonResponse({"error": "Invalid Authorization header format"}, status=400)

    # Initialize TokenAuthentication
    auth = TokenAuthentication()

    # Validate the token
    try:
        user, token_obj = auth.authenticate_credentials(token.encode("utf-8"))
        return JsonResponse({"message": f"Valid token for user: {user.username}"})
    except AuthenticationFailed:
        return JsonResponse({"error": "Invalid or expired token"}, status=401)
    except Exception as e:
        # Catch other unexpected exceptions
        return JsonResponse({"error": str(e)}, status=500)
from rest_framework.permissions import IsAuthenticated
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def auth_status_view(request):
    try:
        return Response({
            'isAuthenticated': True,
            'user': {
                'username': request.user.username,
            }
        })
    except Exception as e:
        logger.error(f"Error in auth_status_view: {str(e)}")
        return Response({'error': 'An unexpected error occurred'}, status=500)
    
from rest_framework import viewsets, permissions
class EmployeeViewSet(viewsets.ModelViewSet):
    serializer_class = SWHRSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Filter employees based on the logged-in user
        return SW_HR_V.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

from datetime import datetime, timedelta
@api_view(['GET'])
def messages_over_time(request):
    end_date = datetime.now()
    start_date = end_date - timedelta(days=180)  # Last 6 months

    messages = OutgoingSMS.objects.filter(
        SENTTIME__range=(start_date, end_date)
    ).annotate(
        month=TruncMonth('SENTTIME')
    ).values('month').annotate(
        count=Count('id')
    ).order_by('month')

    data = [
        {
            "name": msg['month'].strftime("%b"),
            "messages": msg['count']
        } for msg in messages
    ]
    return Response(data)


@api_view(['GET'])
def success_rate(request):
    total = OutgoingSMS.objects.count()
    sent = OutgoingSMS.objects.filter(STATUS='sent').count()
    failed = total - sent
    data = {"sent": sent, "failed": failed}
    return Response(data)

# @api_view(['GET'])
# def employee_engagement(request):
#     engagement = SW_HR_V.objects.annotate(
#         messages_sent=Count('outgoingsms')
#     ).values('staff_name', 'messages_sent').order_by('-messages_sent')[:5]
    
#     data = [
#         {
#             "name": emp['staff_name'],
#             "value": emp['messages_sent']
#         } for emp in engagement
#     ]
#     return Response(data)


@api_view(['GET'])
def location_message_count(request):
    # First, get the count of messages for each receiver_no
    message_counts = OutgoingSMS.objects.values('RECEIVER').annotate(
        messages_sent=Count('id')
    )

    # Create a dictionary to store message counts by receiver_no
    message_count_dict = {item['RECEIVER']: item['messages_sent'] for item in message_counts}

    # Get all CBKContacts with their related SW_HR_V data
    contacts = CBKContacts.objects.select_related('staff_no').all()

    # Create a dictionary to store message counts by location_code
    location_counts = {}

    for contact in contacts:
        location_code = contact.staff_no.location_code
        mobile_count = message_count_dict.get(contact.mobile_temp, 0)
        office_count = message_count_dict.get(contact.off_dir_temp, 0)
        total_count = mobile_count + office_count

        if total_count > 0:
            if location_code in location_counts:
                location_counts[location_code] += total_count
            else:
                location_counts[location_code] = total_count

    # Sort the locations by message count and get the top 5
    top_locations = sorted(location_counts.items(), key=lambda x: x[1], reverse=True)[:5]

    # Format the data for the API response
    data = [
        {
            "name": location,
            "value": count
        } for location, count in top_locations
    ]

    return Response(data)

# class OutgoingSMSViewSet(viewsets.ModelViewSet):
#     queryset = OutgoingSMS.objects.all().order_by('-sent_at')
#     permission_classes = [permissions.IsAuthenticated]

#     serializer_class = OutgoingSMSSerializer


class OutgoingSMSViewSet(viewsets.ModelViewSet):
    queryset = OutgoingSMS.objects.all().order_by('-SENTTIME')
    serializer_class = OutgoingSMSSerializer

    def list(self, request, *args, **kwargs):
        # Ensure we're returning a queryset
        queryset = self.filter_queryset(self.get_queryset())
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

