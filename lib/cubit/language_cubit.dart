import 'package:flutter_bloc/flutter_bloc.dart';

// Az állapota a Cubit-nek (true = Angol, false = Magyar)
class LanguageCubit extends Cubit<bool> {
  LanguageCubit() : super(false); // Kezdőállapot: Magyar (false)

  void toggleLanguage() => emit(!state); // Nyelvi állapot váltása
  bool get isEnglish => state;
}