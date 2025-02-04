from django.urls import path
from . import views
from .views import reserva_voo

urlpatterns = [
    path('', views.listar_voos, name='lista_voos'),
    path('reserva/<int:voo_id>/', reserva_voo, name='reserva_voo'),
    path('reserva/sucesso/<int:reserva_id>/', views.reserva_sucesso, name='reserva_sucesso'),
    path('lista_reservas/', views.lista_reservas, name='lista_reservas'),
]



