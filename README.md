Ejecución de Escenarios con Cucumber

Ejecutar todos los escenarios
```cucumber .\features```

Ejecutar un escenario específico
```cucumber .\features\<archivo>.feature```

Ejemplos:
Pago: ```cucumber .\features\billing.feature```
Navegación: ```cucumber .\features\navigation.feature```
Productos: ```cucumber .\features\products.feature```
Carrito de compras: ```cucumber .\features\shopping_cart.feature```

Generar reportes
Formato: -f <formato> (ej. -f html)
Archivo de salida: -o <nombre_archivo> (ej. -o Reporte.html)

Generar un reporte general:
```cucumber .\features -f html -o ReporteGeneral.html```