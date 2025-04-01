from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import AutorViewSet, CategoriaViewSet, LibroViewSet, ClienteViewSet, PrestamoViewSet

router = DefaultRouter()
router.register(r'autores', AutorViewSet)
router.register(r'categorias', CategoriaViewSet)
router.register(r'libros', LibroViewSet)
router.register(r'clientes', ClienteViewSet)
router.register(r'prestamos', PrestamoViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
]