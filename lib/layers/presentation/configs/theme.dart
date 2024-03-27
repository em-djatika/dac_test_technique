import 'package:test_technique/layers/presentation/shared/others/export.dart';

@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    this.primaryColor = const Color.fromARGB(255, 234, 0, 255),
    this.tertiaryColor = const Color(0xFF625B71),
    this.neutralColor = const Color(0xFFCFB1DA),
  });

  final Color primaryColor;
  final Color tertiaryColor;
  final Color neutralColor;
  ThemeData base() {
    return ThemeData(
      useMaterial3: true,
      extensions: [this],
      fontFamily: Fonts.poppins,
      appBarTheme: AppBarTheme(
        toolbarHeight: 80,
        color: AppColors.extraLightPurple,
      ),
      textTheme: TextTheme(
          titleLarge:  TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color:AppColors.violet),
          headlineMedium: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: primaryColor)),
      cardTheme: const CardTheme(color: Colors.white),
    );
  }

  @override
  ThemeExtension<CustomTheme> copyWith({
    Color? primaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      CustomTheme(
        primaryColor: primaryColor ?? this.primaryColor,
        tertiaryColor: tertiaryColor ?? this.tertiaryColor,
        neutralColor: neutralColor ?? this.neutralColor,
      );

  @override
  CustomTheme lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    if (other is! CustomTheme) return this;
    return CustomTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }
}

