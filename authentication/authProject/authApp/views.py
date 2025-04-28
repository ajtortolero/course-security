# To handle views and redirects
from django.shortcuts import render, redirect
# To Import auth functions form Django
from django.contrib.auth import authenticate, login, logout
# The login_required decorator to protect views
from django.contrib.auth.decorators import login_required
# For class-based views[CBV]
from django.contrib.auth.mixins import LoginRequiredMixin
# For class-based views[CBV]
from django.views import View
#  Import the User class (model)
from django.contrib.auth.models import User
# Import the RegisterForm from forms.py
from .forms import RegisterForm
# Import the CaptchaForm from forms.py
from .forms import CaptchaForm

def login_view(request):
    error_message = None 
    max_attempts = 3
    attempts = request.session.get('login_attempts', 0)
    if request.method == "POST":  
        if attempts >= max_attempts:
            error_message = "Demasiados intentos. Intenta más tarde."
            return render(request, 'accounts/login.html', {'error': error_message})

        captcha_form = CaptchaForm(request.POST)
        if captcha_form.is_valid():
            username = request.POST.get("username")  
            password = request.POST.get("password")  
            user = authenticate(request, username=username, password=password)  
            if user is not None:  
                login(request, user)
                request.session['login_attempts'] = 0
                next_url = request.POST.get('next') or request.GET.get('next') or 'home'  
                return redirect(next_url) 
            else:
                request.session['login_attempts'] = attempts + 1
                error_message = "Credenciales invalidas"  
        else:
            error_message = "Error en el captcha. Por favor intente de nuevo."            
    return render(request, 'accounts/login.html', {
        'error': error_message,
        'attempts': attempts,
        'max_attempts': max_attempts
    })

def register_view(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            user = User.objects.create_user(username=username, password=password)
            login(request, user)
            return redirect('home')
    else:
        form = RegisterForm()
    return render(request, 'accounts/register.html', {'form':form})

    
def logout_view(request):
    if request.method == "POST":
        logout(request)
        return redirect('login')
    else:
        return redirect('home')

# Home View
# Using the decorator 
@login_required
def home_view(request):
    return render(request, 'app/home.html')

# Protected View 
class ProtectedView(LoginRequiredMixin, View):
    login_url = '/login/'
    # 'next' - to redirect URL
    redirect_field_name = 'redirect_to'
    
    def get(self, request):
        return render(request, 'registration/protected.html')
    








