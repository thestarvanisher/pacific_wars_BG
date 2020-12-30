from django.shortcuts import render
from django.http import HttpResponse
from search.models import Battle, BattlePhotos, BattleParticipants, Countries, SuggestedLinks, People, PeoplePhotos
from django.http import HttpResponse
# Create your views here.

def info(request):

    return HttpResponse("Тази страница съществува, но няма нищо на нея. За да видете информация за някоя битка, моля посетете /info/b/<код на битката>/. За да видите информация за личност, моля посетете /info/p/<код на личността>/. За удобство, можете да използвате /search/. ")
def getinfo(request, battleid):
    #print("battleid: ", battleid)
    btl = Battle.objects.get(battle_id=battleid)
    #print("battle: ", btl)
    try:
        photo = BattlePhotos.objects.get(batle_code_id=battleid, used_as = 'thumbnail')
    except Exception:
        photo = BattlePhotos.objects.get(used_as = 'default')

    countries = Countries.objects.filter(battleparticipants__battle_code = btl.battle_id).distinct();
    #print("countries: ", countries)

    return render(request, 'info/info.html', {'battle': btl, 'photo': photo, "countries": countries})

def getperson(request, personid):

    person = People.objects.get(name_id=personid)
    try:
        photo = PeoplePhotos.objects.get(person_code_id=personid, used_as = 'thumbnail')
    except Exception:
        photo = PeoplePhotos.objects.get(used_as = 'default')

    cntr = Countries.objects.get(country_id=person.country_code_id)

    return render(request, 'info/person.html', {'person': person, 'photo': photo, 'country': cntr})




