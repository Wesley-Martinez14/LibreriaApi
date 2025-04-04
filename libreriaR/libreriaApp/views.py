from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.cache import cache_page
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

@cache_page(2*60)
def clientes_view(request):
    return render(request, 'clientes.html')

@cache_page(2*60)
def categorias_view(request):
    return render(request, 'categorias.html')

@cache_page(2*60)
def prestamos_view(request):
    return render(request, 'prestamos.html')

@cache_page(2*60)
def autores_view(request):
    return render(request, 'autores.html')

@cache_page(2*60)
def libros_view(request):
    return render(request, 'libros.html')


def index(request):
    return render(request, 'index.html')