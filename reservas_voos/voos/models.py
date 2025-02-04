from django.db import models

class Voos(models.Model):
    id = models.AutoField(primary_key=True)
    companhia = models.CharField(max_length=255)
    origem = models.CharField(max_length=255)
    destino = models.CharField(max_length=255)
    horario_partida = models.TimeField()
    horario_chegada = models.TimeField()
    data_voo = models.DateField()
    valor = models.FloatField()

    class Meta:
        managed = False
        db_table = 'voos'

class Reservas(models.Model):
    id = models.AutoField(primary_key=True)
    voo = models.ForeignKey(Voos, on_delete=models.CASCADE)
    nome_comprador = models.CharField(max_length=255)
    data_nasc = models.DateField()
    cpf = models.CharField(max_length=14)
    email = models.EmailField()
    ida = models.DateField()
    volta = models.DateField()

    class Meta:
        managed = False
        db_table = 'reservas'
