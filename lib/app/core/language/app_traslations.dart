import 'package:get/get.dart';
import 'english_lan.dart';
import 'spanish_lan.dart';
import 'french_lan.dart';
import 'german_lan.dart';
import 'italian_lan.dart';
import 'portuguese_lan.dart';
import 'russian_lan.dart';
import 'chinese_lan.dart';
import 'japanese_lan.dart';
import 'korean_lan.dart';
import 'arabic_lan.dart';
import 'hindi_lan.dart';
import 'dutch_lan.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': EnglishLan.message,
    'es': SpanishLan.message,
    'fr': FrenchLan.message,
    'de': GermanLan.message,
    'it': ItalianLan.message,
    'pt': PortugueseLan.message,
    'ru': RussianLan.message,
    'zh': ChineseLan.message,
    'ja': JapaneseLan.message,
    'ko': KoreanLan.message,
    'ar': ArabicLan.message,
    'hi': HindiLan.message,
    'nl': DutchLan.message,
  };
}