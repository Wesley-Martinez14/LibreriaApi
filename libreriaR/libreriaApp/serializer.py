from rest_framework import serializers
from .models import Autor, Categoria, Libro, Cliente, Prestamo

class AutorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Autor
        fields = '__all__'

class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'

class LibroSerializer(serializers.ModelSerializer):
    autor = AutorSerializer(read_only=True)
    categoria = CategoriaSerializer(read_only=True)

    class Meta:
        model = Libro
        fields = ['id', 'titulo', 'autor', 'categoria', 'fecha_publicacion', 'stock', 'precio']

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = '__all__'

class PrestamoSerializer(serializers.ModelSerializer):
    cliente = ClienteSerializer(read_only=True)
    libro = LibroSerializer(read_only=True)

    class Meta:
        model = Prestamo
        fields = ['id', 'cliente', 'libro', 'fecha_prestamo', 'fecha_devolucion', 'devuelto']
