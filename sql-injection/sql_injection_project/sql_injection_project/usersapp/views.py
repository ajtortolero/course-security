from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection

def get_users(request):
    if request.method == 'GET':
        username_filter = request.GET.get('username', '')

        # Consulta vulnerable a SQL Injection
        query = f"SELECT * FROM usersapp_user WHERE username LIKE '{username_filter}%'"
        cursor = connection.cursor()
        cursor.execute(query)

        users = cursor.fetchall()
        users_list = [f"Username: {user[1]}, Email: {user[2]}" for user in users]
        return HttpResponse('<br>'.join(users_list))

    return render(request, 'usersapp/get_users.html')
