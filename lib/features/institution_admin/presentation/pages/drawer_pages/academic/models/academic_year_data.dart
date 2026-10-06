class AcademicSessionData {
  final String nameEn;
  final String nameBn;
  final String status; // 'Active', 'Archived', etc.
  final DateTime startDate;
  final DateTime endDate;

  AcademicSessionData({
    required this.nameEn,
    required this.nameBn,
    required this.status,
    required this.startDate,
    required this.endDate,
  });
}

class AcademicYearData {
  final String nameEn;
  final String nameBn;
  final String status; // 'Active', 'Archived'
  final DateTime startDate;
  final DateTime endDate;
  final List<AcademicSessionData> sessions;

  AcademicYearData({
    required this.nameEn,
    required this.nameBn,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.sessions,
  });
}
