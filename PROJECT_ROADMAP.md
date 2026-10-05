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
   ┣ institution_admin/   # এডমিন ড্যাশবোর্ড ও ১৩০+ ড্রয়ার পেজসমূহ
   ┣ student/             # স্টুডেন্ট ড্যাশবোর্ড
   ┗ teacher/             # টিচার ড্যাশবোর্ড
```

> **💡 টিপস:** 
> এই প্রজেক্টে **Global Barrel Pattern** ব্যবহার করা হয়েছে। অ্যাপের যেকোনো ফাইলে কোনো কিছু ইম্পোর্ট করতে হলে শুধুমাত্র `import 'package:schoolmate/core/file_path.dart';` ব্যবহার করবেন। নতুন কোনো `.dart` ফাইল তৈরি করলে সেটি অবশ্যই `file_path.dart`-এ export করে দিতে হবে।

---

## 📊 ৩. বর্তমান কাজের অগ্রগতি (Current Status)

বর্তমানে অ্যাপের **UI Foundation এবং Institution Admin Drawer Routing**-এর কাজ প্রায় সম্পূর্ণ হয়েছে। 

✅ **যা যা সম্পন্ন হয়েছে (Done):**
- কাস্টম থিম, কালার (`AppColors`), ফন্ট এবং GoRouter ফুল সেটআপ।
- Institution Admin-এর জন্য সম্পূর্ণ কাস্টমাইজড Navigation Drawer (ডায়নামিক এক্সপ্যান্ডেবল মেনু)।
- ড্রয়ারের **১৩০+ সাব-পেজ তৈরি ও রাউটিং কনফিগারেশন** (Academic, Timetable, Teachers & Staff, Examination, Attendance, Certificates, Fee, Finance, Inventory, Communication)।
- বেশ কিছু গুরুত্বপূর্ণ পেজের ফুল UI ডিজাইন সম্পন্ন (যেমন: Profile, Dashboard, Users, Settings, Payment Gateways, Online Admission, Website, Activity Log, Students, Branches, Campuses, Document Templates ইত্যাদি)।

🚧 **যা যা বাকি আছে (Pending / Next Steps):**
- **State Management (BLoC):** ডামি পেজগুলোতে BLoC/Cubit যোগ করে রিয়েল ডেটা ম্যানেজ করা।
- **API Integration:** Data layer এবং Domain layer তৈরি করে ব্যাকএন্ড API এর সাথে কানেক্ট করা।
- **Auth Flow:** লগইন (Login) এবং অথেনটিকেশন ফ্লো সম্পূর্ণ করা। (বর্তমানে Auth ফোল্ডার ফাঁকা আছে)
- অন্যান্য রোলগুলোর (Student, Teacher) ড্যাশবোর্ড ও ফিচার UI ডিজাইন করা।

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
| ০৩-১০-২০২৬ | Routing Setup তৈরি | ফাঁকা ফোল্ডার | `app_routes.dart` ও `app_router.dart` ফাইল তৈরি | অ্যাপের নেভিগেশন ও রাউটিং ম্যানেজ করার জন্য। |
| ০৩-১০-২০২৬ | GoRouter ইমপ্লিমেন্টেশন | ডিফল্ট Navigator 1.0 | `go_router` প্যাকেজ যোগ ও `app_router.dart` আপডেট | আধুনিক ও ডিক্লারেটিভ রাউটিং (Declarative Routing) ব্যবহারের জন্য। |
| ০৩-১০-২০২৬ | Drawer সংযোজন ও UI Update | Drawer ছিল না | `app_drawer.dart` তৈরি ও ডার্ক থিম/সেকশন ভিত্তিক মেনু | ডেস্কটপ অ্যাডমিন প্যানেলের মতো হুবহু সব ট্যাব ড্রয়ারে নিয়ে আসা। |
| ০৩-১০-২০২৬ | Drawer Pages Creation | পেজ ছিল না | ২৪টি আলাদা পেজ ও রাউট তৈরি | ড্রয়ারের প্রতিটি মেনু ট্যাবের জন্য আলাদা আলাদা পেজ তৈরি করে রাউটিং সেট করা হয়েছে। |
| ০৫-১০-২০২৬ | 130+ Sub-pages Routing & Scaffolding | শুধু মেইন ড্রয়ার পেজ ছিল | Academic, Timetable, Examination, Attendance সহ মোট ১০টি ক্যাটাগরির অধীনে ১৩০+ সাব-পেজ তৈরি ও রাউটিং | Institution Admin প্যানেলের সকল ফিচারের রুট (Route) ও ব্ল্যাঙ্ক/ডামি পেজ স্ট্রাকচার প্রস্তুত করার জন্য। |
| ০৫-১০-২০২৬ | Complex UI Designs | ডামি পেজ | Profile, Multi-Track, Board Affiliations, SMC, Campuses, Branches, Document Templates, Students, Users, Payment Gateways, Online Admission, Website, Activity Log এর সম্পূর্ণ UI ডিজাইন। | অ্যাপের মূল পেজগুলোর ইউজার এক্সপেরিয়েন্স ও রেস্পন্সিভ লেআউট তৈরি করার জন্য। |

*(পুরোনো আরো অনেক ছোটখাটো পরিবর্তন উপরের সারমর্মে একত্রিত করা হয়েছে)*

</details>
