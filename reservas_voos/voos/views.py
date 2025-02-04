import requests
from django.shortcuts import render, get_object_or_404, redirect
from .models import Voos, Reservas
from .forms import ReservaForm
from django.urls import reverse

UNSPLASH_ACCESS_KEY = "0Q-o4EoOMEDJdotgi8S3y2uMzsm1IYnkzOyOIcGz21A"


def buscar_imagem(destino):
    url = f"https://api.unsplash.com/search/photos?query={destino}&client_id={UNSPLASH_ACCESS_KEY}&per_page=1"
    response = requests.get(url)
    data = response.json()

    if data["results"]:
        return data["results"][0]["urls"]["regular"]
    return None


def listar_voos(request):
    voos = Voos.objects.all()
    for voo in voos:
        voo.imagem_url = buscar_imagem(voo.destino)

    return render(request, "reservas/voos.html", {"voos": voos})


def reserva_voo(request, voo_id):
    voo = get_object_or_404(Voos, id=voo_id)

    if request.method == "POST":
        form = ReservaForm(request.POST)
        if form.is_valid():
            reserva = form.save(commit=False)
            reserva.voo = voo
            reserva.ida = voo.data_voo
            reserva.save()

            return redirect(reverse('reserva_sucesso', args=[reserva.id]))


    else:
        form = ReservaForm()

    voo.imagem_url = buscar_imagem(voo.destino)

    return render(request, 'reservas/reserva.html', {'voo': voo, 'form': form})


def reserva_sucesso(request, reserva_id):
    reserva = get_object_or_404(Reservas, id=reserva_id)
    return render(request, 'reservas/sucesso.html', {'reserva': reserva})


def lista_reservas(request):
    reservas = Reservas.objects.all()
    return render(request, 'reservas/lista_reservas.html', {'reservas': reservas})
