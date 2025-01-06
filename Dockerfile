# از ایمیج پایه‌ی پایتون نسخه 3.10 با حجم کم استفاده می‌کنیم
FROM python:3.10-slim

# تنظیم پوشه‌ی کاری درون کانتینر
WORKDIR /app

# کپی فایل‌های موردنیاز
# ابتدا فقط requirements.txt را کپی می‌کنیم تا کش Docker در صورت تغییر نکردن کتابخانه‌ها قابل‌استفاده باشد
COPY requirements.txt /app/

# نصب کتابخانه‌ها
RUN pip install --no-cache-dir -r requirements.txt

# حال کل پروژه را کپی می‌کنیم
COPY . /app

# در صورت نیاز، متغیرهای محیطی را می‌توانید در اینجا تعریف کنید (یا از docker-compose بگیرید)
# ENV MONGO_URI="mongodb://db:27017"
# ENV OTHER_ENV="some_value"

# اگر خواستید از فایل .env استفاده کنید، می‌توانید کتابخانه python-dotenv را نصب کرده
# و در main_run.py آن را load کنید. (اینجا صرفاً اشاره می‌کنیم)

# در نهایت، فرمان پیش‌فرض برای اجرای برنامه
CMD ["python", "main_run.py"]
