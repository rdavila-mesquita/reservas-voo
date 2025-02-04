from django import forms
from .models import Reservas

class ReservaForm(forms.ModelForm):
    class Meta:
        model = Reservas
        fields = ['nome_comprador', 'cpf', 'data_nasc', 'email', 'volta']
        widgets = {
            'data_nasc': forms.DateInput(attrs={'type': 'date'}),
            'volta': forms.DateInput(attrs={'type': 'date'}),
        }
