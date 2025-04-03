from django.shortcuts import render
from django.http import HttpResponse

from rest_framework import viewsets
from .models import Autor, Categoria, Libro, Cliente, Prestamo
from .serializer import AutorSerializer, CategoriaSerializer, LibroSerializer, ClienteSerializer, PrestamoSerializer

class AutorViewSet(viewsets.ModelViewSet):
    queryset = Autor.objects.all()
    serializer_class = AutorSerializer

class CategoriaViewSet(viewsets.ModelViewSet):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class LibroViewSet(viewsets.ModelViewSet):
    queryset = Libro.objects.all()
    serializer_class = LibroSerializer

class ClienteViewSet(viewsets.ModelViewSet):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

class PrestamoViewSet(viewsets.ModelViewSet):
    queryset = Prestamo.objects.all()
    serializer_class = PrestamoSerializer


def clientes_view(request):
    return render(request, 'clientes.html')

def categorias_view(request):
    return render(request, 'categorias.html')

def prestamos_view(request):
    return render(request, 'prestamos.html')

def autores_view(request):
    return render(request, 'autores.html')

def libros_view(request):
    return render(request, 'libros.html')


def index(request):
    return render(request, 'index.html')