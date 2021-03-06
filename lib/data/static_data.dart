import 'package:hiring_app/utils/strings.dart';

class StaticData {
  static const List<String> role = [
    AppStrings.candidate,
    AppStrings.recruiter,
  ];

  static const List<String> gender = [
    AppStrings.male,
    AppStrings.female,
  ];

  static const List<String> iAm = [
    AppStrings.fresher,
    AppStrings.experienced,
  ];

  static const List<String> sector = [
    AppStrings.government,
    AppStrings.semiGovernment,
    AppStrings.private,
  ];

  static const List<String> jobType = [
    AppStrings.fullTime,
    AppStrings.partTime,
    AppStrings.contract,
    AppStrings.internship,
  ];

  static const List<String> jobCulture = [
    AppStrings.onSite,
    AppStrings.remote,
    AppStrings.hybrid,
  ];

  static const List<String> payRange = [
    '0-2 LPA',
    '2-5 LPA',
    '5-10 LPA',
    '10-20 LPA',
    '20-50 LPA',
    '50+ LPA',
  ];

  static const List<String> employees = [
    '1-10 Employees',
    '10-50 Employees',
    '50-200 Employees',
    '200-500 Employees',
    '500-1000 Employees',
    '1000+ Employees'
  ];

  static const List<String> city = [
    'Abohar',
    'Abu',
    'Addanki',
    'Adilābād',
    'Ādoni',
    'Agartala',
    'Āgra',
    'Ahmadnagar',
    'Ahmedabad',
    'Āīzawl',
    'Ajmer',
    'Akola',
    'Alīgarh',
    'Alīpur Duār',
    'Allahābād',
    'Alleppey',
    'Alwar',
    'Amalāpuram',
    'Ambāla',
    'Amrāvati',
    'Amritsar',
    'Amudālavalasa',
    'Anakāpalle',
    'Anantapur',
    'Angamāli',
    'Armūr',
    'Āsansol',
    'Aurangābād',
    'Badvel',
    'Baharampur',
    'Bahraigh',
    'Baidyabāti',
    'Bāli',
    'Bālurghāt',
    'Bandipura',
    'Bangalore',
    'Bangaon',
    'Bānkura',
    'Bānsbāria',
    'Bāpatla',
    'Bāramūla',
    'Bārāsat',
    'Barddhamān',
    'Bareilly',
    'Basīrhat',
    'Begusarai',
    'Belampalli',
    'Belgaum',
    'Bellary',
    'Bezwāda',
    'Bhadreswar',
    'Bhāgalpur',
    'Bhainsa',
    'Bharatpur',
    'Bhātpāra',
    'Bhāvnagar',
    'Bhayandar',
    'Bhilai',
    'Bhīlwāra',
    'Bhīmavaram',
    'Bhīmunipatnam',
    'Bhiwandi',
    'Bhiwāni',
    'Bhopāl',
    'Bhubaneshwar',
    'Bhuj',
    'Bhusāval',
    'Bīdar',
    'Bijāpur',
    'Bīkaner',
    'Bilāspur',
    'Bobbili',
    'Bodhan',
    'Bodupāl',
    'Brahmapur',
    'Budaun',
    'Bulandshahr',
    'Burhānpur',
    'Calicut',
    'Cawnpore',
    'Chakradharpur',
    'Champdani',
    'Chānda',
    'Chandannagar',
    'Chandīgarh',
    'Channarāyapatna',
    'Chennai',
    'Chicacole',
    'Chilakalūrupet',
    'Chimākurti',
    'Chinchvad',
    'Chīrāla',
    'Chittaurgarh',
    'Chittoor',
    'Coimbatore',
    'Conjeeveram',
    'Cuddalore',
    'Cuddapah',
    'Curchorem',
    'Cuttack',
    'Dam Dam',
    'Damān',
    'Darjeeling',
    'Davangere',
    'Dehra Dūn',
    'Delhi',
    'Deo',
    'Devarkonda',
    'Dhanbād',
    'Dharmavaram',
    'Dholka',
    'Dhūlia',
    'Dibrugarh',
    'Dindigul',
    'Dispur',
    'Diu',
    'Drug',
    'Durgāpur',
    'Dwārka',
    'Ellore',
    'Emmiganūr',
    'Erode',
    'Etāwah',
    'Farīdābād',
    'Fatehpur Sīkri',
    'Fatehpur',
    'Fīrozābād',
    'Fyzābād',
    'Gadwāl',
    'Gangtok',
    'Gauripur',
    'Gaya',
    'Ghāndīnagar',
    'Ghāziābād',
    'Giddalūr',
    'Godhra',
    'Gorakhpur',
    'Gudivāda',
    'Gulbarga',
    'Guntakal',
    'Guntūr',
    'Gurgaon',
    'Guwāhāti',
    'Gwalior',
    'Hābra',
    'Haldia',
    'Hālīsahar',
    'Handwāra',
    'Hāora',
    'Hāpur',
    'Harīpur',
    'Hassan',
    'Hāthras',
    'Hindupur',
    'Hisar',
    'Hospet',
    'Hubli',
    'Hugli',
    'Hyderābād',
    'Ichalkaranji',
    'Imphāl',
    'Indore',
    'Ingrāj Bāzār',
    'Itānagar',
    'Jabalpur',
    'Jaggayyapeta',
    'Jagtiāl',
    'Jaipur',
    'Jaisalmer',
    'Jalandhar',
    'Jalgaon',
    'Jalor',
    'Jalpāiguri',
    'Jammalamadugu',
    'Jammu',
    'Jāmnagar',
    'Jamshedpur',
    'Jāmuria',
    'Jangaon',
    'Jasdan',
    'Jatani',
    'Jaunpur',
    'Jaynagar-Majilpur',
    'Jhānsi',
    'Jodhpur',
    'Jorhāt',
    'Junnar',
    'Kadiri',
    'Kagaznāgār',
    'Kairāna',
    'Kākināda',
    'Kalyān',
    'Kalyani',
    'Kāmāreddipet',
    'Kāmārhāti',
    'Kānchrāpāra',
    'Kandukūr',
    'Karīmnagar',
    'Karnāl',
    'Karūr',
    'Kāvali',
    'Kavaratti',
    'Khajurāho',
    'Khambhāt',
    'Khammam',
    'Kharagpur',
    'Khardah',
    'Khed Brahma',
    'Kochi',
    'Kodaikānal',
    'Kohīma',
    'Koilkuntla',
    'Kolār',
    'Kolhāpur',
    'Kolkāta',
    'Koratla',
    'Kota',
    'Kothāpet',
    'Kottagūdem',
    'Kovvūr',
    'Krishnanagar',
    'Kulgam',
    'Kulti',
    'Kumbakonam',
    'Kurnool',
    'Lātūr',
    'Lucknow',
    'Ludhiāna',
    'Mācherla',
    'Machilīpatnam',
    'Madanapalle',
    'Madhyamgram',
    'Madurai',
    'Mahbūbnagar',
    'Mahesāna',
    'Maihar',
    'Malaut',
    'Mālegaon',
    'Mancherāl',
    'Mandamāri',
    'Mandapeta',
    'Mandsaur',
    'Mandya',
    'Mangalagiri',
    'Mangalore',
    'Mangūr',
    'Mārkāpur',
    'Mathura',
    'Mauli',
    'Medinīpur',
    'Meerut',
    'Metpalli',
    'Mirzāpur',
    'Morādābād',
    'Mumbai',
    'Muzaffarnagar',
    'Muzaffarpur',
    'Mysore',
    'Nagari',
    'Nāgercoil',
    'Nāgpur',
    'Naihāti',
    'Naini Tal',
    'Nalgonda',
    'Nānded',
    'Nāndod',
    'Nandyāl',
    'Narasannapeta',
    'Narasapur',
    'Narasaraopet',
    'Nāsik',
    'Navadwīp',
    'Navsāri',
    'Negapatam',
    'Nellore',
    'New Delhi',
    'Nidadavole',
    'Nizāmābād',
    'Ongole',
    'Ootacamund',
    'Osmānābād',
    'Pālakollu',
    'Pālghāt',
    'Pāli',
    'Palmaner',
    'Pāloncha',
    'Pāmidi',
    'Panaji',
    'Panchkula',
    'Pānihāti',
    'Pānīpat',
    'Parbhani',
    'Pathanāmthitta',
    'Pathānkot',
    'Patiāla',
    'Patna',
    'Pedana',
    'Pīlibhīt',
    'Pithāpuram',
    'Ponnūru',
    'Porbandar',
    'Port Blair',
    'Proddatūr',
    'Puducherry',
    'Pulivendla',
    'Pune',
    'Punganūru',
    'Puri',
    'Purnea',
    'Puttūr',
    'Quilon',
    'Rāichūr',
    'Rāiganj',
    'Raipur',
    'Rājahmundry',
    'Rajaori',
    'Rājapālaiyam',
    'Rājgīr',
    'Rājkot',
    'Rāmeswaram',
    'Rāmgundam',
    'Rāmpur',
    'Rānchi',
    'Ratlām',
    'Raurkela',
    'Rāyachoti',
    'Repalle',
    'Rishra',
    'Rohtak',
    'Sahāranpur',
    'Saharsa',
    'Salem',
    'Sāmalkot',
    'Sambalpur',
    'Sambhal',
    'Sāngli',
    'Sannai',
    'Sattenapalle',
    'Saugor',
    'Secunderābād',
    'Shāhjānpur',
    'Shāntipur',
    'Shiliguri',
    'Shillong',
    'Shimla',
    'Shimoga',
    'Shrīrāmpur',
    'Shrīrangapattana',
    'Sihor',
    'Sīkar',
    'Silchar',
    'Silvassa',
    'Sirsa',
    'Sirsilla',
    'Sitalpur',
    'Solan',
    'Solāpur',
    'Sonīpat',
    'Sopur',
    'Srīnagar',
    'Sūrat',
    'Suriāpet',
    'Tādepalle',
    'Tādepallegūdem',
    'Tādpatri',
    'Tanjore',
    'Tanuku',
    'Tenāli',
    'Tezpur',
    'Thāne',
    'Thiruvananthapuram',
    'Tinnevelly',
    'Tirupati',
    'Tiruppūr',
    'Tiruvannāmalai',
    'Titāgarh',
    'Tonk',
    'Trichinopoly',
    'Trichūr',
    'Tumkūr',
    'Tuni',
    'Tuticorin',
    'Udaipur',
    'Udhampur',
    'Udipi',
    'Ujjain',
    'Ulhāsnagar',
    'Uluberiya',
    'Umaria',
    'Uran',
    'Vadodara',
    'Vālpārai',
    'Vārānasi',
    'Vellore',
    'Venkatagiri',
    'Vidisha',
    'Vikārābād',
    'Vinukonda',
    'Vishākhapatnam',
    'Vizianagaram',
    'Vrindāvan',
    'Wanparti',
    'Warangal',
    'Yavatmāl',
    'Yellandu',
  ];
}
