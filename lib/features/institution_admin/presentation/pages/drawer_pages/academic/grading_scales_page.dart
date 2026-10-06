import 'package:schoolmate/core/file_path.dart' hide AppDrawer;

class GradingScalesPage extends StatelessWidget {
  static const String routeName = '/grading-scales';

  const GradingScalesPage({super.key});

  @override
  (String, String, String) _parseGrade(String label) {
    final openParenthesis = label.indexOf('(');
    final closeParenthesis = label.lastIndexOf(')');
    if (openParenthesis < 0 || closeParenthesis < openParenthesis) {
      return (label, '', '');
    }
    final grade = label.substring(0, openParenthesis).trim();
    final values = label
        .substring(openParenthesis + 1, closeParenthesis)
        .split('·')
        .map((value) => value.trim())
        .toList();
    return (grade, values.first, values.length > 1 ? values[1] : '');
  }

  String _gradeRemark(String grade) {
    switch (grade) {
      case 'A+':
        return 'Outstanding';
      case 'A':
        return 'Excellent';
      case 'A-':
        return 'Very Good';
      case 'B':
      case 'B+':
      case 'B-':
        return 'Good';
      case 'C':
      case 'C+':
        return 'Satisfactory';
      case 'D':
        return 'Pass';
      case 'F':
        return 'Fail / Retake';
      default:
        return grade;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
