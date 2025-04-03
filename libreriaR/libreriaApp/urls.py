from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AutorViewSet, CategoriaViewSet, LibroViewSet, ClienteViewSet, PrestamoViewSet, clientes_view, libros_view, categorias_view, prestamos_view, autores_view, index

router = DefaultRouter()
router.register(r'autores', AutorViewSet)
router.register(r'categorias', CategoriaViewSet)
router.register(r'libros', LibroViewSet)
router.register(r'clientes', ClienteViewSet)
router.register(r'prestamos', PrestamoViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
    path('', index, name='index'),
    path('clientes.html', clientes_view, name='clientes'),
    path('categorias.html', categorias_view, name='categorias'),
    path('prestamos.html', prestamos_view, name='prestamos'),
    path('autores.html', autores_view, name='autores'),
    path('libros.html', libros_view, name='libros'),
]