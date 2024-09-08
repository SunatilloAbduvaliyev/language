import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class LearningWordScreen extends StatelessWidget {
  const LearningWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "learing_word_screen",
        navigatePop: true,
      ),
      body: const SingleChildScrollView(
        child: HtmlWidget("""
<h2>Yangi innovatsion lug'at haqida</h2>
<p>Siz hozir qo'lingizda dunyodagi yagona innovatsion kitobni ushlab turibsiz. Ushbu kitob o'ziga xos xususiyatga ega, u lug'atdan foydalanish bilan bog'liq har qanday muammoni hal qilishga qodir. Ingliz tilini o'rganayotgan odam vaqtining 90 foizini so'zlarni siqishga sarflaydi. Statistik ma'lumotlarga ko'ra, til o'rganayotgan odam yiliga 1200-1500 so'zni o'rganadi. Demak, 3-4 yil ichida u 5000-6000 ta so'zni o'rganadi va Ilg'or darajaga etadi. Aynan mana shu 90% muammo bu lug'at orqali hal qilindi, endi sizda atigi 1 oy ichida 5000 ta so'zni o'rganish imkoniyati mavjud.
<br><br>
Ayniqsa, ushbu lug'at IELTS va CEFR imtihonlariga tayyorlanayotgan talabalar uchun foydali bo'ladi.
<br><br>
<i><b>Chet so'zlarni yodlash texnikasi</b></i>
<br><br>
<i><b>(soatiga 150-320 so'z)</b></i>
<br><br>
<b>Lug'at.</b> Hisob-kitoblarga ko'ra, til o'rganayotgan odam vaqtining <b>90 foizini</b> asosan yangi so'zlarni o'rganishga sarflaydi. Bu shuni anglatadiki, asosiy muammo yangi so'zlarni o'rganishdir. Endi bu muammoni qanday hal qilishimiz mumkin?
<br><br>
Hech kim hech qachon so'zlarni yodlashga e'tibor bermagan. Hamma o'qituvchilar sizga faqat so'z beradi va sizga o'rganishni aytadi, hammasi shu. Lekin ular sizga bu so'zlarni yodlashni o'rgatmaydilar! Muammo shundaki!
<br><br>
Odatda so'zlarni qanday o'rganamiz? Standart usul: biz uni uchta ustunga ajratamiz: <b>Rus/Eng/Transkripsiya</b> - jadvalni shu tarzda to'ldiring, keyin birinchi yarmini yoping va ikkinchi yarmini takrorlang, ikkinchi yarmini yoping va birinchi yarmini takrorlang. Barcha so'zlar shu tarzda o'rgatiladi, to'g'rimi?
<br><br>
Endi shu tarzda qancha so'zni o'rganishingiz mumkin? Hisob-kitoblarga ko'ra, oddiy odam ushbu usuldan foydalangan holda bir soat ichida <b>2030 ta so'zni</b> eslab qoladi . Ammo Ebenhaus teoremasiga ko'ra, bir hafta o'tgach, bu o'rganilgan so'zlardan faqat <b>3-4 ta so'z</b> xotirangizda eslab qoladi.
<br><br>
Qolganlari shunchaki unutiladi. Sababi, faol yodlash yo'q, faqat passiv o'quv jarayoni.
<br><br>
Bizning o'rganish texnikamiz bilan siz soatiga <b>150 320 so'zn</b>i o'rganishingiz mumkin . Albatta, mahoratga ega bo'lgandan keyin. Ya'ni, bu usul nafaqat bilim, balki mahoratdir. Odatda, bu usuldan foydalanishni boshlaganlar <b>500-so'zga yetib, bir soat ichida 120-180 so'zni</b> o'rganishni boshlaydilar . Rekordni yangilamoqchi bo'lganlar uni <b>1 soat ichida 320 so'zgacha oshirishlari mumkin</b>, lekin bundan ortiq emas.
<br><br>
Buning sababi nimada? Qanday qilib so'zlarni shu tarzda tezda o'rganishingiz mumkin? Buning siri juda oddiy. Kurs boshida biz xotiraning o'ng tomonini ochamiz va uni rivojlantiramiz. Bizning miyamiz 2 qismga bo'linadi: <b>chap va o'ng tomon</b>. Chap tomon asosan Mantiq bo'lib, u raqamlar, matn va u eslatmalarni yodlash uchun mo'ljallangan va xotira <b>hajmining atigi 10%</b> ga ega . Va o'ng tomon asosan his-tuyg'ular uchun javobgardir. Bizda 5 ta sezgi bor
<br><br>
- ko'rish, eshitish, ta'm, hid va teginish. O'ng tomonda xotira <b>hajmining 90%</b> mavjud . U erdan, <b>hajmning 80%</b> sizning tasavvuringizga tegishli. Sizga bir savol: nimani yaxshiroq eslaysiz: o'qigan kitobingizmi yoki ko'rgan filmingizmi? Albatta, men filmni tomosha qildim. <b>Har bir epizodni batafsil eslab qolasiz. Sabab?</b> Filmni tomosha qilayotganda siz hech qachon unutilmaydigan avtomatik tasavvurga ega bo'lasiz. Aytishlaricha, yosh bolalar kuchli xotiraga ega. To'g'ri, ular barcha ma'lumotlarni o'ng tomonda, ya'ni o'z tasavvurlari bilan qabul qilganligi sababli, ular hamma narsani eslab qolishadi. Afsuski, maktabga kelgandan keyin ularning tabiat in'omlari so'na boshlaydi. O'ng tomoni endi deyarli ishlatilmaydi. Barcha ma'lumotlar chap tomonda qabul qilinadi.
<br><br>
Shuning uchun, biz qurilmaning chang o'ng tomonini yaxshilab tozalaymiz va uni zaryad qilamiz. O'ng tomonni uyg'otish uchun maxsus mashqlar mavjud. Bir dars ichida <b>o'ng tomon normal holatga qaytishni boshlaydi</b> . Shundan so'ng lug'atni yodlash jarayoni boshlanadi.
<br><br>
<h3>Xotira</h3>

Birinchidan, miya faoliyati tezligini ko'rib chiqaylik. Bizning miyamiz ikki qismdan iborat.
<br><br>
Chap va o'ng. Chap tomon asosan mantiqiy, o'ng tomon hissiyotlar uchun javobgardir.
<br><br>
Chap tomoni matn xotirasi: turli so'zlarni, matnlarni, raqamlarni, faktlarni, tahlillarni va hokazolarni yodlash uchun.
<br><br>
O'ng tomon - hissiy xotira: mas'uliyatli va beshta hisdan iborat
<br><br>
- ko'rish, eshitish, hidlash, ta'm va teginish xotirasi.
<br><br>
Chap tomon 10% esda saqlash qobiliyatiga ega. O'ng tomonda 90% ma'lumotlarni saqlash imkoniyati mavjud.
<br><br>
Siz tasavvuringiz orqali o'ylaysizmi yoki matn sizning fikringizda paydo bo'ladimi? Albatta, tasavvur.
<br><br>
Tasavvur - <b>80% xotiraga ega. Qolgan his-tuyg'ular qolgan 10%</b> ni taqsimlaydi.
<br><br>
<b>Nega farzandlarimiz xotirasi kuchli deymiz?</b> Ular matn xotirasiga o'tmaganligi sababli, ular tasavvur qiladigan barcha ma'lumotlarni eslab qolishadi. Miyaning ikkala yarim sharlarini bog'laydigan miyaning o'rta qismi korpus kallosum deb ataladi. Miyaning ikki qismini bog'lash eng qiyin narsa. Ikki qism bilan eslab qolish qobiliyati bilan biz xohlagan narsani 100% eslay olamiz. Bu chang bosgan xotirani tiriltirishimiz kerak.
<br><br>
Boshida qiyin bo'ladi. Lekin har kim buni qila oladi. Xotirani tiklash va yaxshilash uchun maxsus fan - mnemonika mavjud. Ko'pchilik bu sohani biladi. Televizorda ikkita yigit paydo bo'lib, xotira kuchlarini ko'rsatadi, bu hech kimga sir emas. Biz uchun xotirani tiklash uchun faqat bitta mashq kifoya qiladi.
<br><br>
Biz hammamiz tarix va mnemonikadan bilamiz. Bir vaqtlar Tsitseron mnemonika bo'yicha ko'plab asarlar qoldirgan. Qadimgi Yunonistonda xotira ma'budasi bor edi va uning ismi Mnemonik edi. U mistik odam edi, shuning uchun bu narsa uning sharafiga nomlangan.
<br><br>
Endi sizda vazifa bor. Keling, xotirangizni sinab ko'raylik. Keyingi 20 ta so‘zni birma-bir eslab qolishga harakat qiling.
<ol>
<li>banan;</li>

<li>qalam;</li>

<li>O'rmon;</li>

<li>muzlatgich;</li>

<li>Gilam;</li>

<li>oshpaz;</li>

<li>Osmon;</li>

<li>Yog ';</li>

<li>Avtomobil;</li>

<li>Stadion;</li>

<li>Bodring;</li>

<li>ayiq;</li>

<li>Bulutlar;</li>

<li>Qulupnay;</li>

<li>Kompyuter;</li>

<li>non;</li>

<li>maktab;</li>

<li>televizor;</li>

<li>piyoz;</li>

<li>o'rdak.</li>
</ol>
Ko'rib turganingizdek, yodlash juda qiyin. Ammo assotsiatsiyalar yordamida bu so'zlarni o'rganish juda oson. Siz shunchaki so'zlarni birma-bir bog'lashingiz va hikoya qilishingiz kerak.
<br><br>
Bizning miyamiz kichik neyronlardan iborat. Axborot miyaga etib kelganida, neyronlar sinaps orqali, ya'ni ulanish yordamida ma'lumotni bir-biriga uzatadi. Mnemonika shunga asoslanadi. Ya'ni, birinchi ma'lumotni ikkinchisi bilan bog'lash.
<br><br>
Endi men sizga so'zlarni qanday bog'laganimni ko'rsataman. Qalam ustidagi banan xat yozadi, shundan so'ng qalam kattalashadi va qalamning rasmini chizadi. O'rmon muzlatgichlar bilan to'ldirilgan. Sovutgichni ochamiz, u gilam bilan to'ldirilgan. Gilamlarni silkitgandan keyin u yerdan oshpazlar tusha boshladi. Va birdan oshpazlar yuqoriga ucha boshladilar. Osmonda ovqat pishirilgandan so'ng, mashinalarga yog'lar to'kila boshladi. Keyinroq mashinalar qayerga borishni bilmay, stadionga bostirib kela boshladi. Bu vaqtda stadionda bodring va ayiqlar futbol o'ynashardi. Birdan ayiqlar ustida bulutlar paydo bo'ldi va ayiqlar ucha boshladi. U yerda ayiqlar qulupnay topib, eyishni boshladilar. Qulupnaylar kompyuterda o'ynashardi. Kompyuterning ichida esa katta nonning fotosurati bor edi. To'satdan bu nonlar maktablarga tarqatila boshlandi. Maktabda hamma televizor ko'rar edi. Televizor ko‘rayotganlar unga ta’zim qila boshladilar. Televizorga kamon tegishi bilan o‘rdaklar sakrab chiqa boshladi.
<br><br>
Biz ma'lumotlarni ulashni o'rgandik. Endi buni o'zingiz qilishingiz kerak. Shunday qilib, yana mashq qiling. Men sizga yana 20 ta so'z beraman. Sekin-asta ularni ulashga harakat qiling.
<ol>
<li>Telefon;</li>

<li>Qovun;</li>

<li>Uy;</li>

<li>Quyon;</li>

<li>olma;</li>

<li>Mars;</li>

<li>Tog'lar;</li>

<li>robot;</li>

<li>oyna;</li>

<li>uzum;</li>

<li>oyna;</li>

<li>Konditsioner;</li>

<li>bo'ri;</li>

<li>yo'lbars;</li>

<li>Tuxum;</li>

<li>Yer;</li>

<li>Bog ';</li>

<li>Poyezd;</li>

<li>qalam;</li>

<li>Limon.</li>
</ol>
Muhim qoidalar:
<br><br>
Tasvirlaringizni iloji boricha jonlantiring va ularni kattaroq hajmda taqdim eting;
<br><br>
Rasmlar harakatlanishi kerak;
<br><br>
Uyushmalar hayoliy va kulgili bo'lsin.
<br><br>
Mustaqil ishlash uchun mashqlar
<ol>
    <li>Telefon</li>
    <li>Qovun</li>
    <li>Uy</li>
    <li>Quyon</li>
    <li>Olma</li>
    <li>Mars</li>
    <li>Tog'lar</li>
    <li>Robot</li>
    <li>Oyna</li>
    <li>Uzum</li>
    <li>Oyna</li>
    <li>Konditsioner</li>
    <li>Bo'ri</li>
    <li>Yo'lbars</li>
    <li>Tuxum</li>
    <li>Yer</li>
    <li>Bog'</li>
    <li>Poyezd</li>
    <li>Qalam</li>
    <li>Limon</li>
    <li>Banan</li>
    <li>Qalam</li>
    <li>O'rmon</li>
    <li>Muzlatgich</li>
    <li>Gilam</li>
    <li>Oshpaz</li>
    <li>Osmon</li>
    <li>Yog'</li>
    <li>Avtomobil</li>
    <li>Stadion</li>
    <li>Bodring</li>
    <li>Ayiq</li>
    <li>Bulutlar</li>
    <li>Qulupnay</li>
    <li>Kompyuter</li>
    <li>Non</li>
    <li>Maktab</li>
    <li>Televizor</li>
    <li>Piyoz</li>
    <li>O'rdak</li>
    <li>Shaftoli</li>
    <li>Quti</li>
    <li>Astronavt</li>
    <li>Tog'lar</li>
    <li>Poyezd</li>
    <li>Sigir</li>
    <li>Kalamush</li>
    <li>Oyna</li>
    <li>Qulupnay</li>
    <li>Televizor</li>
    <li>Xonalar</li>
    <li>O'rik</li>
    <li>Rasm</li>
    <li>Baraban</li>
    <li>Kafedra</li>
    <li>Mars</li>
    <li>Xurmo</li>
    <li>Bozor</li>
    <li>Gullar</li>
    <li>Matematika</li>
    <li>Kefir</li>
    <li>Fan</li>
    <li>Kiyinish</li>
    <li>Yulduzlar</li>
    <li>Samolyot</li>
    <li>Direktor</li>
    <li>Kasalxona</li>
    <li>Kosa</li>
    <li>Limon</li>
    <li>Musiqa</li>
    <li>Muzlatgich</li>
    <li>Mushuk</li>
    <li>Qirol</li>
    <li>Kolbasa</li>
    <li>Nemislar</li>
    <li>Qulflash</li>
    <li>Tez yordam mashinasi</li>
    <li>Otlar</li>
    <li>Televizor</li>
    <li>Soqol</li>
    <li>Oltin tish</li>
    <li>Quvur</li>
    <li>Diplomat</li>
    <li>Sichqoncha</li>
    <li>Noutbuk</li>
    <li>Aktrisa</li>
    <li>Avtomobil</li>
    <li>Chamadon</li>
    <li>Ko'l</li>
    <li>Vaqt mashinasi</li>
    <li>Boshpana</li>
    <li>Politsiya</li>
    <li>Eshik</li>
    <li>Ananas</li>
    <li>Multfilm</li>
    <li>Lift</li>
    <li>Qovurilgan baliq</li>
    <li>Cherkov</li>
    <li>Askarlar</li>
    <li>Kamalak</li>
    <li>Nayzalar</li>
    <li>Kubok</li>
    <li>Supurgi</li>
    <li>Taksi</li>
    <li>Shahar</li>
    <li>Echki</li>
    <li>Do'kon</li>
    <li>Uzuk</li>
    <li>Stomatolog</li>
    <li>Kreslo</li>
    <li>Gips</li>
    <li>Kema</li>
    <li>Shlyapa</li>
    <li>Qurol</li>
    <li>Pul</li>
    <li>Giyohvand moddalar</li>
    <li>Palto</li>
    <li>Qo'l</li>
    <li>Nok</li>
    <li>Restoran</li>
    <li>Bar</li>
    <li>Qushlar</li>
    <li>Fil</li>
    <li>Yorug'lik</li>
    <li>Qishloq</li>
    <li>Sharbat</li>
    <li>Palma</li>
    <li>Dollar</li>
    <li>Choynak</li>
    <li>Xaker</li>
    <li>Kitob</li>
    <li>O'qituvchi</li>
    <li>Temir</li>
    <li>Palov</li>
    <li>Bedana</li>
    <li>Choyxona</li>
    <li>Texnologiya</li>
    <li>Kutubxona</li>
    <li>Orol</li>
    <li>Bo'sh joy</li>
    <li>Miya</li>
    <li>Tort</li>
    <li>Sichqoncha</li>
    <li>Pishloq</li>
    <li>Kamera</li>
    <li>Ko'prik</li>
    <li>Til</li>
    <li>Yosh ayol</li>
    <li>Kabutar</li>
    <li>Gitara</li>
    <li>Universitet</li>
    <li>Pomidor</li>
    <li>Teshik</li>
    <li>Eshak</li>
    <li>Devor</li>
    <li>Sochlar</li>
    <li>Tobut</li>
    <li>Yurak</li>
    <li>Iblis</li>
    <li>Jannat</li>
</ol>
<h2>Chet so'zlarni yodlash texnikasi</h2>

Chet so'zlarni yodlash texnikasi bir necha bosqichlardan iborat bo'lib, agar siz ushbu texnikani to'liq o'zlashtirsangiz, chet el so'zlarini yodlashda hech qachon muammoga duch kelmaysiz. Agar siz ushbu texnikani mahoratga aylantira olsangiz, soatiga 150 dan 320 gacha so'zlarni o'rganishingiz mumkin. Shunday qilib, biz so'zlarni yodlash ustida ishlaymiz.
<br><br>
Ushbu texnika bir necha bosqichlardan iborat:
<br><br>
1)

Avvalo, chet so‘zni ruscha so‘z bilan bog‘lashimiz kerak. Masalan, Cat (ket) so'zi ingliz tilidan mushuk deb tarjima qilingan.
<br><br>
Endi ruscha so'z o'xshash bo'lgan "ket" so'zini, masalan, "kit" so'zi bilan bog'lash mumkin. Bu nima uchun? Bizning miyamiz yangi narsalarni eslab qolish uchun yaratilgan, ular yangi ma'lumotlarni eski ma'lumotlar bilan bog'lashlari kerak; Agar yangi narsa bilan eski xotirangiz bo'lmasa, u tushunmaydi. Misol uchun, men limon so'zini aytsam, siz tasavvur qila olasiz, to'g'rimi? Sababi, siz limonni ko'rdingiz, hatto sinab ko'rdingiz, miyada hech bo'lmaganda u haqida ma'lumot bor. Endi bengal yong'oqlari haqida nima deyish mumkin? Sizda hech bo'lmaganda qandaydir tasvir bormi? Siz eng oddiy yong'oqni yoki umuman hech narsani tasavvur qilasiz. Sabab? Siz buni ilgari ko'rmaganingiz uchun sizda eski bilim yo'q, shuning uchun yangi ma'lumotlarni qo'shib bo'lmaydi. Xuddi shu narsa xorijiy so'zlarga ham tegishli. Ya'ni, xorijiy so'zlar bizning miyamiz uchun yangi ma'lumotdir va buni eslab qolish uchun so'zlar eski bilimlarga asoslangan bo'lishi kerak. Agar e'tibor bersangiz, standart usulda o'qiyotganingizda, siz ilgari qayta-qayta eshitgan yoki filmlarda ko'rgan so'zlarni eslaysiz. Demak, bu bizning miyamizning tabiiy jarayoni. Bu borada sizga yordam beramiz. Bu shuni anglatadiki, bizning eski ma'lumotlarimiz rus yoki boshqa tillarda biladigan narsadir, shuning uchun biz xorijiy so'zni o'zimiz bilgan so'zlar bilan bog'laymiz. Biz bu uyushmani chaqiramiz;
<br><br>
2)

Biz tayyor assotsiatsiyani tarjima bilan birlashtiramiz. Masalan, mushuk "kit" ga o'xshaydi. Endi biz mushukni olib, uni kitga qo'yamiz va ular okean bo'ylab qanday suzishlarini tasavvur qilamiz;
<br><br>
3)

Agar Uyushma tayyor bo'lsa, ingliz tilidan rus tiliga 3 marta va rus tilidan ingliz tiliga 3 marta takrorlanishi kerak;
<br><br>
4)

Yana bir muhim qoida - bir vaqtning o'zida 5 dan ortiq so'zni o'rganmaslik. Ya'ni, 10-20 so'zni o'rganmang. Bizning miyamiz bir vaqtning o'zida beshdan ortiq ma'lumotni ushlab turolmaydi. Birinchidan, biz beshta so'z bilan assotsiatsiya qilamiz, keyin uni 3 marta tarjima qilamiz. Keyin keyingilariga o'tamiz
<br><br>
5 so'z, keyin kuchlanish va charchoq bo'lmaydi;
<br><br>
5)

96 soat qoidasi.
<br><br>
Har bir yodlangan so'zni 4 kundan keyin 1 marta takrorlang. Bu nima uchun kerak? Bizning miyamiz 4 kun davomida yangi ma'lumotlarni saqlaydi, agar u qayta ishlatilmasa, u shunchaki xotiradan tashlanadi. Shuning uchun, so'zlarni to'rtinchi kuni takrorlang, keyin so'zlar butun umr xotirangizda qoladi. Misol uchun, bugun siz 200 ta so'zni o'rgandingiz va bugun dushanba, payshanba kuni esa bu 200 so'zni takrorlaysiz;
<br><br>
6)

Shahar usuli.
<br><br>
Siz eng yaxshi biladigan shaharni tanlaysiz. Siz bu shaharni butunlay ozod qilasiz, ya'ni u yerdan odamlarni olib tashlaysiz, albatta sizning tasavvuringizda! Shundan so'ng, barcha yaratilgan uyushmalaringizni shahar atrofida joylashtiring. Misol uchun, oshxonada kit ustida suzuvchi mushukni qo'yasiz. Avval o'z uyingizdan boshlang va keyin uni boshqa joylarga joylashtiring. Bu nima uchun kerak? Ushbu texnikadan foydalanib, siz yaratgan uyushmalar
<br><br>
havoda uchmang, ular kosmosda o'ziga xos o'ringa ega, hatto ularning joylashishini ham aytishingiz mumkin.
<h3>Keling, 100 ta so'zni birgalikda o'rganamiz</h3>
<b>Cat (ket)</b> – mushuk: (kit) Tasavvur qiling, biz mushukni olib, kit ustiga o'tqazdik va ularning okean bo'ylab suzib ketayotganini tasavvur qiling.
<br><br>
<b>Opportunity (oportyuniti)</b> – imkoniyat: (otbor, tyulen) Tasavvur qiling, Antarktidada Miss tanloviga tyulenlarni saralash bosqichi o'tmoqda. Sizda ham bu tanlovga kirish imkoniyati bor.
<br><br>
<b>Read (rid)</b> – o'qish: (riday) Tasavvur qiling, siz yuragingizga tegadigan bir kitobni o'qiyapsiz va yig'lab yuboryapsiz!
<br><br>
<b>Holiday (holidey)</b> – ta'til, bayram: (Holi) Tasavvur qiling, siz Hindistonda Holi bayramini nishonlayapsiz!
<br><br>
<b>Wash (uosh)</b> – yuvish: (vash) Tasavvur qiling, sizning qo'shningiz sizning narsalaringizni yuvib qo'ymoqda. Bu juda yoqimli!
<br><br>
Endi so'zlarni o'rgatish metodiga ko'ra, avval ingliz tilidan o'zbek tiliga uch marta tarjima qiling, keyin esa o'zbek tilidan ingliz tiliga takrorlash orqali o'rganishni davom ettiring.
<br><br>
<b>Food (fud)</b> – ovqat: (funt) Tasavvur qiling, uyingizda 10,000 funtlik ovqat bor!
<br><br>
Siz hayratdasiz!
<br><br>
<b>Debt (debt)</b> – qarz: (debyut) Tasavvur qiling, sizni kinoga taklif qilishdi va bu sizning debyut rolingiz. Endi siz rejissyor oldida qarzdorsiz.
<br><br>
<b>Fire (fayr)</b> – olov: (flaer) Tasavvur qiling, bir kishining barcha flaerlari kuyib ketgan. Bu unga juda alamli…
<br><br>
<b>Flame (fleym)</b> – uchqun: (flomaster) Tasavvur qiling, sizning flomasteringiz atrofida uchqunlar yaltirab turibdi!
<br><br>
<b>Fruit (fruyt)</b> – mevalar: (flirt) Tasavvur qiling, bog'dagi mevalar siz bilan flirt qilishmoqda. Tasavvur qildingizmi? Zo'r…
<br><br>
<b>Condition (kondishn)</b> – shart: (konditsioner) Tasavvur qiling, sizga konditsionerdan foydalanish uchun shartlar qo'yishmoqda.
<br><br>
<b>Fight (fayt)</b> – jang: (fayl) Tasavvur qiling, kompyuteringizdagi fayllar bir-birlari bilan jang qilishmoqda. Mana bu haqiqiy urush… dahshat!
<br><br>
<b>Bit (bit)</b> – qismlar: (bity) Tasavvur qiling, siz idishlarni ura boshladingiz, va ular kichik qismlarga bo'linib ketdi.
<br><br>
<b>Color (kale)</b> – rang: (kola) Tasavvur qiling, biz yaxshi ko'rgan kola o'z rangini o'zgartirdi! Tasavvur qilyapsizmi?
<br><br>
<b>Air (eyr)</b> – havo: (Eyr layner) Tasavvur qiling, siz havo orqali Eyr laynerda uchyapsiz. Bu juda ajoyib…
<br><br>
Endi bir oz dam olamiz, bo'shashamiz va yuqoridagi uslubga amal qilib barcha so'zlarni takrorlaymiz…
<br><br>
<b>Art (art)</b> – san'at: (art ko'rgazma) Tasavvur qiling, san'at haftaligi bo'lib o'tmoqda va bugun art ko'rgazma bor… Keling, juda qiziqarli bo'ladi!
<br><br>
<b>Chalk (chok)</b> – bo'r: (shok) Tasavvur qiling, siz uy devorlarining bo'r bilan chizilganidan shokka tushdingiz.
<br><br>
<b>Doubt (daut)</b> – shubha: (deputat) Tasavvur qiling, bir deputat yolg'on gapiryapti, va siz unga shubha qila boshladingiz.
<br><br>
<b>Glass (glas)</b> – stakan: (glaz) Tasavvur qiling, ko'zlaringiz singan stakanga tushdi. Bu sizning sevimli stakanningiz edi!
<br><br>
<b>Ice (ays)</b> – muz: (aysberg) Tasavvur qiling, siz Antarktidada turibsiz va katta aysbergni ko'rdingiz. Bu juda chiroyli!
<br><br>
Barcha so'zlarni takrorlang!!!!!!!!!!!
<br><br>
<br><br>
</p>
        
            """),
      ).paddingHorizontal(14),
    );
  }
}
