from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, JsonResponse

from search.models import Battle, Countries, BattleParticipants, BattlePhotos, CountriesCoords, BattleTag, BattleGroups, GroupedBattles
from django.template import loader
from django.http import Http404
from django.views.decorators.cache import never_cache
from django.db.models import Q
from functools import *
import operator
# Create your views here.



def map(request):
    nyear = 2018

    obj = CountriesCoords.objects.get(battle_year=nyear).coordinates
    obj = str(obj)

    battles = BattleTag.objects.filter(in_a_group='0')
    ##print"THE values are: ", )
    group_values = BattleGroups.objects.values_list('group_code').distinct()
    grouped = []
    #print"The Values are: ", group_values)
    for q in group_values:
        #print"Value:", q[0])
        left = BattleGroups.objects.get(group_code=q[0]).glocation_left
        top = BattleGroups.objects.get(group_code=q[0]).glocation_top

        gr = BattleTag.objects.filter(groupedbattles__group_id=q[0])
        #print"LEN: ", len(gr))
        grouped.append((gr, left, top, len(gr)))

    return render(request, 'map/map.html', {'map': obj, 'battles': battles, 'groups': grouped})
def mapupdate(request):
    nyear = request.GET.get('year', None)
    obj = CountriesCoords.objects.get(battle_year=nyear).coordinates
    #print"my obj: ", obj)

    data ={'year': obj}

    return JsonResponse(data)
