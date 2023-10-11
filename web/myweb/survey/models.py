from django.db import models


# 설문 문제 table
class Survey(models.Model):
    survey_idx = models.AutoField(primary_key=True)

    # 문제
    question = models.TextField(null=False)

    # 답 문항1~4
    ans1 = models.TextField(null=True)
    ans2 = models.TextField(null=True)
    ans3 = models.TextField(null=True)
    ans4 = models.TextField(null=True)

    # 설문 진행 상태(y=진행중, n=종료)
    status = models.CharField(max_length=1, default='y')


# 응답할 내용을 저장할 table
class Answer(models.Model):
    # 응답 식별값
    answer_idx = models.AutoField(primary_key=True)

    # 설문 식별값, 외래키(foreign key)
    survey_idx = models.IntegerField()

    # 응답 번호 값
    num = models.IntegerField()