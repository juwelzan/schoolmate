# 🚀 SchoolMate - Project Roadmap & Developer Guide

Welcome to the **SchoolMate** project! This document is designed to help new developers understand the project structure, current progress, coding guidelines, and the roadmap ahead. 

---

## 📌 ১. প্রজেক্ট পরিচিতি (Project Overview)
**SchoolMate** একটি আধুনিক স্কুল ম্যানেজমেন্ট অ্যাপ্লিকেশন। এটি মূলত ৩টি রোলের জন্য তৈরি করা হচ্ছে:
1. **Institution Admin** (সুপার এডমিন প্যানেল)
2. **Teacher** (শিক্ষক প্যানেল)
3. **Student/Parent** (শিক্ষার্থী ও অভিভাবক প্যানেল)

**Tech Stack:**
- **Framework:** Flutter (Dart)
- **State Management:** Flutter BLoC (`flutter_bloc`)
- **Routing:** GoRouter
- **Architecture:** Feature-First Clean Architecture

---

## 🏗️ ২. আর্কিটেকচার ও ফোল্ডার স্ট্রাকচার (Architecture)

প্রজেক্টটি **Clean Architecture** মেনে তৈরি করা হয়েছে। প্রতিটি ফিচারের নিজস্ব Presentation, Domain, এবং Data লেয়ার থাকবে।

```text
lib/
 ┣ core/                  # অ্যাপের গ্লোবাল ফাইলস
 ┃ ┣ routes/              # GoRouter কনফিগারেশন (app_routes.dart, app_router.dart)
 ┃ ┣ theme/               # অ্যাপের কালার ও থিম (AppColors)
 ┃ ┣ widgets/             # গ্লোবাল রিইউজেবল উইজেট (Custom Appbar, Drawer)
 ┃ ┗ file_path.dart       # গ্লোবাল ব্যারেল ফাইল (সব ইম্পোর্ট এখানে থাকে)
 ┃
 ┗ features/              # ফিচার মডিউলসমূহ
   ┣ auth/                # লগইন / রেজিস্ট্রেশন
   ┣ institution_admin/   # এডমিন ড্যাশবোর্ড ও ড্রয়ার পেজসমূহ
   ┣ student/             # স্টুডেন্ট ড্যাশবোর্ড
   ┗ teacher/             # টিচার ড্যাশবোর্ড
```

> **💡 টিপস:** 
> এই প্রজেক্টে **Global Barrel Pattern** ব্যবহার করা হয়েছে। অ্যাপের যেকোনো ফাইলে কোনো কিছু ইম্পোর্ট করতে হলে শুধুমাত্র `import 'package:schoolmate/core/file_path.dart';` ব্যবহার করবেন। নতুন কোনো `.dart` ফাইল তৈরি করলে সেটি অবশ্যই `file_path.dart`-এ export করে দিতে হবে।

---

## 📊 ৩. বর্তমান কাজের অগ্রগতি (Current Status)

বর্তমানে অ্যাপের **UI Foundation এবং Institution Admin Drawer Routing**-এর কাজ সম্পন্ন হয়েছে। 

✅ **যা যা সম্পন্ন হয়েছে (Done):**
- কাস্টম থিম, কালার (`AppColors`), ফন্ট এবং GoRouter সেটআপ।
- Institution Admin-এর জন্য সম্পূর্ণ কাস্টমাইজড Navigation Drawer (ডায়নামিক এক্সপ্যান্ডেবল মেনু)।
- ড্রয়ারের প্রায় ৫০+ সাব-পেজ তৈরি ও রাউটিং কনফিগারেশন। 
- বেশ কিছু গুরুত্বপূর্ণ পেজের UI ডিজাইন (যেমন: Profile, Dashboard, Users, Settings, Payment Gateways, Online Admission, Website, Activity Log ইত্যাদি)।

🚧 **যা যা বাকি আছে (Pending / Next Steps):**
- **State Management (BLoC):** ডামি পেজগুলোতে BLoC/Cubit যোগ করে রিয়েল ডেটা ম্যানেজ করা।
- **API Integration:** Data layer এবং Domain layer তৈরি করে ব্যাকএন্ড API এর সাথে কানেক্ট করা।
- **Auth Flow:** লগইন এবং অথেনটিকেশন ফ্লো সম্পূর্ণ করা। 
- অন্যান্য রোলগুলোর (Student, Teacher) ড্যাশবোর্ড UI ডিজাইন করা।

---

## 📜 ৪. ডেভেলপার গাইডলাইন (Coding Guidelines)

নতুন ডেভেলপারদের নিচের নিয়মগুলো অবশ্যই মেনে চলতে হবে:

1. **Naming Convention:**
   - ফাইল ও ফোল্ডারের নাম: `snake_case` (যেমন: `home_page.dart`)
   - ক্লাসের নাম: `PascalCase` (যেমন: `HomePage`)
   - ভেরিয়েবল ও ফাংশন: `camelCase` (যেমন: `fetchData()`)
   
2. **Clean Architecture Rules:**
   - **Presentation Layer:** এখানে শুধু UI (Widgets) এবং State Management (Bloc) থাকবে। কোনো সরাসরি API কল বা বিজনেস লজিক থাকবে না।
   - **Domain Layer:** অ্যাপের মূল বিজনেস লজিক (Entities, UseCases) এখানে থাকবে।
   - **Data Layer:** API কলিং (Repositories, Models, DataSources) এখানে থাকবে।

3. **UI Design Rules:**
   - স্ক্রিন রেস্পন্সিভ হতে হবে (বিশেষ করে লম্বা টেক্সট বা Row-এর ক্ষেত্রে `Expanded` বা `Flexible` ব্যবহার করতে হবে)।
   - কালারের জন্য সবসময় `AppColors` ক্লাসটি ব্যবহার করবেন (সরাসরি Hex কোড ব্যবহার থেকে বিরত থাকুন)।

---

## 🕰️ ৫. পূর্ববর্তী কাজের হিস্ট্রি (Changelog Archive)

<details>
<summary><b>ক্লিক করে বিস্তারিত চেঞ্জলগ দেখুন (আগে কী ছিল / এখন কী আছে)</b></summary>
<br>
এই টেবিলে প্রজেক্টের শুরু থেকে বর্তমান পর্যন্ত UI ও রাউটিংয়ে যেসব পরিবর্তন আনা হয়েছে তার একটি বিস্তারিত তালিকা রয়েছে:

| তারিখ | কী পরিবর্তন হয়েছে | আগে কী ছিল | এখন কী আছে | কেন করা হয়েছে |
| :--- | :--- | :--- | :--- | :--- |
| ০৩-১০-২০২৬ | প্রজেক্ট ইনিশিয়ালাইজ ও আর্কিটেকচার সেটআপ | সম্পূর্ণ ফাঁকা / ডিফল্ট ফোল্ডার | Feature-first Clean Architecture, placeholder files ও `PROJECT_ROADMAP.md` | প্রজেক্ট একটি স্কেলেবল ও ক্লিন প্যাটার্নে শুরু করার জন্য। |
| ০৩-১০-২০২৬ | Core Error Classes তৈরি | ফাঁকা ফোল্ডার | `failures.dart` ও `exceptions.dart` ফাইল তৈরি | API এবং অ্যাপের বিভিন্ন স্তরের এরর/ফেইলিউর হ্যান্ডেল করার জন্য বেস ক্লাস তৈরি করা। |
| ০৩-১০-২০২৬ | Network Layer তৈরি | ফাঁকা ফোল্ডার | `network_info.dart` ও `api_client.dart` ফাইল তৈরি | ইন্টারনেট কানেকশন চেক এবং API কলগুলোর জন্য একটি বেস ইন্টারফেস তৈরি করা। |
| ০৩-১০-২০২৬ | Routing Setup তৈরি | ফাঁকা ফোল্ডার | `app_routes.dart` ও `app_router.dart` ফাইল তৈরি | অ্যাপের নেভিগেশন ও রাউটিং ম্যানেজ করার জন্য। |
| ০৩-১০-২০২৬ | GoRouter ইমপ্লিমেন্টেশন | ডিফল্ট Navigator 1.0 | `go_router` প্যাকেজ যোগ ও `app_router.dart` আপডেট | আধুনিক ও ডিক্লারেটিভ রাউটিং (Declarative Routing) ব্যবহারের জন্য। |
| ০৩-১০-২০২৬ | Splash Screen তৈরি | Placeholder Screen | `splash_page.dart` তৈরি ও রাউটিং আপডেট | অ্যাপের শুরুতে লোগো এবং লোডিং স্ক্রিন দেখানোর জন্য। |
| ০৩-১০-২০২৬ | Localization Setup (l10n) | হার্ডকোডেড স্ট্রিং | `l10n.yaml`, `app_en.arb`, `app_bn.arb` তৈরি ও `main.dart` আপডেট | অ্যাপে বাংলা ও ইংরেজি ভাষা সমর্থনের জন্য। |
| ০৩-১০-২০২৬ | State Management BLoC | ValueNotifier | `flutter_bloc` ও `AppBloc` সেটআপ | অ্যাপের গ্লোবাল স্টেট (যেমন ভাষা/থিম) সেন্ট্রালি ম্যানেজ করার জন্য। |
| ০৩-১০-২০২৬ | Drawer সংযোজন | Drawer ছিল না | `app_drawer.dart` তৈরি ও `dashboard_page.dart` আপডেট | সাইডবার বা ড্রয়ার মেনু যুক্ত করার জন্য। |
| ০৩-১০-২০২৬ | Role-based Features | ১টি Dashboard | `student`, `teacher`, `institution_admin` ফোল্ডার ও পেজ | ৩ ধরণের ইউজারের জন্য ৩টি আলাদা মডিউল এবং ড্যাশবোর্ড তৈরি করার জন্য। |
| ০৩-১০-২০২৬ | Role Selection Screen | ছিল না | `role_selection_page.dart` তৈরি | ইউজার কোন রোলে ঢুকবে (Student/Teacher/Admin) তা বাছাই করার জন্য। |
| ০৩-১০-২০২৬ | UI/UX Update (AppBar & More) | Language Switcher অ্যাপবারে ছিল | AppBar-এ Profile যোগ এবং Language Switcher-কে More পেজে শিফট করা | ইউজারের প্রোফাইল সহজে দেখতে এবং সেটিংস আরও গুছিয়ে রাখার জন্য। |
| ০৩-১০-২০২৬ | Sidebar Navigation (Drawer) | বেসিক ড্রয়ার ছিল | `app_drawer.dart` আপডেট করে ডার্ক থিম ও সেকশন-ভিত্তিক মেনু | ডেস্কটপ অ্যাডমিন প্যানেলের মতো হুবহু সব ট্যাব (Institution Setup, People, Academics ইত্যাদি) ড্রয়ারে নিয়ে আসা। |
| ০৩-১০-২০২৬ | Drawer Pages Creation | পেজ ছিল না | ২৪টি আলাদা পেজ ও রাউট তৈরি | ড্রয়ারের প্রতিটি মেনু ট্যাবের জন্য আলাদা আলাদা পেজ তৈরি করে রাউটিং সেট করা হয়েছে। |
| ০৩-১০-২০২৬ | Folder Structuring | পেজগুলো pages ফোল্ডারে ছিল | `drawer_pages` ফোল্ডার তৈরি করে সেখানে শিফট করা | প্রজেক্টের ফোল্ডার স্ট্রাকচার পরিষ্কার এবং গুছিয়ে রাখার জন্য। |
| ০৩-১০-২০২৬ | UI Consistency | সব পেজে AppBar ছিল না | `SchoolMateAppBar` সব পেজে যুক্ত করা এবং ড্রয়ারে Active Tab হাইলাইট করা | ড্রয়ারে ক্লিক করলে বোঝা যাবে কোন পেজে আছি এবং সব পেজের উপরে একই ডিজাইনের অ্যাপবার থাকবে। |
| ০৩-১০-২০২৬ | Routing Architecture Update | রাউটগুলো `AppRoutes`-এ হার্ডকোডেড স্ট্রিং ছিল | প্রতিটি পেজের ভেতরে `static const String routeName = '/path'` দিয়ে রাউটিং করা হয়েছে | কোড আরও মডুলার করার জন্য, এখন প্রতিটি পেজ নিজের রাউটিং পাথ নিজেই হোল্ড করে এবং `app_router.dart`-এ তা কল করা হয়েছে। |
| ০৩-১০-২০২৬ | Global Import Optimization | প্রতিটি ফাইলে আলাদা আলাদা ইমপোর্ট ছিল | পুরো প্রজেক্টের সব `.dart` ফাইলের ইমপোর্টগুলো `lib/core/file_path.dart` ফাইলে গ্লোবালি সেট করা হয়েছে | প্রজেক্টের প্রতিটি ফাইল এখন শুধু একটি `file_path.dart` ইমপোর্ট করেই অন্যান্য সব ফাইল (Theme, Bloc, Pages, Widgets) ব্যবহার করতে পারছে। |
| ০৩-১০-২০২৬ | Drawer UI Update | Institution Profile ড্রয়ারের লিস্টের ভেতরে ছিল | Institution Profile-কে একটি সুন্দর Header হিসেবে ড্রয়ারের একদম উপরে যোগ করা হয়েছে | ইউজার ড্রয়ার ওপেন করলেই যেন তার প্রতিষ্ঠানের নাম ও আইকন টপে দেখতে পান এবং প্রোফাইলে সহজে যেতে পারেন। |
| ০৩-১০-২০২৬ | Institution Profile UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী ফর্ম ডিজাইন করা হয়েছে | Identity, Contact, Address এবং Certificate Signature Block সেকশনগুলো থিম অনুযায়ী সাজানো হয়েছে। |
| ০৩-১০-২০২৬ | Profile Read-Only View | এডিটেবল ফর্ম এবং রেগুলার অ্যাপবার ছিল | ফর্মটি সম্পূর্ণ Read-only করা হয়েছে এবং টপে কাস্টম প্রোফাইল ইমেজ ও আইকন দেওয়া হয়েছে | প্রোফাইল পেজটিকে একটি ভিউয়িং (Viewing) পেজে রূপান্তর করা হয়েছে যেখানে এডিট করা যাবে না, এবং উপরে ব্যাক ও সেটিংস বাটন রাখা হয়েছে। |
| ০৩-১০-২০২৬ | Settings Feature Module | কোনো সেটিংস পেজ ছিল না | `lib/features/settings` নামে নতুন ফিচার মডিউল তৈরি করে `settings_page.dart` রাখা হয়েছে | Settings যেহেতু সবার (Admin, Student, Teacher) জন্য সাধারণ, তাই একে একটি স্বাধীন (Standalone) ফিচার ফোল্ডারে রাখা হয়েছে। |
| ০৩-১০-২০২৬ | Multi-Track UI Design | শুধু ডামি টেক্সট ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Multi-Track" পেজের Empty State ডিজাইন করা হয়েছে | থিম অনুযায়ী Dashed Border-এর ভেতরে "No tracks configured" মেসেজ এবং উপরে একটি "Add Track" বাটন দেওয়া হয়েছে। |
| ০৩-১০-২০২৬ | Board Affiliations UI | শুধু ডামি টেক্সট ছিল | ইউজারের ছবি অনুযায়ী "Board Affiliations" পেজের Empty State ডিজাইন করা হয়েছে | Dashed Border-এর ভেতরে বোর্ড কনফিগারেশনের মেসেজ এবং উপরে "Add Affiliation" বাটন দেওয়া হয়েছে। |
| ০৩-১০-২০২৬ | SMC / Governing Body UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "SMC / Governing Body" পেজ ডিজাইন করা হয়েছে | টপে বড় টাইটেল ও "New SMC Body" বাটন এবং পেজের ঠিক মাঝখানে (Center) একটি সুন্দর Empty State আইকন ও মেসেজ দেওয়া হয়েছে। |
| ০৩-১০-২০২৬ | Campus Management UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Campus Management" পেজ ডিজাইন করা হয়েছে | টপে আইকন-সহ বড় টাইটেল এবং পুরো বডি জুড়ে একটি বিশাল সাদা (White) কার্ডের ভেতরে Empty State মেসেজ ও আইকন দেওয়া হয়েছে। |
| ০৩-১০-২০২৬ | Branch Management UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Branch Management" পেজ ডিজাইন করা হয়েছে | "Campus" পেজের মতোই সেম স্টাইলে বিশাল সাদা কার্ড, "Add Branch" বাটন এবং নতুন আইকন ব্যবহার করে রেস্পন্সিভ লেআউট তৈরি করা হয়েছে। |
| ০৩-১০-২০২৬ | Academic Drawer Menu | "Academic" সিগেল বাটন ছিল | "Academic"-কে একটি Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ১৫টি সাব-মেনু (Years, Calendar, Shifts ইত্যাদি) তৈরি করে ডাইনামিক ড্রপডাউন মেনু বানানো হয়েছে এবং প্রতিটি সাব-মেনুর জন্য রাউটিং ও ডামি পেজ সেটআপ করা হয়েছে। |
| ০৩-১০-২০২৬ | Timetable Drawer Menu | "Timetable" সিঙ্গেল বাটন ছিল | "Timetable"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ১২টি সাব-মেনু (Period Slots, Rooms, Class Timetable ইত্যাদি) তৈরি করে রাউটিং সেটআপ করা হয়েছে এবং অ্যানিমেটেড কাস্টম অ্যারো আইকন ব্যবহার করা হয়েছে। |
| ০৩-১০-২০২৬ | Document Templates UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Document Templates" পেজ ডিজাইন করা হয়েছে | পেজের উপরে ডেসক্রিপশন, "New Template" বাটন এবং ইন্টারেক্টিভ কাস্টম ট্যাবস (Admit Card, Seat Plan ইত্যাদি) যোগ করা হয়েছে। ট্যাব পরিবর্তন করলে নিচের বিশাল সাদা কার্ডের মেসেজটিও ডায়নামিক ভাবে চেঞ্জ হয়। |
| ০৩-১০-২০২৬ | Students Management UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Students" পেজ ডিজাইন করা হয়েছে | টেবিল, সার্চ বার, ড্রপডাউন ফিল্টার এবং ডেটা-রো (Mamun, NSID Pending, Active) সব মোবাইল রেস্পন্সিভ করে Scrollable লেআউটে তৈরি করা হয়েছে। |
| ০৩-১০-২০২৬ | Teachers & Staff Drawer Menu | "Teachers & Staff" সিঙ্গেল বাটন ছিল | "Teachers & Staff"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ৭টি সাব-মেনু (Teachers, Staff, Recruitment ইত্যাদি) তৈরি করে রাউটিং সেটআপ করা হয়েছে এবং কাস্টম অ্যানিমেটেড অ্যারো আইকন ব্যবহার করা হয়েছে। |
| ০৩-১০-২০২৬ | Users Management UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Users" পেজ ডিজাইন করা হয়েছে | মোবাইল স্ক্রিনে যাতে ডানে-বামে স্ক্রল করতে না হয়, সেজন্য ডেক্সটপ টেবিলের বদলে এটিকে একটি সুন্দর "Card Layout"-এ তৈরি করা হয়েছে। প্রতিটি ইউজারের ডেটা (Role, Status, Phone) এখন একটি কার্ডের ভেতর সুন্দরভাবে দেখা যাবে। |
| ০৩-১০-২০২৬ | Examination Drawer Menu | "Examination" সিঙ্গেল বাটন ছিল | "Examination"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ১৮টি সাব-মেনু (Exams, Exam Terms, Result Compositions ইত্যাদি) তৈরি করে ডাইনামিক রাউটিং সেটআপ করা হয়েছে। |
| ০৩-১০-২০২৬ | Attendance Drawer Menu | "Attendance" সিঙ্গেল বাটন ছিল | "Attendance"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ১৫টি সাব-মেনু (Daily Summary, Monthly Attendance ইত্যাদি) তৈরি করে ডাইনামিক রাউটিং সেটআপ করা হয়েছে। |
| ০৩-১০-২০২৬ | Certificates Drawer Menu | "Certificates" সিঙ্গেল বাটন ছিল | "Certificates"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ২টি সাব-মেনু (Issue Certificates, Templates) তৈরি করে রাউটিং সেটআপ করা হয়েছে এবং আইকন আপডেট করা হয়েছে। |
| ০৩-১০-২০২৬ | Fee Drawer Menu | "Fee" সিঙ্গেল বাটন ছিল | "Fee"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ১৪টি সাব-মেনু (Fee Heads, Fee Structure, Defaulter List ইত্যাদি) তৈরি করে ডাইনামিক রাউটিং সেটআপ করা হয়েছে। |
| ০৩-১০-২০২৬ | Finance Drawer Menu | "Finance" সিঙ্গেল বাটন ছিল | "Finance"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ১৭টি সাব-মেনু (Chart of Accounts, Vouchers, General Ledger ইত্যাদি) তৈরি করে ডাইনামিক রাউটিং সেটআপ করা হয়েছে। |
| ০৩-১০-২০২৬ | Payment Gateways UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Payment Gateways" পেজ ডিজাইন করা হয়েছে | পেজের উপরে ডেসক্রিপশন এবং "Add Gateway" বাটন বসানো হয়েছে এবং নিচে একটি বিশাল সাদা কার্ডের মাঝে Empty State মেসেজটি সুন্দরভাবে প্রেজেন্ট করা হয়েছে। |
| ০৩-১০-২০২৬ | Online Admission UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Online Admission" পেজ ডিজাইন করা হয়েছে | পেজের উপরে ডেসক্রিপশন এবং ৩টি রেস্পন্সিভ বাটন (Dashboard, Quota Types, New Cycle) দেওয়া হয়েছে। পেজের ঠিক মাঝখানে সুন্দর Empty State আইকন ও মেসেজ বসানো হয়েছে। |
| ০৩-১০-২০২৬ | Inventory Drawer Menu | "Inventory" সিঙ্গেল বাটন ছিল | "Inventory"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ৭টি সাব-মেনু (Assets, Stock Items, Warehouses ইত্যাদি) তৈরি করে ডাইনামিক রাউটিং সেটআপ করা হয়েছে। |
| ০৩-১০-২০২৬ | Communication Drawer Menu | "Communication" সিঙ্গেল বাটন ছিল | "Communication"-কে একটি Custom Expandable মেনুতে রূপান্তর করা হয়েছে | ইউজারের ছবি অনুযায়ী ৮টি সাব-মেনু (Bulk SMS, Bulk Email, Notice Board ইত্যাদি) তৈরি করে ডাইনামিক রাউটিং সেটআপ করা হয়েছে। |
| ০৩-১০-২০২৬ | Website Page UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Website" পেজ ডিজাইন করা হয়েছে | পেজের উপরে Horizontal Scrollable Tabs তৈরি করা হয়েছে এবং "Hero" ট্যাবের জন্য একটি পূর্ণাঙ্গ ফর্ম ডিজাইন করা হয়েছে, যেখানে হেডলাইন, সাবহেডলাইন এবং বাটনসহ সব অপশন রয়েছে। |
| ০৩-১০-২০২৬ | Activity Log UI | শুধু ডামি পেজ ছিল | ইউজারের দেওয়া ছবি অনুযায়ী "Activity Log" পেজ ডিজাইন করা হয়েছে | পেজের উপরে ফিল্টার অপশন (Dropdown, Search, DatePicker) দেওয়া হয়েছে এবং নিচে কালারফুল ব্যাজসহ একটি সুন্দর অ্যাক্টিভিটি হিস্ট্রি লিস্ট (Deleted, Created, Updated) ডিজাইন করা হয়েছে। |
| ০৩-১০-২০২৬ | App Drawer | ড্রয়ারে "Account" সেকশন ছিল | ড্রয়ার থেকে "Account" মেনুটি মুছে ফেলা হয়েছে | ইউজারের নির্দেশ অনুযায়ী অপ্রয়োজনীয় "Account" সেকশনটি ড্রয়ার থেকে রিমুভ করা হয়েছে। |
| ০৩-১০-২০২৬ | Notifications Page UI | পেজটি ছিল না | নতুন `NotificationsPage` তৈরি করে ডেমো নোটিফিকেশন যুক্ত করা হয়েছে | অ্যাপ বারের নোটিফিকেশন আইকনে ক্লিক করলে পেজটি ওপেন হবে। পেজটিতে Unread এবং Read নোটিফিকেশনগুলো সুন্দর আইকন এবং কালার কোডিংয়ের মাধ্যমে সাজানো হয়েছে। |


</details>

