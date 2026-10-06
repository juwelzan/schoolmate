import re

file_path = "lib/features/institution_admin/presentation/pages/drawer_pages/academic/calendar_page.dart"
with open(file_path, "r") as f:
    content = f.read()

# Delete Widget LegendItem
content = re.sub(r'Widget LegendItem\(\{[\s\S]*?^\s*\}\s*$', '', content, flags=re.MULTILINE)

# Delete Widget _buildAcademicYearSelector
content = re.sub(r'Widget _buildAcademicYearSelector\(\{[\s\S]*?^\s*\}\s*$', '', content, flags=re.MULTILINE)

# Delete Widget _buildCalendarCell
content = re.sub(r'Widget _buildCalendarCell\([\s\S]*?\{[\s\S]*?^\s*\}\s*$', '', content, flags=re.MULTILINE)

with open(file_path, "w") as f:
    f.write(content)
