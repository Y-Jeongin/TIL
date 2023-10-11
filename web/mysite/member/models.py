from django.db import models

# Create your models here.
class Member(models.Model):
    userid = models.CharField(primary_key=True, max_length=50, verbose_name="아이디")
    userpw = models.CharField(null=False, blank=False, max_length=50, verbose_name="비밀번호")
    username = models.CharField(null=False, blank=False, max_length=50, verbose_name="회원 이름")
    phone = models.CharField(null=True, max_length=50, verbose_name="회원 연락처")
