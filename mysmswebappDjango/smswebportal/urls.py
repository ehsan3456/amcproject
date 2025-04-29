# sms_system/urls.py
from .views import TemplateListView
from .views import send_message
from django.urls import path
from django.http import HttpResponse
from . import views
from .views import login_view
from django.views.decorators.csrf import ensure_csrf_cookie
from django.views.generic import TemplateView
from .views import verify_token
from .views import auth_status_view
from .views import OutgoingSMSViewSet

urlpatterns = [
    path('login/', login_view, name='login'),
    # path('employees/', views.EmployeeListAPIView.as_view(), name='employee-list'),
    path('templates/', TemplateListView.as_view(), name='template-list'),
    path('SWHR/', views.SWHRListAPIView.as_view(),name = "SWHR_employees"),
    path('sendmessage/', views.send_message,name = "SendMessage"),
    # path('csrf/', ensure_csrf_cookie(lambda request: HttpResponse(''))),
    # path('csrf/', ensure_csrf_cookie, name='csrf'),
    path('csrf/', ensure_csrf_cookie(lambda request: HttpResponse('')), name='csrf'),
    path('get-contact-number/<str:staff_no>/', views.get_contact_number, name='get_contact_number'),
    path('verifytoken/', verify_token , name = 'login'),
    path("auth/status/", views.auth_status_view, name="auth_status"),
    path('analytics/messages-over-time/', views.messages_over_time, name='messages-over-time'),
    path('analytics/success-rate/', views.success_rate, name='success-rate'),
    path('analytics/location-message-count/', views.location_message_count, name='location_message_count'),
    path('outgoing-sms/', OutgoingSMSViewSet.as_view({'get': 'list'}), name="outgoingsms_employees")
]

