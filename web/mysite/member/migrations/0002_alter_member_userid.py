# Generated by Django 4.2.5 on 2023-09-21 03:39

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("member", "0001_initial"),
    ]

    operations = [
        migrations.AlterField(
            model_name="member",
            name="userid",
            field=models.CharField(
                max_length=50, primary_key=True, serialize=False, verbose_name="아이디"
            ),
        ),
    ]
