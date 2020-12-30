from django.shortcuts import render
from django.http import JsonResponse
from search.models import BannedIps, Messages
from django.conf import settings
import requests

# Create your views here.

def savedata(request):



    user_ip = request.META.get('HTTP_X_FORWARDED_FOR')
    if user_ip:
        user_ip = user_ip.split(',')[0]
    else:
        user_ip = request.META.get('REMOTE_ADDR')

    #printuser_ip)



    try:
        ip = BannedIps.objects.get(ip_addr=user_ip)
        response_code = 2

    except Exception:

        recaptcha_response = request.POST.get('captcha')
        url = 'https://www.google.com/recaptcha/api/siteverify'
        values = {
            'secret': settings.GOOGLE_RECAPTCHA_SECRET_KEY,
            'response': recaptcha_response
        }

        r = requests.post(url, values)
        result = r.json()


        if result['success']:
            person_name = request.POST.get('person_name')
            email = request.POST.get('email')
            subject = request.POST.get('subject')
            description = request.POST.get('description')
            ##print'person name = ', person_name)
            ##printperson_name, " ", email, " ", subject, " ", description)
            nm = Messages(person_name=person_name, person_email=email, person_subject=subject, person_description=description, person_ip_addr=user_ip)
            nm.save()
            response_code = 1
        else:
            response_code = 3
    data = {
        'successful': response_code,
    }
    return JsonResponse(data)


def other(request):

    return render(request, 'other/other.html', None)