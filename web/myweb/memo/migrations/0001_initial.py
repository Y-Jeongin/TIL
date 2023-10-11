# Generated by Django 4.2.5 on 2023-09-19 02:01

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Memo",
            fields=[
                ("idx", models.AutoField(primary_key=True, serialize=False)),
                ("writer", models.TextField()),
                ("memo", models.TextField()),
                (
                    "post_date",
                    models.DateTimeField(blank=True, default=datetime.datetime.now),
                ),
            ],
        ),
    ]
