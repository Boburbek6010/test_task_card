# Plastik Karta Qo'shish Loyihasi

Bu loyiha plastik kartalarni qo'shish uchun mobil ilova sahifasini yaratishni maqsad qilgan. Sahifa foydalanuvchilarga plastik karta ma'lumotlarini kiritish va avtomatik ravishda skanerlash imkoniyatini beradi. Loyihada TDD (Test Driven Development) yondashuvi va Clean Architecture qo'llaniladi. Kod SOLID, DRY va KISS tamoyillariga muvofiq yoziladi.

## Xususiyatlar

### 1. Plastik Karta Raqamini Kiritish
- Plastik karta raqamini (PAN) kiritish uchun input maydoni.

### 2. Amal Qilish Muddatini Kiritish
- Amal qilish muddatini kiritish uchun input maydoni.

### 3. Kamera Orqali Skanerlash
- Kamera orqali karta ma'lumotlarini o'qish uchun tugma.
- Kamera ochilib, karta ramka ichiga to'g'ri kiritilganda, karta raqami va amal qilish muddati avtomatik ravishda input maydonlariga joylashtiriladi.
- Humo va Uzcard kartalarida test qilingan.

### 4. NFC Orqali Ma'lumotlarni O'qish
- NFC orqali karta ma'lumotlarini o'qish uchun tugma.
- Tugma bosilganda dialog ochilib, karta qurilmaga yaqinlashtirilishi so'raladi.
- Karta yaqinlashtirilganda, ma'lumotlar avtomatik ravishda o'qiladi va input maydonlariga joylashtiriladi.
- Humo va Uzcard kartalarida test qilingan.

## Texnik Talablar

### 1. TDD (Test Driven Development)
- Loyiha testlar asosida rivojlantiriladi.

### 2. Clean Architecture
- Modullar orasidagi bog'liqlik minimallashtiriladi va kod strukturasi toza bo'ladi.

### 3. SOLID Printsiplari
- Har bir klass va funksiyaning yagona mas'uliyati bo'lishi kerak.
- Modullar o'zaro mustaqil bo'lishi kerak.

### 4. DRY Printsipi
- Kodda takrorlanishlar oldini olish uchun umumiy funksiyalar yaratiladi.

### 5. KISS Printsipi
- Kod iloji boricha oddiy va tushunarli bo'lishi kerak.

## Texnologiyalar
- **Flutter**: Ilova interfeysi uchun.
- **Camera Plugin**: Kamera funksionalligi uchun.
- **NFC Plugin**: NFC ma'lumotlarini o'qish uchun.
- **Unit Testing**: Kodni test qilish uchun.

## Loyihani Ishga Tushirish
1. Loyihani klonlang:
   ```bash
   git clone <repository_url>
   ```
2. Zaruriy kutubxonalarni o'rnating:
   ```bash
   flutter pub get
   ```
3. Loyihani qurish va ishga tushirish:
   ```bash
   flutter run
   ```

## Testlarni Ishga Tushirish
Testlarni ishga tushirish uchun quyidagi buyruqdan foydalaning:
```bash
flutter test
```

## Humo va Uzcard Testlari
Humo va Uzcard kartalari bilan quyidagi jarayonlar test qilindi:
- Kamera orqali karta raqami va amal qilish muddatini o'qish.
- NFC orqali karta ma'lumotlarini o'qish.

## Mualliflik Huquqi
Bu loyiha [The Alpha Group](https://example.com) tomonidan yaratilgan va qo'llab-quvvatlanadi.

