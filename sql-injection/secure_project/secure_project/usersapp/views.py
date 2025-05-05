from django.shortcuts import render
from django.http import HttpResponse
from .models import User

def get_users(request):
    if request.method == 'GET':
        username_filter = request.GET.get('username', '')

        # Consulta segura usando el ORM de Django
        users = User.objects.filter(username__icontains=username_filter)
        
        users_list = [f"Username: {user.username}, Email: {user.email}" for user in users]
        return HttpResponse('<br>'.join(users_list))

    return render(request, 'usersapp/get_users.html')
