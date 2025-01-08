# AnimatedButton Widget

Este widget `AnimatedButton` es una implementación básica de un botón con animación en Flutter. El widget incluye dos partes animadas que se desplazan hacia la izquierda y la derecha utilizando `TweenSequence`.

## Descripción

`AnimatedButton` es un widget personalizado que muestra un botón con animaciones suaves en los lados izquierdo y derecho. Al presionar el botón, se ejecutará la función `onPressed`. La animación puede modificarse fácilmente añadiendo más `TweenSequenceItem` o ajustando los `offSet` para personalizar el movimiento.

## Propiedades

- `onPressed`: Callback que se ejecuta cuando se presiona el botón.
- `text`: Texto que se muestra en el botón.

## Instalación

Este widget debe integrarse en un proyecto Flutter existente. Simplemente importa el archivo en el que se encuentra y usa `AnimatedButton` en tu aplicación.

## Uso

```dart
AnimatedButton(
  onPressed: () {
    // Acción al presionar el botón
    print('Button pressed!');
  },
  text: 'Animated Button',
)
```
## Personalización
Puedes personalizar las animaciones añadiendo más `TweenSequenceItem` y ajustando los `offSet` para personalizar el movimiento en los ejes X o Y, mezclando ambas para crear una animación personalizada con más vida y movimiento.

- `TweenSequenceItem`: Define cómo se mueve el botón en el eje X.
- `Curvas`: Puedes cambiar las curvas de entrada/salida según se requiera.
## Contribuciones
¡Este widget es un ejemplo sencillo! Si deseas añadir más funcionalidades o personalizarlo, ¡no dudes en hacerlo!
