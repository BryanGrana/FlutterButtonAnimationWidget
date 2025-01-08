import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed; // Acción al presionar el botón
  final String text; // Texto del botón
  const AnimatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftAnimation;
  late Animation<double> _rightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    // Animación para mover el lado izquierdo
    _leftAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: -20).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50, // Peso de la primera parte del movimiento
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -20, end: 0).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50, // Peso de la segunda parte del movimiento
      ),
    ]).animate(_controller);

    // Animación para mover el lado derecho
    _rightAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 20).chain(CurveTween(curve: Curves.easeIn)),
        weight: 50, // Peso de la primera parte del movimiento
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 20, end: 0).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50, // Peso de la segunda parte del movimiento
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: Offset(_leftAnimation.value, 0), //Cambian los valores podemos hacer que se mueva en el eje X o Y, ahora mismo se mueve en el eje X
              child: Container(
                color: Colors.blue, // Color de la parte izquierda
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  widget.text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(_rightAnimation.value, 0),
              child: Container(
                color: Colors.blue, // Color de la parte derecha
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  widget.text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
