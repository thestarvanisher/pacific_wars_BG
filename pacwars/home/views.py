from django.shortcuts import render
from django.http import HttpResponse, HttpResponseNotFound
from search.models import Battle, Countries, People, SuggestedLinks
from django.shortcuts import render
# Create your views here.
def home(request):

    battles_count = Battle.objects.all().count()
    people_count = People.objects.all().count()
    countries = Countries.objects.all()
    links = SuggestedLinks.objects.all()


    return render(request, 'home/home.html', {'battle_count': battles_count, 'people_count': people_count, 'countries': countries, 'suggested': links})


def custom_404(request, exception):
    return render(request, 'home/error404.html', {'errorcode': 404})
   # return HttpResponse("<h2>Грешка 404! Тази страница не е намерена!</h2>")
def custom_500(request):
    return HttpResponse("<h2>Грешка 500!</h2>")