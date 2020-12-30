from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Battle, Countries, BattleParticipants, BattlePhotos, People, PeoplePhotos
from django.template import loader
from django.http import Http404
from django.views.decorators.cache import never_cache
from django.db.models import Q
from functools import *
import operator
# Create your views here.


field_corr = {'Битка': 'battle_name__icontains', 'Място на битка': 'real_location__icontains', 'Държава': 'battleparticipants__country_code__country_name__icontains', 'Име на човек': 'battleparticipants__commander_code__name__icontains', 'Орден': 'battleparticipants__commander_code__achievements__icontains'}
people_corr = {'Име на човек': 'name__icontains', 'Орден': 'achievements__icontains', 'Битка': 'battleparticipants__battle_code__battle_name__icontains', 'Държава': 'battleparticipants__country_code__country_name__icontains', 'Място на битка': 'battleparticipants__battle_code__real_location__icontains'}
sort_fields = {'name': 'battle_name', 'begdate': 'starting_date', 'enddate': 'ending_date', 'total': 'total_strength', 'rtotal': '-total_strength', 'losses': 'total_losses', 'rlosses': '-total_losses'}
@never_cache

def index(request):
    allBattles = Battle.objects.all().order_by('starting_date')
    people = People.objects.all()
    #printlen(allBattles))
    n_found = len(allBattles)
    p_found = len(people)

    battle_photo = []
    people_photo = []
    final_data = allBattles

    for i in final_data:
        if BattlePhotos.objects.filter(batle_code_id = i.battle_id, used_as = 'thumbnail').count() == 0:
            battle_photo.extend(BattlePhotos.objects.filter(used_as = 'default'))
        else:
            battle_photo.extend(BattlePhotos.objects.filter(batle_code_id = i.battle_id, used_as = 'thumbnail'))

    for i in people:
        if PeoplePhotos.objects.filter(person_code_id = i.name_id, used_as = 'thumbnail').count() == 0:
            people_photo.extend(PeoplePhotos.objects.filter(used_as = 'default'))
        else:
            people_photo.extend(PeoplePhotos.objects.filter(person_code_id = i.name_id, used_as='thumbnail'))

    final_datas = []
    final_people = []
    for i in range(len(final_data)):

        r1 = final_data[i]
        r2 = battle_photo[i]
        final_datas.append((r1, r2))

    for i in range(len(people)):
        r1 = people[i]
        r2 = people_photo[i]
        final_people.append((r1, r2))


    context = {
        'allBattles': final_datas,
        'people': final_people,
        'number_battles': n_found,
        'number_people': p_found,
    }
    return render(request, 'search/index.html', context)


def detail(request, battle_code):
    #try:
       # battle = Battle.objects.get(battle_id=battle_code)
   # except Battle.DoesNotExist:
      #  raise Http404("Nothing found")

    battle = get_object_or_404(Battle, battle_id=battle_code)
    return render(request, 'search/detail.html', {"battle": battle})


def results(request):
    global field_corr
    ##print"oki")
    final_data = []
    keys = []
    values = []
    union_state = request.POST.get('union_state')
   # print(type(union_state))
    g = request.POST.get('sort_bname')
    ##printg)

    people = []
    s_by = []
    for key in request.POST:

        if key[:4]=='sort':
            s_by.append(sort_fields[request.POST[key]])
        if key == '':
            keys.append(request.POST[key])
        if key[:9]=='search_by':
            keys.append(request.POST[key])
        elif key[:9]=='search_ff':
            values.append(request.POST[key])


    ##print"Sorting: ", s_by)

    #printlen(keys))
    if not(len(keys) == 0 or (len(keys) == 1 and keys[0]=='' and values[0]=='')):
        ##print"yep")
        if union_state == '0':
            tempd = []
            tempp = []

            indx = 0
            tb = None
            tp = None
            for i in keys:
                if i == '':

                    sb = (Battle.objects.filter(battle_name__icontains=values[indx]) | Battle.objects.filter(starting_date__icontains=values[indx]) | Battle.objects.filter(ending_date__icontains=values[indx]) | Battle.objects.filter(description__icontains=values[indx]) | Battle.objects.filter(result__icontains=values[indx]) | Battle.objects.filter(total_strength__icontains=values[indx]) | Battle.objects.filter(total_losses__icontains=values[indx]) | Battle.objects.filter(real_location__icontains=values[indx]) | Battle.objects.filter(battleparticipants__country_code__country_name__icontains=values[indx])).distinct()
                    if tb == None:
                        tb = sb
                    else:
                        tb = (tb | sb).distinct()

                    sp = (People.objects.filter(name__icontains=values[indx]) | People.objects.filter(shortened_name__icontains=values[indx]) | People.objects.filter(achievements__icontains=values[indx]) | People.objects.filter(fate__icontains=values[indx])).distinct()
                    ##print"tb = ", tb)
                    if tp == None:
                        tp = sp
                    else:
                        tp = (tp | sp).distinct()

                #if i in field_corr:
                else:
                    tempd.append(Q(**{field_corr[i]: values[indx]}))
                    tempp.append(Q(**{people_corr[i]: values[indx]}))
                #else:
                  #  #print"aha")
                    #tempp.append(Q(**{people_corr[i]: values[indx]}))
                   # tempd.append(Q(**{people_corr[i]: values[indx]}))
                indx += 1
                ##print"You entered 1")

            if s_by and (tempd or tb):
                if tb and tempd:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.or_, tempd)).union(tb)).order_by(reduce(operator.and_, s_by)).distinct()))
                elif tempd:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.or_, tempd))).order_by(reduce(operator.and_, s_by)).distinct()))
                else:
                    final_data.extend(list(tb.order_by(reduce(operator.and_, s_by)).distinct()))
            elif len(tempd) > 0:
               # #print"hmm???")
                if tb:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.or_, tempd)).union(tb)).order_by('-starting_date').distinct()))
                else:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.or_, tempd))).order_by('-starting_date').distinct()))
            elif tb:
                final_data.extend(list(tb))
            else:
                ##print"why so?")
                pass

            if tempp:
                if tp:
                    people.extend(list((People.objects.filter(reduce(operator.or_, tempp)).union(tp)).order_by('name').distinct()))
                else:
                    people.extend(list((People.objects.filter(reduce(operator.or_, tempp))).order_by('name').distinct()))
            elif tp:
                people.extend(list(tp))



        elif union_state == '1':
            tempd = []
            tempp = []
            tb = None
            tp = None
            ##print"haha")
            indx = 0
            for i in keys:
                if i == '':

                    sb = (Battle.objects.filter(battle_name__icontains=values[indx]) | Battle.objects.filter(starting_date__icontains=values[indx]) | Battle.objects.filter(ending_date__icontains=values[indx]) | Battle.objects.filter(description__icontains=values[indx]) | Battle.objects.filter(result__icontains=values[indx]) | Battle.objects.filter(total_strength__icontains=values[indx]) | Battle.objects.filter(total_losses__icontains=values[indx]) | Battle.objects.filter(real_location__icontains=values[indx]) | Battle.objects.filter(battleparticipants__country_code__country_name__icontains=values[indx])).distinct()
                    if tb == None:
                        tb = sb
                    else:
                        tb = (tb.intersection(sb)).distinct()
                    sp = (People.objects.filter(name__icontains=values[indx]) | People.objects.filter(shortened_name__icontains=values[indx]) | People.objects.filter(achievements__icontains=values[indx]) | People.objects.filter(fate__icontains=values[indx])).distinct()
                    #print"tb = ", tb)
                    if tp == None:
                        tp = sp
                    else:
                        tp = (tp.intersection(sp)).distinct()
                else:
                    tempd.append(Q(**{field_corr[i]: values[indx]}))
                    tempp.append(Q(**{people_corr[i]: values[indx]}))
                indx += 1
            #if s_by:
               # final_data.extend(list(Battle.objects.filter(reduce(operator.and_, tempd)).order_by(reduce(operator.and_, s_by)).distinct()))
            #elif len(tempd) > 0:
               # final_data.extend(list(Battle.objects.filter(reduce(operator.and_, tempd)).order_by('-starting_date').distinct()))

            #if tempp:
              #  people.extend(list(People.objects.filter(reduce(operator.and_, tempp)).order_by('name').distinct()))
            #final_data.extend(Battle.objects.filter(reduce(operator.and_, tempd)))

            if s_by and (tempd or tb):
                if tb and tempd:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.and_, tempd)).intersection(tb)).order_by(reduce(operator.and_, s_by)).distinct()))
                elif tempd:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.and_, tempd))).order_by(reduce(operator.and_, s_by)).distinct()))
                else:
                    final_data.extend(list(tb.order_by(reduce(operator.and_, s_by)).distinct()))
            elif len(tempd) > 0:
                #print"hmm???")
                if tb:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.and_, tempd)).intersection(tb)).order_by('-starting_date').distinct()))
                else:
                    final_data.extend(list((Battle.objects.filter(reduce(operator.and_, tempd))).order_by('-starting_date').distinct()))
            elif tb:
                final_data.extend(list(tb))
            else:
                #print"why so?")
                pass

            if tempp:
                if tp:
                    people.extend(list((People.objects.filter(reduce(operator.and_, tempp)).intersection(tp)).order_by('name').distinct()))
                elif len(final_data) > 0:

                    people.extend(list((People.objects.filter(reduce(operator.and_, tempp))).order_by('name').distinct()))
            elif tp:
                people.extend(list(tp))


    else:
        if s_by:
            final_data = list(Battle.objects.all().order_by(reduce(operator.and_, s_by)).distinct())
        else:
            final_data = list(Battle.objects.all().order_by("starting_date"))
        people.extend(list(People.objects.all().order_by('name').distinct()))



    #unique_el = set(final_data)
    ##print"-> ", keys)
    #final_data = list(unique_el)
    #print'final: ', final_data)
    ##printlen(final_data))
    n_found = len(final_data)
    p_found = len(people)
    #print"Numbers: ", n_found, " ", p_found)
    battle_photo = []
    people_photo = []
    for i in final_data:
        if BattlePhotos.objects.filter(batle_code_id = i.battle_id, used_as = 'thumbnail').count() == 0:
            battle_photo.extend(BattlePhotos.objects.filter(used_as = 'default'))
        else:
            battle_photo.extend(BattlePhotos.objects.filter(batle_code_id = i.battle_id, used_as = 'thumbnail'))

    for i in people:
        if PeoplePhotos.objects.filter(person_code_id = i.name_id, used_as = 'thumbnail').count() == 0:
            people_photo.extend(PeoplePhotos.objects.filter(used_as = 'default'))
        else:
            people_photo.extend(PeoplePhotos.objects.filter(person_code_id = i.name_id, used_as='thumbnail'))



    final_datas = []
    final_people =[]
    for i in range(len(final_data)):

        r1 = final_data[i]
        r2 = battle_photo[i]
        final_datas.append((r1, r2))
    for i in range(len(people)):
        r1 = people[i]
        r2 = people_photo[i]
        final_people.append((r1, r2))

    return render(request, 'search/index.html', {'allBattles': final_datas, 'number_battles': n_found, 'people': final_people, 'number_people': p_found})










