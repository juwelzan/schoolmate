import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolmate/core/file_path.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        final isEnglish = state.locale.languageCode == 'en';
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Container(
          height: 32,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => context.read<AppBloc>().add(
                  const ChangeLocaleEvent(Locale('en')),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: isEnglish
                        ? AppColors.primaryPurple
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      "EN",
                      style: TextStyle(
                        color: isEnglish
                            ? Colors.white
                            : (isDark
                                  ? Colors.white70
                                  : (Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color ??
                                        AppColors.textSecondary)),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.read<AppBloc>().add(
                  const ChangeLocaleEvent(Locale('bn')),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: !isEnglish
                        ? AppColors.primaryPurple
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      "বাং",
                      style: TextStyle(
                        color: !isEnglish
                            ? Colors.white
                            : (isDark
                                  ? Colors.white70
                                  : (Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color ??
                                        AppColors.textSecondary)),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
