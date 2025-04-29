from django.db import models

# Create your models here.
from django.db import models
from django.core.validators import RegexValidator

# Validator for the mobile number
mobile_number_validator = RegexValidator(r'^\d{11}$', 'Enter a valid mobile number (11 digits).')


class Branch(models.Model):
    branch_name = models.CharField(max_length=100, unique=True)

    class Meta:
        verbose_name = "Branch"
        verbose_name_plural = "Branches"

    def __str__(self):
        return self.branch_name


class Group(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.name


class Template(models.Model):
    template_name = models.CharField(max_length=100)
    template_content = models.TextField()

    def __str__(self):
        return self.template_name


# class Employee(models.Model):
#     id_no = models.CharField(max_length=20, unique=True)
#     name = models.CharField(max_length=100)
#     designation = models.CharField(max_length=50)
#     job_detail = models.CharField(max_length=50, blank=True, null=True)
#     contact_number = models.CharField(
#         max_length=20,
#         blank=True,
#         null=True,
#         validators=[mobile_number_validator]
#     )
#     branch = models.ForeignKey(Branch, on_delete=models.CASCADE)
#     groups = models.ManyToManyField(Group, blank=True)

#     def __str__(self):
#         return self.name


# class OutgoingSMS(models.Model):
#     msg = models.TextField()
#     receiver_no = models.CharField(max_length=255)
#     sent_at = models.DateTimeField(auto_now_add=True)  # Add a timestamp field
#     status = models.CharField(max_length=20, choices=[('sent', 'Sent'), ('failed', 'Failed'), ('pending', 'Pending')],default='pending')
class OutgoingSMS(models.Model):
        SENDER = models.CharField(max_length=30, blank=True, null=True)
        RECEIVER = models.CharField(max_length=30, blank=True, null=True)
        MSG = models.CharField(max_length=500, blank=True, null=True)
        SENTTIME = models.DateTimeField(max_length=100,auto_now_add=True, blank=True, null=True)
        RECEIVEDTIME = models.CharField(max_length=100, blank=True, null=True)
        OPERATOR = models.CharField(max_length=120, blank=True, null=True)
        MSGTYPE = models.CharField(max_length=160, blank=True, null=True)
        REFERENCE = models.CharField(max_length=100, blank=True, null=True)
        STATUS = models.CharField(max_length=20, choices=[('sent', 'Sent'), ('failed', 'Failed'), ('pending', 'Pending')],default='pending')        
        ERRORMSG = models.CharField(max_length=250, blank=True, null=True)
        STAT = models.CharField(max_length=20, blank=True, null=True)

        class Meta:
            db_table = 'OZEKIMESSAGEOUT'

        def __str__(self):
            return f"SMS to {self.RECEIVER}: {self.STATUS}"

    
    # group = models.ForeignKey(Group, on_delete=models.CASCADE)

        # return f"Message to {self.receiver_no}- Status: {self.status}"
    
    # class Meta:
    #     verbose_name = "Outgoing SMS"
    #     verbose_name_plural = "Outgoing SMS"

    # def __str__(self):


# class History(models.Model):
#     SW_HR_V = models.ForeignKey(SW_HR_V, on_delete=models.CASCADE)
#     message_content = models.TextField()
#     sent_date = models.DateTimeField(auto_now_add=True)

#     class Meta:
#         ordering = ['-sent_date'] 

#     def __str__(self):
#         return f"Message to {self.employee.name} on {self.sent_date}"


class CBKNumbers(models.Model):
    contact_no = models.CharField(max_length=100)
    contact_type = models.CharField(max_length=20, null=True, blank=True)
    status = models.CharField(max_length=1, default='1')
    credate = models.DateTimeField(auto_now_add=True)
    contact_type_id = models.IntegerField(null=True, blank=True)
    contactno_id = models.BigIntegerField(null=True , blank=True)
    del_status = models.CharField(max_length=1, default='0')
    category = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'CBK_NUMBERS'
        verbose_name = "CBK Number"
        verbose_name_plural = "CBK Numbers"

    def __str__(self):
        return self.contact_no


class SW_HR_V(models.Model):
    staff_no = models.CharField(max_length=90, unique=True)
    staff_name = models.CharField(max_length=150)
    job_desc = models.TextField()
    organization_desc = models.CharField(max_length=450)
    location_code = models.CharField(max_length=180)
    grade_desc = models.CharField(max_length=180)
    group_name = models.CharField(max_length=720)
    nlc_type = models.CharField(max_length=450)
    emp_type = models.CharField(max_length=33)

    class Meta:
        db_table = 'SW_HR_V'
        verbose_name = "SW HR V"
        verbose_name_plural = "SW HR V"

    def __str__(self):
        return self.staff_name


class CBKContacts(models.Model):
    contact_id = models.IntegerField(primary_key=True)
    credate = models.DateTimeField(auto_now_add=True)
    staff_no = models.OneToOneField(
       SW_HR_V, on_delete=models.CASCADE,
        unique=True,
        to_field='staff_no',
        db_column='staff_no'
    )
    email = models.CharField(max_length=200, null=True, blank=True)
    fax = models.CharField(max_length=20, null=True, blank=True)
    status = models.CharField(max_length=1, default='1')
    empstatus = models.CharField(max_length=200, null=True, blank=True)
    off_dir_id = models.BigIntegerField(null=True, blank=True)
    off_ext_id = models.BigIntegerField(null=True, blank=True)
    mobile_id = models.BigIntegerField(null=True, blank=True)
    pascomm_id = models.BigIntegerField(null=True, blank=True)
    defcomm_id = models.BigIntegerField(null=True, blank=True)
    margala_id = models.BigIntegerField(null=True, blank=True)
    confidential = models.BigIntegerField(default=0)
    dashboard = models.BigIntegerField(default=0)
    empstatus_id = models.BigIntegerField(null=True, blank=True)
    curr_desg = models.CharField(max_length=200, null=True, blank=True)
    curr_grade_id = models.BigIntegerField(default=0)
    category = models.BigIntegerField(default=0)
    descr = models.TextField(null=True, blank=True)
    contact_addr = models.CharField(max_length=500, null=True, blank=True)
    curr_sbu_id = models.BigIntegerField(default=0)
    curr_dept_id = models.BigIntegerField(default=0)
    curr_sec_id = models.BigIntegerField(default=0)
    title = models.CharField(max_length=200, null=True, blank=True)
    off_dir_temp = models.CharField(max_length=20, null=True, blank=True)
    mobile_temp = models.CharField(max_length=20, null=True, blank=True)

    class Meta:
        db_table = 'CBK_CONTACTS'
        verbose_name = "CBK Contact"
        verbose_name_plural = "CBK Contacts"

    def __str__(self):
        return f"Contact ID: {self.contact_id} - Email: {self.email or 'N/A'}"
