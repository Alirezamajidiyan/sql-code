# 🏢 سیستم اتوماسیون اداری

این پروژه مربوط به ساخت پایگاه داده برای **سیستم اتوماسیون اداری** است که شامل جداول مختلف برای مدیریت اطلاعاتی مانند **دپارتمان‌ها**، **نقش‌ها**، **کاربران**، **نامه‌ها** و **بروزرسانی‌های نامه‌ها** می‌باشد. پایگاه داده این سیستم به طور خاص برای مدیریت ارتباطات داخلی، نقش‌ها و دپارتمان‌ها در یک سازمان طراحی شده است.

---

## 🚀 توضیح اجزای پایگاه داده

### 1. **جدول دپارتمان‌ها (Departments)**

این جدول برای ذخیره‌سازی اطلاعات دپارتمان‌های مختلف در سازمان استفاده می‌شود. هر دپارتمان می‌تواند شامل اطلاعاتی مانند نام دپارتمان و تاریخ ایجاد آن باشد.

- **ویژگی‌ها:**
  - شناسه یکتا برای هر دپارتمان.
  - نام دپارتمان که به صورت یکتا ذخیره می‌شود.
  - تاریخ ایجاد دپارتمان.

### 2. **جدول نقش‌ها (Roles)**

در این جدول نقش‌های مختلف کاربران مانند "مدیر"، "کارمند" و غیره ذخیره می‌شود. نقش‌ها برای تخصیص دسترسی‌ها به کاربران استفاده می‌شوند.

- **ویژگی‌ها:**
  - شناسه یکتا برای هر نقش.
  - نام نقش که به صورت یکتا ذخیره می‌شود.
  - تاریخ ایجاد نقش.

### 3. **جدول کاربران (Users)**

این جدول اطلاعات کاربران سیستم را ذخیره می‌کند. برای هر کاربر، نام کاربری، رمز عبور، نقش و دپارتمان مربوطه ثبت می‌شود.

- **ویژگی‌ها:**
  - شناسه یکتا برای هر کاربر.
  - نام کاربری و رمز عبور.
  - ارتباط با جدول نقش‌ها (نقش کاربر).
  - ارتباط با جدول دپارتمان‌ها (دپارتمان کاربر).
  - تاریخ ایجاد و تاریخ آخرین بروزرسانی اطلاعات کاربر.

### 4. **جدول نامه‌ها (Letters)**

این جدول برای ذخیره اطلاعات نامه‌هایی که بین کاربران ارسال می‌شود، استفاده می‌شود. اطلاعاتی مانند عنوان نامه، محتوای آن، وضعیت نامه (در انتظار، تایید شده و غیره) و اولویت نامه در این جدول ثبت می‌شود.

- **ویژگی‌ها:**
  - شناسه یکتا برای هر نامه.
  - عنوان و محتوای نامه.
  - وضعیت نامه (در انتظار، تایید شده و غیره).
  - اولویت نامه (عادی، بالا، بحرانی).
  - ارتباط با کاربران ارسال‌کننده و گیرنده.
  - تاریخ ایجاد و تاریخ آخرین بروزرسانی نامه.

### 5. **جدول بروزرسانی‌های نامه‌ها (LetterUpdates)**

این جدول برای ذخیره‌سازی اطلاعات مربوط به بروزرسانی‌های وضعیت نامه‌ها است. به عنوان مثال، زمانی که وضعیت یک نامه تغییر می‌کند (از "در انتظار" به "تایید شده")، این تغییر در جدول `LetterUpdates` ذخیره می‌شود.

- **ویژگی‌ها:**
  - شناسه یکتا برای هر بروزرسانی.
  - ارتباط با جدول نامه‌ها (کدام نامه بروزرسانی شده).
  - وضعیت جدید نامه پس از بروزرسانی.
  - تاریخ بروزرسانی و کاربری که این بروزرسانی را انجام داده است.
  - یادداشت‌های مربوط به بروزرسانی.

---

## 📝 نحوه کار با پایگاه داده

برای استفاده از این پایگاه داده، ابتدا باید پایگاه داده جدیدی با نام `office_automation` ایجاد کنید. سپس، جداول مختلف مربوط به دپارتمان‌ها، نقش‌ها، کاربران، نامه‌ها و بروزرسانی‌ها را ایجاد کرده و داده‌های اولیه مانند نقش‌ها را به جدول مربوطه وارد کنید.

---

## 📄 نکات مهم

- **کلیدهای خارجی (Foreign Keys)**: از کلیدهای خارجی برای ارتباط میان جداول استفاده شده است. برای مثال، هر کاربر دارای یک نقش و یک دپارتمان است که به جداول `Roles` و `Departments` ارجاع دارد.
- **وضعیت‌ها و اولویت‌ها**: برای جداول `Letters` و `LetterUpdates` از **نوع داده ENUM** برای تعریف وضعیت‌ها و اولویت‌ها استفاده شده است. این کار باعث محدود شدن مقادیر معتبر و جلوگیری از وارد کردن داده‌های نامعتبر می‌شود.
- **ایندکس‌ها**: ایندکس‌هایی برای بهبود عملکرد جستجو بر روی فیلدهای مهم مانند `sender_id` و `receiver_id` در نظر گرفته شده است.

---

## 💡 مزایای سیستم

- **مدیریت نقش‌ها و دسترسی‌ها**: با ایجاد نقش‌های مختلف برای کاربران، می‌توان دسترسی‌ها و مجوزهای هر فرد را به طور دقیق تنظیم کرد.
- **ارتباطات داخلی بهینه**: با استفاده از جداول نامه‌ها و بروزرسانی‌ها، تبادل اطلاعات و پیگیری وضعیت‌ها به شکل کارآمدتری انجام می‌شود.
- **حفظ یکپارچگی داده‌ها**: استفاده از کلیدهای خارجی و ایندکس‌ها باعث حفظ یکپارچگی و بهبود عملکرد سیستم در هنگام انجام عملیات مختلف می‌شود.

---

## 🛠 مستندات و منابع

برای مشاهده کدها و مشارکت در پروژه، به مخزن گیت‌هاب مراجعه کنید:

- [GitHub Page 📑](https://github.com/Alirezamajidiyan/sql-code/tree/main)

---

## 📅 تاریخ ایجاد پروژه

این پروژه در تاریخ 2025-01-07 ایجاد شده و به مرور زمان به روز رسانی خواهد شد.

---

## 🧑‍💻 نویسنده

- **نام نویسنده**: علیرضا مجیدیان
