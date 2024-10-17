# Como lanzar
    Para lanzar la aplicación, hay que clonar el repositorio de git, teniendo instalada la extensión de flutter, pulsar el dispositivo en el que quieres ejecutar la app (Web) y ejecutar. Hemos desplegado la web en un servidor de Oracle para ahorrar la ejecución del programa, entrando en esta url se puede acceder a la web: http://143.47.32.82.

# Localizador de Embalses Cercanos

    Esta aplicación web desarrollada en Flutter permite a los usuarios encontrar embalses cercanos a una ubicación específica, proporcionando información clave para optimizar las operaciones de extinción de incendios. Está diseñada principalmente para ayudar a los bomberos, en especial a los pilotos de helicópteros, a localizar rápidamente las fuentes de agua más cercanas a un punto determinado.

# Funcionalidades

    Búsqueda por Latitud y Longitud: El usuario puede introducir las coordenadas de latitud y longitud que representan el centro de la búsqueda de embalses.

# Controles de Búsqueda:

    Botón "Buscar": Realiza la búsqueda de embalses dentro del radio seleccionado a partir de las coordenadas ingresadas.
    Botón "Limpiar": Restablece los campos de búsqueda y borra los resultados para permitir una nueva consulta.
    Ajuste del Radio de Búsqueda:
    La aplicación cuenta con una barra deslizante que permite definir la distancia máxima (en kilómetros) en la que se buscarán embalses alrededor del punto indicado.

# Lista de Resultados:

    Al presionar el botón "Buscar", se mostrará una lista de los embalses que cumplen con los criterios. Para cada embalse, se muestra la siguiente información:
        Nombre del embalse.
        Cantidad total de agua.
        Provincia.
        Comunidad Autónoma.
        Distancia al punto de búsqueda.

# Uso

    Introduce las coordenadas de latitud y longitud del punto de interés en los campos correspondientes.
    Ajusta el radio de búsqueda utilizando la barra deslizante para establecer la distancia máxima en kilómetros.
    Haz clic en el botón Buscar para obtener una lista de embalses dentro del rango establecido.
    Si deseas realizar otra búsqueda, haz clic en Limpiar para reiniciar la aplicación.

# Tecnologías Utilizadas

    Flutter: Framework principal para la creación de la interfaz de usuario y la lógica de la aplicación.
    Dart: Lenguaje de programación utilizado para el desarrollo de la aplicación en Flutter.
    Geolocalización: Para calcular la distancia entre el punto dado y los embalses.
    Oracle Database: La información de los embalses proviene de una base de datos Oracle, desde la cual se extraen los datos sobre las reservas de agua, la ubicación geográfica, la provincia y la comunidad autónoma de cada embalse.