from django.db import models

# Create your models here.


class Battle(models.Model):
    def __str__(self):
        return self.battle_name + ' ' + self.real_location

    battle_id = models.CharField(max_length=20, primary_key=True)
    battle_name = models.CharField(max_length=500)
    starting_date = models.DateField()
    ending_date = models.DateField()
    description = models.TextField(null=True)
    result = models.CharField(max_length=300)
    total_strength = models.IntegerField()
    total_losses = models.IntegerField()
    real_location = models.CharField(max_length=500)
    coord_top = models.FloatField(null=True)
    coord_left = models.FloatField(null=True)
    size_width = models.FloatField(null=True)
    size_height = models.FloatField(null=True)


class Countries(models.Model):
    country_id = models.CharField(max_length=2, primary_key=True)
    country_name = models.CharField(max_length=50)
    shortened = models.CharField(max_length=50)

class BattlePhotos(models.Model):
    photo_id = models.CharField(max_length=200, primary_key=True)
    batle_code = models.ForeignKey(Battle, on_delete=models.CASCADE, null=True)
    description = models.CharField(max_length=500, null=True)
    used_as = models.CharField(max_length=50, null=True)
class CountriesCoords(models.Model):
    battle_year = models.IntegerField(primary_key=True)
    coordinates = models.TextField(null=True)

class People(models.Model):
    name_id = models.CharField(max_length=100, primary_key=True)
    name = models.TextField(null=True)
    shortened_name = models.TextField(null=True)
    country_code = models.ForeignKey(Countries, on_delete=models.CASCADE)
    achievements = models.TextField(null=True)
    fate = models.TextField(null=True)

class BattleParticipants(models.Model):
    battle_code = models.ForeignKey(Battle, on_delete=models.CASCADE)
    country_code = models.ForeignKey(Countries, on_delete=models.CASCADE)
    strength = models.IntegerField(null=True)
    casualties = models.IntegerField(null=True)
    commander_code = models.ForeignKey(People, on_delete=models.CASCADE, null=True)

class PeoplePhotos(models.Model):
    photo_id = models.CharField(max_length=200, primary_key=True)
    person_code = models.ForeignKey(People, on_delete=models.CASCADE, null=True)
    description = models.CharField(max_length=500, null=True)
    used_as = models.CharField(max_length=50, null=True)

class BattleTag(models.Model):
    battle_code = models.ForeignKey(Battle, on_delete=models.CASCADE)
    battle_year = models.IntegerField(null=True)
    location_left = models.FloatField(null=True)
    location_top = models.FloatField(null=True)
    in_a_group = models.CharField(max_length=1, null=True)
    description = models.CharField(max_length=500, null=True)

class BattleGroups(models.Model):
    group_code = models.IntegerField(primary_key=True)
    glocation_left = models.FloatField(null=True)
    glocation_top = models.FloatField(null=True)

class GroupedBattles(models.Model):
    group_id = models.ForeignKey(BattleGroups, on_delete=models.CASCADE)
    battle_tag = models.ForeignKey(BattleTag, on_delete=models.CASCADE)

class SuggestedLinks(models.Model):
    link = models.CharField(max_length=2000, primary_key=True)
    name = models.CharField(max_length=1000)
    domain = models.CharField(max_length=1000)
    language = models.CharField(max_length=100)
    description = models.CharField(max_length=3000)

class BannedIps(models.Model):
    ip_addr = models.CharField(max_length=40, primary_key=True)
    banned_on = models.DateField(null=True)

class Messages(models.Model):
    def __str__(self):
        return self.person_name + " " + self.person_email
    person_name = models.CharField(max_length=500)
    person_email = models.CharField(max_length=500)
    person_subject = models.CharField(max_length=500)
    person_description = models.TextField()
    person_ip_addr = models.CharField(max_length=40)