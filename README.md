# Rick & Morty App

Aplicación móvil desarrollada en Flutter que permite consultar personajes de la API de Rick and Morty, gestionarlos localmente y personalizar su nombre.Este proyecto fue realizado como parte de una prueba técnica, enfocándose en arquitectura limpia, manejo de estado y persistencia de datos.

## 📋 Características Principales

La aplicación cumple con los siguientes requisitos funcionales:

1.  **Consulta de API:** Obtención de lista de personajes con paginación (Infinite Scroll) desde la API pública de Rick and Morty.
2.  **Persistencia Local:** Posibilidad de guardar personajes en una base de datos local.
3.  **Edición Personalizada:** Asignación de nombres personalizados a los ítems guardados.
4.  **Gestión (CRUD):** Listado, visualización de detalle y eliminación de elementos guardados.
5.  **Búsqueda:** Buscador en tiempo real para filtrar personajes desde la API.

## 🚀 Arquitectura y Tecnologías

El proyecto sigue los principios de **Clean Architecture** para garantizar la escalabilidad, testabilidad y separación de responsabilidades.

### Estructura de Carpetas

Se ha optado por una organización basada en _features_:

```text
lib/
├── core/               # Utilidades, configuración de DB, manejo de errores y temas
├── features/
│   └── characters/     # Módulo principal de Personajes
│       ├── data/       # Implementación de repositorios, datasources y modelos (JSON/DB)
│       ├── domain/     # Entidades puras y definición de interfaces (Contratos)
│       └── presentation/ # Logic (Cubits), Vistas y Widgets
├── router/             # Configuración de rutas (Navegación)
├── di.dart             # Inyección de dependencias
└── main.dart           # Punto de entrada
```

## Tecnologías

- BLoC: Gestión de estado.
- Drift: Base de datos.
- http: Peticiones HTTP.
- go_router: Navegación.
- get_it: Inyección de dependencias.
- fvm: Manejo de versiones de Flutter.

## 🛠️ Instalación y Ejecución

Sigue estos pasos para correr el proyecto en tu entorno local:

1. Clonar el repositorio: `git clone git@github.com:alvaro-jrr/rick_and_morty_app.git`
2. Ejecutar `fvm install` para instalar la versión de Flutter requerida.
3. Instalar dependencias: `flutter pub get`
4. Ejecutar la app: `flutter run`

## 🧠 Decisiones Técnicas

- Repository Pattern: Se implementó para abstraer la fuente de datos. El Cubit no sabe si los datos vienen de la API o de la base de datos local, solo solicita datos al repositorio.

- Manejo de Errores con `Either`: Para asegurar un flujo robusto y mensajes descriptivos al usuario en caso de fallos.

- Go Router: Se utilizó para la navegación ya que simplifica y ofrece tipado seguro en el manejo de rutas nombradas.

- Drift: Se utilizó Drift para la base de datos, ya que permite de manera sencilla definir las tablas de la base de datos y realizar las consultas y escrituras sin el uso de SQL plano, pero ofreciendo dicha caracterisica para consultas más complejas.
