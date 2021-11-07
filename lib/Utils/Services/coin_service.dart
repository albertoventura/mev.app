import 'package:mev_app/Utils/Models/coin_model.dart';

class CoinService {
  List<Coin> coins;
  var coinsObj = [
    //http://fixer.io
    {"symbol": "AED", "description": "United Arab Emirates Dirham"}, //د.إ
    {"symbol": "AFN", "description": "Afghan Afghani"}, //؋
    {"symbol": "ALL", "description": "Albanian Lek"}, //L
    {"symbol": "AMD", "description": "Armenian Dram"}, //֏
    {"symbol": "ANG", "description": "Netherlands Antillean Guilder"}, //ƒ
    {"symbol": "AOA", "description": "Angolan Kwanza"}, //Kz
    {"symbol": "ARS", "description": "Argentine Peso"}, //$
    {"symbol": "AUD", "description": "Australian Dollar"}, //$
    {"symbol": "AWG", "description": "Aruban Florin"}, //ƒ
    {"symbol": "AZN", "description": "Azerbaijani Manat"}, //₼
    {
      "symbol": "BAM",
      "description": "Bosnia-Herzegovina Convertible Mark"
    }, //KM
    {"symbol": "BBD", "description": "Barbadian Dollar"}, //Bds $
    {"symbol": "BDT", "description": "Bangladeshi Taka"}, //৳
    {"symbol": "BGN", "description": "Bulgarian Lev"}, //лв
    {"symbol": "BHD", "description": "Bahraini Dinar"}, //.د.ب
    {"symbol": "BIF", "description": "Burundian Franc"}, //FBu
    {"symbol": "BMD", "description": "Bermudan Dollar"}, //$
    {"symbol": "BND", "description": "Brunei Dollar"}, //B$
    {"symbol": "BOB", "description": "Bolivian Boliviano"}, //$b
    {"symbol": "BRL", "description": "Brazilian Real"}, //R$
    {"symbol": "BSD", "description": "Bahamian Dollar"}, //B$
    {"symbol": "BTC", "description": "Bitcoin"}, //₿
    {"symbol": "BTN", "description": "Bhutanese Ngultrum"}, //Nu.
    {"symbol": "BWP", "description": "Botswanan Pula"}, //P
    {"symbol": "BYR", "description": "Belarusian Ruble"}, //Br
    {"symbol": "BYN", "description": "New Belarusian Ruble"}, //Br
    {"symbol": "BZD", "description": "Belize Dollar"}, //BZ$
    {"symbol": "CAD", "description": "Canadian Dollar"}, //$
    {"symbol": "CDF", "description": "Congolese Franc"}, //FC
    {"symbol": "CHF", "description": "Swiss Franc"},
    {"symbol": "CLF", "description": "Chilean Unit of Account (UF)"},
    {"symbol": "CLP", "description": "Chilean Peso"}, //$
    {"symbol": "CNY", "description": "Chinese Yuan"}, //¥
    {"symbol": "COP", "description": "Colombian Peso"}, //$
    {"symbol": "CRC", "description": "Costa Rican Colón"}, //₡
    {"symbol": "CUC", "description": "Cuban Convertible Peso"}, //$
    {"symbol": "CUP", "description": "Cuban Peso"}, //	₱
    {"symbol": "CVE", "description": "Cape Verdean Escudo"}, //$
    {"symbol": "CZK", "description": "Czech Republic Koruna"}, //Kč
    {"symbol": "DJF", "description": "Djiboutian Franc"}, //Fdj
    {"symbol": "DKK", "description": "Danish Krone"}, //kr
    {"symbol": "DOP", "description": "Dominican Peso"}, //RD$
    {"symbol": "DZD", "description": "Algerian Dinar"}, //د. ج
    {"symbol": "EGP", "description": "Egyptian Pound"}, //E£
    {"symbol": "ERN", "description": "Eritrean Nakfa"},
    {"symbol": "ETB", "description": "Ethiopian Birr"},
    {"symbol": "EUR", "description": "Euro"},
    {"symbol": "FJD", "description": "Fijian Dollar"},
    {"symbol": "FKP", "description": "Falkland Islands Pound"},
    {"symbol": "GBP", "description": "British Pound Sterling"},
    {"symbol": "GEL", "description": "Georgian Lari"},
    {"symbol": "GGP", "description": "Guernsey Pound"},
    {"symbol": "GHS", "description": "Ghanaian Cedi"},
    {"symbol": "GIP", "description": "Gibraltar Pound"},
    {"symbol": "GMD", "description": "Gambian Dalasi"},
    {"symbol": "GNF", "description": "Guinean Franc"},
    {"symbol": "GTQ", "description": "Guatemalan Quetzal"},
    {"symbol": "GYD", "description": "Guyanaese Dollar"},
    {"symbol": "HKD", "description": "Hong Kong Dollar"},
    {"symbol": "HNL", "description": "Honduran Lempira"},
    {"symbol": "HRK", "description": "Croatian Kuna"},
    {"symbol": "HTG", "description": "Haitian Gourde"},
    {"symbol": "HUF", "description": "Hungarian Forint"},
    {"symbol": "IDR", "description": "Indonesian Rupiah"},
    {"symbol": "ILS", "description": "Israeli New Sheqel"},
    {"symbol": "IMP", "description": "Manx pound"},
    {"symbol": "INR", "description": "Indian Rupee"},
    {"symbol": "IQD", "description": "Iraqi Dinar"},
    {"symbol": "IRR", "description": "Iranian Rial"},
    {"symbol": "ISK", "description": "Icelandic Króna"},
    {"symbol": "JEP", "description": "Jersey Pound"},
    {"symbol": "JMD", "description": "Jamaican Dollar"},
    {"symbol": "JOD", "description": "Jordanian Dinar"},
    {"symbol": "JPY", "description": "Japanese Yen"},
    {"symbol": "KES", "description": "Kenyan Shilling"},
    {"symbol": "KGS", "description": "Kyrgystani Som"},
    {"symbol": "KHR", "description": "Cambodian Riel"},
    {"symbol": "KMF", "description": "Comorian Franc"},
    {"symbol": "KPW", "description": "North Korean Won"},
    {"symbol": "KRW", "description": "South Korean Won"},
    {"symbol": "KWD", "description": "Kuwaiti Dinar"},
    {"symbol": "KYD", "description": "Cayman Islands Dollar"},
    {"symbol": "KZT", "description": "Kazakhstani Tenge"},
    {"symbol": "LAK", "description": "Laotian Kip"},
    {"symbol": "LBP", "description": "Lebanese Pound"},
    {"symbol": "LKR", "description": "Sri Lankan Rupee"},
    {"symbol": "LRD", "description": "Liberian Dollar"},
    {"symbol": "LSL", "description": "Lesotho Loti"},
    {"symbol": "LTL", "description": "Lithuanian Litas"},
    {"symbol": "LVL", "description": "Latvian Lats"},
    {"symbol": "LYD", "description": "Libyan Dinar"},
    {"symbol": "MAD", "description": "Moroccan Dirham"},
    {"symbol": "MDL", "description": "Moldovan Leu"},
    {"symbol": "MGA", "description": "Malagasy Ariary"},
    {"symbol": "MKD", "description": "Macedonian Denar"},
    {"symbol": "MMK", "description": "Myanma Kyat"},
    {"symbol": "MNT", "description": "Mongolian Tugrik"},
    {"symbol": "MOP", "description": "Macanese Pataca"},
    {"symbol": "MRO", "description": "Mauritanian Ouguiya"},
    {"symbol": "MUR", "description": "Mauritian Rupee"},
    {"symbol": "MVR", "description": "Maldivian Rufiyaa"},
    {"symbol": "MWK", "description": "Malawian Kwacha"},
    {"symbol": "MXN", "description": "Mexican Peso"},
    {"symbol": "MYR", "description": "Malaysian Ringgit"},
    {"symbol": "MZN", "description": "Mozambican Metical"},
    {"symbol": "NAD", "description": "Namibian Dollar"},
    {"symbol": "NGN", "description": "Nigerian Naira"},
    {"symbol": "NIO", "description": "Nicaraguan Córdoba"},
    {"symbol": "NOK", "description": "Norwegian Krone"},
    {"symbol": "NPR", "description": "Nepalese Rupee"},
    {"symbol": "NZD", "description": "New Zealand Dollar"},
    {"symbol": "OMR", "description": "Omani Rial"},
    {"symbol": "PAB", "description": "Panamanian Balboa"},
    {"symbol": "PEN", "description": "Peruvian Nuevo Sol"},
    {"symbol": "PGK", "description": "Papua New Guinean Kina"},
    {"symbol": "PHP", "description": "Philippine Peso"},
    {"symbol": "PKR", "description": "Pakistani Rupee"},
    {"symbol": "PLN", "description": "Polish Zloty"},
    {"symbol": "PYG", "description": "Paraguayan Guarani"},
    {"symbol": "QAR", "description": "Qatari Rial"},
    {"symbol": "RON", "description": "Romanian Leu"},
    {"symbol": "RSD", "description": "Serbian Dinar"},
    {"symbol": "RUB", "description": "Russian Ruble"},
    {"symbol": "RWF", "description": "Rwandan Franc"},
    {"symbol": "SAR", "description": "Saudi Riyal"},
    {"symbol": "SBD", "description": "Solomon Islands Dollar"},
    {"symbol": "SCR", "description": "Seychellois Rupee"},
    {"symbol": "SDG", "description": "Sudanese Pound"},
    {"symbol": "SEK", "description": "Swedish Krona"},
    {"symbol": "SGD", "description": "Singapore Dollar"},
    {"symbol": "SHP", "description": "Saint Helena Pound"},
    {"symbol": "SLL", "description": "Sierra Leonean Leone"},
    {"symbol": "SOS", "description": "Somali Shilling"},
    {"symbol": "SRD", "description": "Surinamese Dollar"},
    {"symbol": "STD", "description": "São Tomé and Príncipe Dobra"},
    {"symbol": "SVC", "description": "Salvadoran Colón"},
    {"symbol": "SYP", "description": "Syrian Pound"},
    {"symbol": "SZL", "description": "Swazi Lilangeni"},
    {"symbol": "THB", "description": "Thai Baht"},
    {"symbol": "TJS", "description": "Tajikistani Somoni"},
    {"symbol": "TMT", "description": "Turkmenistani Manat"},
    {"symbol": "TND", "description": "Tunisian Dinar"},
    {"symbol": "TOP", "description": "Tongan Paʻanga"},
    {"symbol": "TRY", "description": "Turkish Lira"},
    {"symbol": "TTD", "description": "Trinidad and Tobago Dollar"},
    {"symbol": "TWD", "description": "New Taiwan Dollar"},
    {"symbol": "TZS", "description": "Tanzanian Shilling"},
    {"symbol": "UAH", "description": "Ukrainian Hryvnia"},
    {"symbol": "UGX", "description": "Ugandan Shilling"},
    {"symbol": "USD", "description": "United States Dollar"},
    {"symbol": "UYU", "description": "Uruguayan Peso"},
    {"symbol": "UZS", "description": "Uzbekistan Som"},
    {"symbol": "VEF", "description": "Venezuelan Bolívar Fuerte"},
    {"symbol": "VND", "description": "Vietnamese Dong"},
    {"symbol": "VUV", "description": "Vanuatu Vatu"},
    {"symbol": "WST", "description": "Samoan Tala"},
    {"symbol": "XAF", "description": "CFA Franc BEAC"},
    {"symbol": "XAG", "description": "Silver (troy ounce)"},
    {"symbol": "XAU", "description": "Gold (troy ounce)"},
    {"symbol": "XCD", "description": "East Caribbean Dollar"},
    {"symbol": "XDR", "description": "Special Drawing Rights"},
    {"symbol": "XOF", "description": "CFA Franc BCEAO"},
    {"symbol": "XPF", "description": "CFP Franc"},
    {"symbol": "YER", "description": "Yemeni Rial"},
    {"symbol": "ZAR", "description": "South African Rand"},
    {"symbol": "ZMK", "description": "Zambian Kwacha (pre-2013)"},
    {"symbol": "ZMW", "description": "Zambian Kwacha"},
    {"symbol": "ZWL", "description": "Zimbabwean Dollar"}
  ];

  List<Coin> listAll() {
    coins = [];

    coinsObj.forEach((c) {
      Coin coin = new Coin();
      coin.symbol = c['symbol'];
      coin.description = c['description'];
      coin.isfav = false;
      this.coins.add(coin);
    });
    return coins;
  }
}
