import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appconfig {
  static const String app_name = 'طقس فلسطين';
  static const String app_version = 'version 1.0.0';
  static const int app_v_code = 1;
  static const String google_sans_family = 'GoogleSans';
  static bool isDebugMod = false;

  static SharedPreferences prefs;
  static const String cityName = "ramallah";
  static const String cityNameArabic = "gaza";

  static const String unit = "ca";

  screens() {
    switch (1) {
      case 1:
        return 1;
      case 2:
        return 2;
        break;
      default:
    }
  }

  static const List<String> allcities = [
    '32.9281387,35.0764694',
    '32.9646,35.4960',
    '32.7940,34.9896',
    '32.6996,35.3035',
    '32.4646,35.2939',
    "32.4971,35.4973",
    '32.3194,35.0240',
    '32.3211,35.3700',
    '32.1960,34.9815',
    '32.2227,35.2621',
    '32.0851,35.1808',
    '32.0494,34.7584',
    '31.8611,35.4618',
    '31.9038,35.2034',
    '31.7683,35.2137',
    '31.3547,34.3088',
    '31.7054,35.2024',
    '31.3462,34.3040',
    '31.2968,34.2435',
    '31.5326,35.0998',
    "31.2530,34.7915",
  ];

  static const List<String> fuckingAll = [
    'Gaza',
    'Bayt Lahiya',
    'Jabalia',
    'Rafah',
    'Khan Younis',
    'Deir al-Balah',
    'Beit Hanun',
    'Al Maghazi',
    'Nazareth',
    'Akre',
    'Nahariya',
    'Ashquelon',
    'Hadora',
    'Haifa',
    'Jaffa',
    'Tiberia',
    'Sfat',
    'Shefaram',
    'Deir el Asad',
    'Tamra',
    'Har Meron',
    "Jabal Kan'an",
    'Har HaAri',
    'Jabal al Karmel',
    'Sakhnin',
    'Beit Shean',
    'Isfiya',
    'Nazareth',
    'Umm alFahm',
    'Fasayel',
    'Zabidat',
    "Marj Na'je",
    'alfashkha',
    'al-Auja',
    'AlJiftlik',
    'Jericho',
    'Qalqilya',
    'Hajjah',
    "Fara'ata",
    'Hablah',
    'Azzoun',
    'Immatain',
    'Kafr Thulth',
    'Sanniriya',
    'Jinsafut',
    'Al Funduk',
    'Kafr Laqif',
    'Jayyous',
    'Jerusalem',
    'Abu Dis',
    'Beit Liqya',
    "Beit 'Anan",
    'Biddu',
    'Anata',
    'Sur Baher',
    'Mikhmas',
    'Ramla',
    'Qatanna',
    'Beit Safafa',
    'Hizma',
    'Al-Ram',
    "Al 'Eizariya",
    'Shuafat',
    'Beit Hanina',
    'Al-Quds University - Abu Dis',
    'Ramallah',
    'Damascus',
    'Ain Yabrud',
    'Deir Dibwan',
    'Taybeh',
    'Arura',
    'Beitillu',
    'Aljaniyah',
    'Al-Attara',
    'Kobar',
    'Beitunia',
    'Silwad',
    'Kafr Malik',
    'Beitin',
    "Al-Mazra'a a-Sharqiya",
    "Bil'in",
    'Turmos Aia',
    'Sinjil',
    'Beit Liqya',
    'AlMughayer',
    "Ein 'Arik",
    'Aboud',
    'Dait Ammar',
    'Beit Rima',
    "Mazari' an Nubani",
    "Al Mazra'a al Qibliya",
    'Ajul',
    'Bait Siera',
    'Dair Ghassaneh',
    'Khirbet Abu Falah',
    'Al-Bireh',
    "Deir Abu Mash'al",
    "Dayr Ibzi'",
    'Al Jalazun',
    'Kafr Ein',
    'Rammun',
    'Beit Ur al-Fauqa',
    'Jifna',
    'Deir Jarir',
    'Bait Owr Altehta',
    'Deir as-Sudan',
    'Bir Nabala',
    'Abwein',
    "Ni'lin",
    'Shuqba',
    'Tall `Asur',
    'Rawabi',
    "Kafr Ni'ma",
    'Rantis',
    'Birzeit University',
    'Jamala',
    'Hebron',
    'Jenin',
    'Beit Fajjar',
    'Beit Ula',
    'Beit Ummar',
    'Halhul',
    'Dura',
    "Sa'ir",
    'Ad-Dhahiriya',
    'Al-Shuyukh',
    'Al Fawwar',
    'Idhna',
    'Bani Naim',
    'Ras al-Tira',
    'Beit Awwa',
    'Beit Kahel',
    'Taffuh',
    'Al-Arroub',
    'Kharas',
    'Tarqumiyah',
    'Yatta',
    'Dair Samet',
    'Ras Al Jourah',
    'Nuba',
    'Surif',
    'As-Samu',
    'Cave of the Patriarchs',
    "Beit 'Einun",
    'Hebron University',
    'Polyticnic University',
    'Nablus',
    'Bethlehem',
    'Burqa',
    'Sabastia',
    'Bazaria',
    'Beit Imrin',
    'Qusin',
    'Deir Sharaf',
    "Jamma'in ",
    'Burin',
    'Hawwarah',
    'Jit',
    'Qaryut',
    'Al Sawiya',
    'Madama',
    'Taluza ',
    'Asira ash Shmaliya',
    'Aqraba',
    'Beit Furik',
    'Kafr Qaddum',
    'Awarta',
    'Salim',
    'Qusrah ',
    'Einabus',
    'Duma',
    'Beit Dajan',
    'Jabal Jirzim',
    'Jabal `Aybal',
    'Talfit',
    'Yatma',
    'Iskaka',
    'Yasuf',
    'Asirah Al Qabaliah',
    'al Badhan',
    'Iraq Bourin',
    'Sorrah',
    'Qabalan',
    'Tell',
    'Yazid',
    'Osrien ',
    'Bedia',
    'Jurish',
    'Al-Lubban ash-Sharqiya',
    'An-Naqura',
    'Beita',
    'Orif',
    'Bait Iba',
    'al-Aqrabaniya',
    'An-Najah University old campus',
    'An-Najah University new campus',
    'New Nablus',
    'Bethlehem',
    'al-Khader',
    'Tuqu',
    'Ertas',
    'Husan',
    'Nahhalin',
    'al-Ubeidiya',
    'Al-Walaja',
    'Beit Jala',
    'Beit Sahur',
    'Artas',
    'Battir',
    'Bethlehem University',
    'Jenin',
    'Faqquah',
    'Zababdeh',
    'Ajjah',
    'Fandaqumiya',
    'Rumana',
    'Misilyah',
    'Siris',
    'HaShemiya',
    'Kufeirit ',
    'AL Judeida',
    'Jaba',
    'Silat al-Harithiya',
    'Qabatiya',
    'Kafr Rai',
    'Meithalun',
    'Al-Yamun',
    'Silat ad-Dhahr',
    'Sanur',
    'Borqen',
    "Ya'bad",
    'Jalqamus',
    'Kafr Qud',
    'Anin',
    'Jalbun',
    'Anzah',
    'ar-Rama',
    'Al-arka',
    'Arraneh',
    'Zububa',
    'Arraba',
    'Kafr Dan',
    "Ta'naak",
    'Umm At Tut',
    'Fahmah',
    'Deir Ghazaleh',
    'Raba',
    "Deir abu Da'if",
    'Arab American University',
    'Tulkarm',
    'Seida',
    'Ramin',
    'Kafr Al Labad ',
    'Illar',
    'Dayr al-Ghusun',
    'Qaffin',
    'Zeita',
    'Anabta',
    'Saffarin',
    'Shuweika',
    'Al Jarushiya',
    "Bal'a",
    'Shufa',
    'Al Kafriat',
    'Attil',
    'Ar Ras',
    'Palestine technical university - kadoorie',
    'Bait Lid',
    "Far'un",
    'Tubas',
    'Akkaba',
    'Tayasir',
    'Tamoun',
    'Salfit',
    'Kafr ad Dik',
    'Zawiya',
    'Deir Istiya',
    'Deir Ballut',
    'Bruqin',
    'Kafil haris',
    'Mesha',
    'Khirbet Qeis',
    'qeera',
    'Amurya',
    'Farkha',
    'Rafat',
    'Sarta',
    'Marda',
    'Haris'
  ];

  static const List<String> fuckingAllAr = [
    'غزة',
    'بيت لاهيا',
    'جباليا',
    'رفح',
    'خانيونس',
    'دير البلح',
    'بيت حانون',
    'المغازي',
    'الناصرة',
    'عكا',
    'نهاريا',
    'عسقلان',
    'الخضيرة',
    'حيفا',
    'يافا',
    'طبريا',
    'صفد',
    'شفا عمرو',
    'دير الاسد',
    'طمرة',
    'جبل الجرمق',
    'جبل كنعان',
    'جبل الحيدر',
    'جبل الكرمل',
    'سخنين',
    'بيسان',
    'عسفيا',
    'الناصرة',
    'ام الفحم',
    'فصايل',
    'زبيدات',
    'مرج نعجة',
    'الفشخة',
    'العوجا',
    'الجفتلك',
    'اريحا',
    'قلقيلية',
    'حجة',
    'فرعتا',
    'حبلة',
    'عزون',
    'أماتين',
    'كفر ثلت',
    'سنيريا',
    'جينصافوط',
    'الفندق',
    'كفر لاقف',
    'جيوس',
    'القدس',
    'ابو ديس',
    'بيت لقيا',
    'بيت عنان',
    'بدو',
    'عناتا',
    'صور باهر',
    'مخماس',
    'الرملة',
    'قطنة',
    'بيت صفافا',
    'حزما',
    'الرام',
    'العيزرية',
    'شعفاط',
    'بيت حنينا',
    'جامعة القدس-ابو ديس',
    'رام الله',
    'دمشق',
    'عين يبرود',
    'دير دبوان',
    'الطيبة',
    'عارورة',
    'بيتللو',
    'الجانية',
    'عطارة',
    'كوبر',
    'بيتونيا',
    'سلواد',
    'كفر مالك',
    'بتين',
    'المزرعة الشرقية',
    'بلعين',
    'ترمسعيا',
    'سنجل',
    'بيت لقيا',
    'المغير',
    'عين عريك',
    'عابود',
    'دير عمار',
    'بيت ريما',
    'مزارع النوباني',
    'المزرعة الغربية',
    'عجول',
    'بيت سيرا',
    'دير غسانة',
    'خربة ابو فلاح',
    'البيرة ',
    'دير ابو مشعل ',
    'دير ابزيغ',
    'الجلزون',
    'كفر عين',
    'رمون',
    'بيت عور الفوقا',
    'جفنا',
    'دير جرير',
    'بيت عور التحتا',
    'دير سودان',
    'بير نبالا',
    'عبوين',
    'نعلين',
    'شقبا',
    'تل العاصور',
    'روابي',
    'كفر نعمة',
    'رنتيس',
    'جامعة بيرزيت',
    'جملة',
    'الخليل',
    'جنين',
    'بيت فجار',
    'بيت اولا',
    'بيت امر',
    'حلحول',
    'دورا',
    'سعير',
    'الظاهرية',
    'الشيوخ',
    'الفوار',
    'اذنا',
    'بني نعيم',
    'راس الطيرة',
    'بيت عوا',
    'بيت كاحل',
    'تفوح',
    'العروب',
    'خاراس',
    'ترقوميا',
    'يطا',
    'ديرسامت',
    'رأس الجورة',
    'نوبا',
    'صوريف',
    'السموع',
    'الحرم الابراهيمي',
    'بيت عينون',
    'جامعة الخليل',
    'جامعة البوليتكنيك',
    'نابلس',
    'بيت لحم',
    'برقة',
    'سبسطية',
    'بزاريا',
    'بيت امرين',
    'قوصين',
    'دير شرف',
    'جماعين',
    'بورين',
    'حوارة',
    'جيت',
    'قريوت',
    'الساوية',
    'مادما',
    'طلوزة',
    'عصيرة الشمالية',
    'عقربا',
    'بيت فوريك',
    'كفر قدوم',
    'عورتا',
    'سالم',
    'قصرة',
    'عينبوس',
    'دوما',
    'بيت دجن',
    'جبل جرزيم',
    'جبل عيبال',
    'تلفيت',
    'يتما',
    'اسكاكا',
    'ياسوف',
    'عصيرة القبلية',
    'الباذان',
    'عراق بورين',
    'صرة',
    'قبلان',
    'تل',
    'ياصيد',
    'اوصرين',
    'بديا',
    'جوريش',
    'اللبن الشرقية',
    'الناقورة',
    'بيتا',
    'عوريف',
    'بيت ايبا',
    'العقربانية',
    'جامعة النجاح- الحرم القديم',
    'جامعة النجاح- الحرم الجديد',
    'نابلس الجديدة',
    'بيت لحم',
    'الخضر',
    'تقوع',
    'أرطاس',
    'حوسان',
    'نحالين',
    'العبيدية',
    'الولجة',
    'بيت جالا',
    'بيت ساحور',
    'ارطاس',
    'بتير',
    'جامعة بيت لحم',
    'جنين',
    'فقوعة',
    'الزبابدة',
    'عجة',
    'الفندقومية',
    'رمانه',
    'مسلية',
    'سيريس',
    'الهاشمية',
    'كفيرت',
    'الجديدة',
    'جبع(جنين)',
    'السيلة الحارثية',
    'قباطية',
    'كفر راعي',
    'ميثلون',
    'اليامون',
    'سيلة الظهر',
    'صانور',
    'برقين ',
    'يعبد',
    'جلقموس',
    'كفر قود',
    'عانين',
    'جلبون',
    'عنزة',
    'الرامة',
    'العرقة',
    'عرانة',
    'زبوبا',
    'عرابة',
    'كفر دان',
    'تعنك',
    'ام التوت',
    'فحمة',
    'دير غزالة',
    'رابا',
    'دير ابو ضعيف',
    'الجامعة العربية الامريكية',
    'طولكرم',
    'صيدا',
    'رامين',
    'كفر اللبد',
    'علار',
    'دير الغصون',
    'قفين',
    'زيتا',
    'عنبتا',
    'سفارين',
    'شويكة',
    'الجاروشية',
    'بلعا',
    'شوفة',
    'الكفريات',
    'عتيل',
    'الراس',
    'جامعة خضوري',
    'بيت ليد',
    'فرعون',
    'طوباس',
    'عقابا',
    'تياسير',
    'طمون',
    'سلفيت',
    'كفر الديك',
    'الزاوية',
    'دير استيا',
    'دبر بلوط',
    'بروقين',
    'كفل حارس',
    'مسحة',
    'خربة قيس',
    'قيرة',
    'عمورية',
    'فرخة',
    'رافات',
    'سرطة',
    'مردا',
    'حارس'
  ];

  static const List<String> fuckingAllGeo = [
    '31.5077,34.4607',
    '31.5579,34.49',
    '31.5269,34.4839',
    '31.287,34.2595',
    '31.3402,34.3063',
    '31.4183,34.3502',
    '31.5427,34.5383',
    '31.4183,34.3927',
    '32.6993,35.3048',
    '32.9281,35.0765',
    '33.0059,35.0941',
    '31.6693,34.5715',
    '32.4365,34.9196',
    '32.8184,34.9885',
    '32.0448,34.749',
    '32.7922,35.5312',
    '32.9656,35.5005',
    '32.8058,35.169',
    '32.936,35.27',
    '32.853,35.1987',
    '32.9838,35.4007',
    '31.5542,35.0986',
    '32.955,35.3733',
    '32.7302,35.05005',
    '32.8642,35.2971',
    '32.4973,35.4963',
    '32.7184,35.0651',
    '32.6993,35.3048',
    '32.5216,35.1506',
    '32.0269,35.4439',
    '32.7331,35.1315',
    '32.18505,35.538986',
    '31.7121,35.4705',
    '31.9507,35.4676',
    '32.1607,35.4814',
    '31.8667,35.45',
    '32.1881,34.9679',
    '32.2017,35.1316',
    '32.192,35.1578',
    '32.1652,34.9775',
    '32.1752,35.0563',
    '32.1889,35.1574',
    '32.1532,35.047',
    '32.1285,35.0458',
    '32.1793,35.1272',
    '32.1913,35.1356',
    '32.1815,35.09',
    '32.2013,35.0342',
    '31.769,35.2163',
    '31.7452,35.2656',
    '31.8692,35.0639',
    '31.85,35.1109',
    '31.8348,35.1495',
    '31.8092,35.259',
    '31.7386,35.2268',
    '31.8721,35.2749',
    '31.9292,34.8656',
    '31.8342,35.1184',
    '31.745,35.1976',
    '31.8286,35.2623',
    '31.8492,35.2684',
    '31.7696,35.255',
    '31.8133,35.2311',
    '31.8348,35.2275',
    '31.6715,35.1377',
    '31.8988,35.1954',
    '31.9160,35.1860',
    '31.9529,35.2522',
    '31.9102,35.2691',
    '31.9545,35.3002',
    '32.045,35.1762',
    '31.9741,35.1162',
    '31.9383,35.1308',
    '32.3256,35.1623',
    '31.9868,35.1559',
    '31.8952,35.1691',
    '31.9801,35.2606',
    '31.9884,35.3093',
    '31.9293,35.2418',
    '32.0183,35.2564',
    '31.9284,35.072',
    '32.0333,35.2904',
    '32.0333,35.2655',
    '31.8692,35.0639',
    '32.0194,35.3458',
    '31.9061,35.1425',
    '32.0161,35.0663',
    '31.9655,35.0999',
    '32.0319,35.1041',
    '32.0487,35.1666',
    '31.954,35.1612',
    '32.0225,35.1805',
    '31.8929,35.0569',
    '32.0465,35.0973',
    '32.0168,35.3014',
    '31.8914,35.2112',
    '31.9956,35.0656',
    '31.9173,35.121',
    '31.9515,35.2115',
    '32.0476,35.1204',
    '31.9334,35.2982',
    '31.885,35.115',
    '31.9619,35.2134',
    '31.9657,35.2917',
    '31.8957,35.0903',
    '32.0321,35.1484',
    '31.8508,35.2036',
    '32.0314,35.1999',
    '31.9475,35.0203',
    '31.987,35.0401',
    '31.9794,35.2794',
    '31.9915,35.1913',
    '31.9254,35.0972',
    '32.028,35.0188',
    '31.9592,35.1833',
    '31.9719,35.0912',
    '31.5294,35.0938',
    '32.4619,35.2976',
    '31.6306,35.1765',
    '31.5999,35.0029',
    '31.6197,35.105',
    '31.5803,35.1018',
    '31.5066,35.0264',
    '31.5829,35.1452',
    '31.4077,34.971',
    '31.575,35.1494',
    '31.4784,35.0655',
    '31.5584,34.9761',
    '31.5159,35.1642',
    '32.1617,35.0102',
    '31.5091,34.9494',
    '31.5709,35.0663',
    '31.5369,35.0483',
    '31.6214,35.1394',
    '31.6148,35.0417',
    '31.5761,34.9995',
    '31.4528,35.1205',
    '31.5209,34.9733',
    '31.5555,35.1005',
    '31.6058,35.0365',
    '31.6308,35.0791',
    '31.3991,35.067',
    '31.5249,35.1108',
    '31.5587,35.1244',
    '31.5503,35.0934',
    '31.5085,35.0923',
    '32.2211,35.2544',
    '31.7049,35.2038',
    '32.3018,35.1926',
    '32.2758,35.1952',
    '32.3087,35.1621',
    '32.2923,35.2147',
    '32.2375,35.1854',
    '32.2527,35.1875',
    '32.1316,35.204',
    '32.1832,35.2501',
    '32.1578,35.2598',
    '32.2143,35.1708',
    '32.0707,35.2937',
    '32.0854,35.2581',
    '32.1859,35.2311',
    '32.2764,35.323',
    '32.2707,35.3047',
    '32.125,35.3455',
    '32.1759,35.3362',
    '32.2216,35.1447',
    '32.1611,35.2839',
    '32.2096,35.3303',
    '32.0854,35.3301',
    '32.1488,35.2465',
    '32.056,35.3661',
    '32.1917,35.373',
    '32.2006,35.2733',
    '32.2355,35.2696',
    '32.0866,35.2909',
    '32.1089,35.2691',
    '32.1036,35.2247',
    '32.1084,35.2378',
    '31.8354,35.1294',
    '32.2586,35.3325',
    '32.2022,35.2383',
    '32.2107,35.1903',
    '32.1018,35.2894',
    '32.2007,35.2129',
    '32.2965,35.2782',
    '32.1262,35.3111',
    '32.1147,35.0756',
    '32.1017,35.3232',
    '32.0701,35.2403',
    '32.2644,35.2004',
    '32.1423,35.2857',
    '32.1594,35.2253',
    '32.2385,35.2129',
    '32.2523,35.3784',
    '32.2204,35.2531',
    '32.2271,35.231',
    '32.2071,35.2441',
    '31.7049,35.2038',
    '31.6941,35.1668',
    '31.6371,35.2127',
    '31.6908,35.192',
    '31.7093,35.1347',
    '31.6852,35.1206',
    '31.717,35.2901',
    '31.7326,35.1619',
    '31.7136,35.1865',
    '31.702,35.2269',
    '31.6905,35.1875',
    '31.7195,35.141',
    '31.7106,35.2014',
    '32.4619,35.2976',
    '32.4898,35.4018',
    '32.3867,35.3241',
    '32.36,35.198',
    '32.3194,35.2036',
    '32.5235,35.2138',
    '32.3859,35.2857',
    '32.3262,35.2896',
    '32.4652,35.2213',
    '32.4438,35.2018',
    '32.3354,35.3011',
    '31.8576,35.2540',
    '32.5085,35.2275',
    '32.4177,35.2688',
    '32.374,35.1545',
    '32.3488,35.2719',
    '32.4856,35.2301',
    '32.3241,35.182',
    '32.3563,35.2457',
    '32.4559,35.2608',
    '32.4457,35.1682',
    '32.4246,35.3642',
    '32.4566,35.2265',
    '32.5026,35.1667',
    '32.4596,35.4152',
    '32.3592,35.2201',
    '32.3592,35.1712',
    '32.4674,35.2091',
    '32.4973,35.3246',
    '32.5437,35.222',
    '32.4052,35.2019',
    '32.4785,35.2543',
    '32.5199,35.2204',
    '32.3351,35.1182',
    '32.3829,35.1791',
    '32.4952,35.3503',
    '32.3875,35.3825',
    '32.4563,35.3483',
    '32.3892,35.3238',
    '32.3199,35.094',
    '32.3849,35.1186',
    '32.2852,35.1495',
    '32.2997,35.1096',
    '32.37,35.1074',
    '32.3524,35.0769',
    '32.4327,35.0827',
    '32.3889,35.0786',
    '32.3079,35.1169',
    '32.2612,35.1097',
    '31.4015,34.9915',
    '32.347,35.0501',
    '32.3311,35.1117',
    '32.2755,35.0814',
    '32.2248,35.0472',
    '32.3697,35.0718',
    '32.2514,35.0636',
    '32.3134,35.0224',
    '32.2596,35.1334',
    '32.2861,35.0233',
    '32.3211,35.3689',
    '32.4482,35.0816',
    '32.3404,35.396',
    '32.2832,35.3817',
    '32.0837,35.1808',
    '32.0675,35.0802',
    '32.0963,35.0398',
    '32.1307,35.1386',
    '32.0648,35.0255',
    '32.0722,35.0994',
    '32.1192,35.1548',
    '32.1084,35.047',
    '32.0619,35.1779',
    '32.1248,35.1678',
    '32.0631,35.2099',
    '32.0688,35.1529',
    '31.8699,35.1968',
    '32.1039,35.0941',
    '32.1134,35.1944',
    '32.1135,35.1411'
  ];
}
