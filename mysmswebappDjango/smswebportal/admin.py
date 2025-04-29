# from django.contrib import admin

# # Register your models here.
# # Register your models here.
# from django.contrib import admin
# from .models import Branch,  Group, Template, OutgoingSMS , CBKNumbers, CBKContacts ,  SW_HR_V

# admin.site.register(Branch)
# admin.site.register(Group)
# admin.site.register(Template)
# admin.site.register(OutgoingSMS)
# admin.site.register(CBKNumbers)
# admin.site.register(CBKContacts)
# admin.site.register(SW_HR_V)

# @admin.register(Employee)
# class EmployeeAdmin(admin.ModelAdmin):
#     list_display = ('name', 'department', 'email', 'user')
#     list_filter = ('department', 'user')
#     search_fields = ('name', 'email', 'department')
#     raw_id_fields = ('user',)

#     def get_queryset(self, request):
#         qs = super().get_queryset(request)
#         if request.user.is_superuser:
#             return qs
#         return qs.filter(user=request.user)

#     def formfield_for_foreignkey(self, db_field, request, **kwargs):
#         if db_field.name == "user" and not request.user.is_superuser:
#             kwargs["queryset"] = User.objects.filter(id=request.user.id)
#         return super().formfield_for_foreignkey(db_field, request, **kwargs)

#     def save_model(self, request, obj, form, change):
#         if not obj.pk and not request.user.is_superuser:
#             obj.user = request.user
#         super().save_model(request, obj, form, change)


from django.contrib import admin
from django.contrib.auth.models import User
from .models import Branch, Group, Template, OutgoingSMS, CBKNumbers, CBKContacts, SW_HR_V

@admin.register(SW_HR_V)
class SW_HR_V_Admin(admin.ModelAdmin):
    list_display = ('staff_no', 'staff_name', 'job_desc', 'organization_desc', 'location_code')
    list_filter = ('emp_type', 'nlc_type', 'grade_desc')
    search_fields = ('staff_no', 'staff_name', 'job_desc', 'organization_desc')

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        # If you want to filter based on a specific field, you'll need to adjust this.
        # For now, we'll return all records for non-superusers
        return qs
# Register other models
admin.site.register(Branch)
admin.site.register(Group)
admin.site.register(Template)
admin.site.register(OutgoingSMS)
admin.site.register(CBKNumbers)
admin.site.register(CBKContacts)

# Remove the previous registration of SW_HR_V
# admin.site.register(SW_HR_V)

