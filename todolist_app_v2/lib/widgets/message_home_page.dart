import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageHomePage extends StatelessWidget {
  const MessageHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
      child: Column(
        children: [
          Text(
            'Bem-vindo(a) ao DailyTasks - Seu App de Tarefas Diárias!',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.blue,
                letterSpacing: .5,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Vamos tornar cada dia mais produtivo juntos. Comece a organizar suas tarefas e alcançar seus objetivos agora mesmo!',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.blue,
                letterSpacing: .5,
                fontSize: 10,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
