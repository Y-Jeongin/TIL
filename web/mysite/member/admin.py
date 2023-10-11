from django.contrib import admin
from member.models import Member

# Register your models here.
class MemberAdmin(admin.ModelAdmin):
    list_display = ('userid', 'userpw', 'username', 'phone')

admin.site.register(Member, MemberAdmin)