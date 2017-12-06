# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Admin(models.Model):
    aid = models.IntegerField(db_column='AID', unique=True, blank=True, null=True)  # Field name made lowercase.
    grantorid = models.IntegerField(db_column='GrantorID', blank=True, null=True)  # Field name made lowercase.
    authdate = models.DateField(db_column='AuthDate', blank=True, null=True)  # Field name made lowercase.
    authtime = models.TextField(db_column='AuthTime', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Admin'


class Answers(models.Model):
    qid = models.IntegerField(db_column='QID', blank=True, null=True)  # Field name made lowercase.
    afid = models.IntegerField(db_column='AFID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Answers'
        unique_together = (('qid', 'afid'),)


class Ask(models.Model):
    sid = models.IntegerField(db_column='SID', blank=True, null=True)  # Field name made lowercase.
    qid = models.IntegerField(db_column='QID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Ask'
        unique_together = (('sid', 'qid'),)


class Authentication(models.Model):
    fid = models.IntegerField(db_column='FID', unique=True, blank=True, null=True)  # Field name made lowercase.
    aid = models.IntegerField(db_column='AID', blank=True, null=True)  # Field name made lowercase.
    authdate = models.DateField(db_column='AuthDate', blank=True, null=True)  # Field name made lowercase.
    authtime = models.TextField(db_column='AuthTime', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Authentication'


class Completescourse(models.Model):
    sid = models.IntegerField(db_column='SID', blank=True, null=True)  # Field name made lowercase.
    time = models.TextField(blank=True, null=True)  # This field type is a guess.
    date = models.DateField(blank=True, null=True)
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.
    comment = models.TextField(blank=True, null=True)  # This field type is a guess.
    rating = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'CompletesCourse'
        unique_together = (('sid', 'cid', 'comment'),)


class Completesmaterial(models.Model):
    sid = models.IntegerField(db_column='SID', blank=True, null=True)  # Field name made lowercase.
    time = models.TextField(blank=True, null=True)  # This field type is a guess.
    date = models.DateField(blank=True, null=True)
    mid = models.IntegerField(db_column='MID', blank=True, null=True)  # Field name made lowercase.
    ccid = models.IntegerField(db_column='CCID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'CompletesMaterial'
        unique_together = (('sid', 'mid', 'ccid'),)


class Contactinfo(models.Model):
    uid = models.IntegerField(db_column='UID', blank=True, null=True)  # Field name made lowercase.
    mobileno = models.CharField(db_column='MobileNo', max_length=10, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ContactInfo'
        unique_together = (('uid', 'mobileno'),)


class Course(models.Model):
    name = models.CharField(max_length=30, blank=True, null=True)
    icon = models.TextField(blank=True, null=True)  # This field type is a guess.
    cost = models.IntegerField(blank=True, null=True)
    id = models.IntegerField(db_column='ID', unique=True, blank=True, null=True)  # Field name made lowercase.
    creationdate = models.DateField(db_column='creationDate', blank=True, null=True)  # Field name made lowercase.
    creationtime = models.TextField(db_column='creationTime', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    description = models.TextField(blank=True, null=True)  # This field type is a guess.
    primarytopic = models.IntegerField(db_column='primaryTopic', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Course'


class Enroll(models.Model):
    sid = models.IntegerField(db_column='SID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Enroll'
        unique_together = (('sid', 'cid'),)


class Faculty(models.Model):
    fid = models.IntegerField(db_column='FID', unique=True, blank=True, null=True)  # Field name made lowercase.
    title = models.CharField(db_column='Title', max_length=30, blank=True, null=True)  # Field name made lowercase.
    affiliation = models.CharField(db_column='Affiliation', max_length=30, blank=True, null=True)  # Field name made lowercase.
    website = models.CharField(db_column='Website', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Faculty'


class File(models.Model):
    path = models.CharField(db_column='Path', max_length=128, blank=True, null=True)  # Field name made lowercase.
    size = models.IntegerField(db_column='Size', blank=True, null=True)  # Field name made lowercase.
    type = models.CharField(db_column='Type', max_length=10, blank=True, null=True)  # Field name made lowercase.
    fid = models.IntegerField(db_column='FID', blank=True, null=True)  # Field name made lowercase.
    fcid = models.IntegerField(db_column='FCID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'File'
        unique_together = (('fid', 'fcid'),)


class Isinterest(models.Model):
    sid = models.IntegerField(db_column='SID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'IsInterest'
        unique_together = (('sid', 'cid'),)


class Likesquestion(models.Model):
    sid = models.IntegerField(db_column='SID', blank=True, null=True)  # Field name made lowercase.
    qid = models.IntegerField(db_column='QID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'LikesQuestion'
        unique_together = (('sid', 'qid'),)


class Link(models.Model):
    url = models.CharField(max_length=128, blank=True, null=True)
    isvideo = models.NullBooleanField(db_column='IsVideo')  # Field name made lowercase.
    lid = models.IntegerField(db_column='LID', blank=True, null=True)  # Field name made lowercase.
    lcid = models.IntegerField(db_column='LCID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Link'
        unique_together = (('lid', 'lcid'),)


class Material(models.Model):
    name = models.CharField(db_column='Name', max_length=30, blank=True, null=True)  # Field name made lowercase.
    id = models.IntegerField(db_column='ID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Material'
        unique_together = (('id', 'cid'),)


class Payment(models.Model):
    sid = models.IntegerField(db_column='SID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.
    code = models.CharField(max_length=30, blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    time = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Payment'
        unique_together = (('sid', 'cid'),)


class Post(models.Model):
    text = models.TextField(db_column='Text', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    pid = models.IntegerField(db_column='PID', blank=True, null=True)  # Field name made lowercase.
    pcid = models.IntegerField(db_column='PCID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Post'
        unique_together = (('pid', 'pcid'),)


class Questions(models.Model):
    questiontext = models.TextField(db_column='QuestionText', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    id = models.IntegerField(db_column='ID', unique=True, blank=True, null=True)  # Field name made lowercase.
    isvisible = models.NullBooleanField(db_column='IsVisible')  # Field name made lowercase.
    answer = models.TextField(db_column='Answer', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Questions'


class Quiz(models.Model):
    mid = models.IntegerField(db_column='MID', blank=True, null=True)  # Field name made lowercase.
    qcid = models.IntegerField(db_column='QCID', blank=True, null=True)  # Field name made lowercase.
    p_score = models.IntegerField(db_column='P_Score', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Quiz'
        unique_together = (('mid', 'qcid'),)


class QuizAnswers(models.Model):
    mid = models.IntegerField(db_column='MID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.
    number = models.IntegerField(db_column='NUMBER', blank=True, null=True)  # Field name made lowercase.
    id = models.IntegerField(db_column='ID', blank=True, null=True)  # Field name made lowercase.
    a_text = models.TextField(db_column='A_Text', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    feedback = models.TextField(db_column='Feedback', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Quiz_Answers'
        unique_together = (('mid', 'cid', 'number', 'id'),)


class QuizQuestions(models.Model):
    mid = models.IntegerField(db_column='MID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.
    number = models.IntegerField(db_column='NUMBER', blank=True, null=True)  # Field name made lowercase.
    text = models.TextField(db_column='Text', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Quiz_Questions'
        unique_together = (('mid', 'cid', 'number'),)


class Relatetomaterial(models.Model):
    rmid = models.IntegerField(db_column='RMID', blank=True, null=True)  # Field name made lowercase.
    qid = models.IntegerField(db_column='QID', blank=True, null=True)  # Field name made lowercase.
    rcid = models.IntegerField(db_column='RCID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'RelateToMaterial'
        unique_together = (('rmid', 'qid', 'rcid'),)


class SecTopic(models.Model):
    tid = models.IntegerField(db_column='TID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Sec_Topic'
        unique_together = (('tid', 'cid'),)


class Teach(models.Model):
    fid = models.IntegerField(db_column='FID', blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', blank=True, null=True)  # Field name made lowercase.
    date = models.DateField(blank=True, null=True)
    time = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Teach'
        unique_together = (('fid', 'cid'),)


class Topic(models.Model):
    id = models.IntegerField(db_column='ID', unique=True, blank=True, null=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Topic'


class User(models.Model):
    id = models.TextField(db_column='ID', unique=True, blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    fname = models.CharField(db_column='FName', max_length=30, blank=True, null=True)  # Field name made lowercase.
    lname = models.CharField(db_column='LName', max_length=30, blank=True, null=True)  # Field name made lowercase.
    street = models.CharField(db_column='Street', max_length=30, blank=True, null=True)  # Field name made lowercase.
    city = models.CharField(db_column='City', max_length=30, blank=True, null=True)  # Field name made lowercase.
    pcode = models.CharField(db_column='PCode', max_length=30, blank=True, null=True)  # Field name made lowercase.
    country = models.CharField(db_column='Country', max_length=30, blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=50, blank=True, null=True)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=25, blank=True, null=True)  # Field name made lowercase.
    profilepicture = models.TextField(db_column='ProfilePicture', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'User'


class DjangoMigrations(models.Model):
    id = models.IntegerField(primary_key=True)  # AutoField?
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'
