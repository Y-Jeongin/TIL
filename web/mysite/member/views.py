from django.shortcuts import render, redirect
from member.models import Member
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from django.contrib.auth import login as dlogin, logout as dlogout
from django.contrib import auth

# Create your views here.
def home(request):
    pass

def join(request):
    if request.method == "POST":
        form = Member(request.POST)
        # 입력값에 문제가 없다면(모든 유효성 검사 규칙을 통과했다면)

        # 새로운 사용자 객체를 생성
        new_user = User.objects.create_user(userid=request.POST['userid'], userpw=request.POST['userpw'])
        # 로그인 처리
        auth.login(request, new_user)
        # 시작 페이지로 이동
        return redirect('/member')

    else:  # post방식이 아닌 경우 회원가입 페이지로 이동
        form = Member()
        return render(request, 'member/join.html', {'form':form})

def login(request):
    pass

def logout(request):
    pass