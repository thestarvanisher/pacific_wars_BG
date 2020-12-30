from django.contrib import admin
from .models import Battle, BattleGroups, BattleTag, BattleParticipants, BattlePhotos, GroupedBattles, Countries, CountriesCoords, People, PeoplePhotos, SuggestedLinks, BannedIps, Messages

admin.site.register(Battle)
admin.site.register(BattleGroups)
admin.site.register(BattleTag)
admin.site.register(BattleParticipants)
admin.site.register(BattlePhotos)
admin.site.register(GroupedBattles)
admin.site.register(Countries)
admin.site.register(CountriesCoords)
admin.site.register(People)
admin.site.register(PeoplePhotos)
admin.site.register(SuggestedLinks)
admin.site.register(BannedIps)
admin.site.register(Messages)
# Register your models here.
