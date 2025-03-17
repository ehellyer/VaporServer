//
//  CountryCode.swift
//  Membership
//
//  Created by Ed Hellyer on 8/31/24.
//

import Foundation
import Vapor

/// Country codes that represent countries, dependent territories, and special areas of geographical interest.
///
/// Standards as published by the International Organization for Standardization (ISO)
///
/// [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3)
///
/// [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)
enum CountryCode: String, CaseIterable, Codable, Content {
    
    /// Aruba 🇦🇼
    case ABW = "ABW"
    
    /// Afghanistan 🇦🇫
    case AFG = "AFG"
    
    /// Republic of Angola 🇦🇴
    case AGO = "AGO"
    
    /// Anguilla 🇦🇮
    case AIA = "AIA"
    
    /// Åland Islands 🇦🇽
    case ALA = "ALA"
    
    /// Albania 🇦🇱
    case ALB = "ALB"
    
    /// Andorra 🇦🇩
    case AND = "AND"
    
    /// Netherlands Antilles - Dissolved into two separate territories in 2010. Curaçao (CUW) and Sint Maarten (SXM).
    //case ANT = "ANT"
    
    /// United Arab Emirates 🇦🇪
    case ARE = "ARE"
    
    /// Argentina 🇦🇷
    case ARG = "ARG"
    
    /// Armenia 🇦🇲
    case ARM = "ARM"
    
    /// American Samoa 🇦🇸
    case ASM = "ASM"
    
    /// Antartica (No flag)
    case ATA
    
    /// French Southern Territories 🇹🇫
    case ATF = "ATF"
    
    /// Antigua and Barbuda 🇦🇬
    case ATG = "ATG"
    
    /// Australia🦘 🇦🇺
    case AUS = "AUS"
    
    /// Austria 🇦🇹
    case AUT = "AUT"
    
    /// Azerbaijan 🇦🇿
    case AZE = "AZE"
    
    /// Burundi 🇧🇮
    case BDI = "BDI"
    
    /// Belgium 🇧🇪
    case BEL = "BEL"
    
    /// Benin 🇧🇯
    case BEN = "BEN"
    
    /// Bonaire, Sint Eustatius and Saba (aka The Caribbean Netherlands) 🇧🇶
    case BES = "BES"
    
    /// Burkina Faso 🇧🇫
    case BFA = "BFA"
    
    /// Bangladesh 🇧🇩
    case BGD = "BGD"
    
    /// Bulgaria 🇧🇬
    case BGR = "BGR"
    
    /// Bahrain 🇧🇭
    case BHR = "BHR"
    
    /// Bahamas 🇧🇸
    case BHS = "BHS"
    
    /// Bosnia and Herzegovina 🇧🇦
    case BIH = "BIH"
    
    /// Saint-Barthélemy 🇧🇱
    case BLM = "BLM"
    
    /// Belarus 🇧🇾
    case BLR = "BLR"
    
    /// Belize 🇧🇿
    case BLZ = "BLZ"
    
    /// Bermuda 🇧🇲
    case BMU = "BMU"
    
    /// Bolivia (Plurinational State of Bolivia) 🇧🇴
    case BOL = "BOL"
    
    /// Brazil 🇧🇷
    case BRA = "BRA"
    
    /// Barbados 🇧🇧
    case BRB = "BRB"
    
    /// Brunei 🇧🇳
    case BRN = "BRN"
    
    /// Bhutan 🇧🇹
    case BTN = "BTN"
    
    /// Botswana 🇧🇼
    case BWA = "BWA"
    
    /// Central African Republic 🇨🇫
    case CAF = "CAF"
    
    /// Canada🍁 🇨🇦
    case CAN = "CAN"
    
    /// Cocos (Keeling) Islands 🇨🇨
    case CCK = "CCK"
    
    /// Switzerland 🇨🇭
    case CHE = "CHE"
    
    /// Chile 🇨🇱
    case CHL = "CHL"
    
    /// China 🇨🇳
    case CHN = "CHN"
    
    /// Ivory Coast (Côte d'Ivoire) 🇨🇮
    case CIV = "CIV"
    
    /// Cameroon 🇨🇲
    case CMR = "CMR"
    
    /// Democratic Republic of the Congo 🇨🇩
    case COD = "COD"
    
    /// Republic of the Congo 🇨🇩
    case COG = "COG"
    
    /// Cook Islands 🇨🇰
    case COK = "COK"
    
    /// Colombia 🇨🇴
    case COL = "COL"
    
    /// Comoros 🇰🇲
    case COM = "COM"
    
    /// Cape Verde 🇨🇻
    case CPV = "CPV"
    
    /// Costa Rica 🇨🇷
    case CRI = "CRI"
    
    /// Cuba 🇨🇺
    case CUB = "CUB"
    
    /// Curaçao 🇨🇼
    case CUW = "CUW"
    
    /// Christmas Island 🇨🇽
    case CXR = "CXR"
    
    /// Cayman Islands 🇰🇾
    case CYM = "CYM"
    
    /// Cyprus 🇨🇾
    case CYP = "CYP"
    
    /// Czech Republic 🇨🇿
    case CZE = "CZE"
    
    /// Germany 🇩🇪
    case DEU = "DEU"
    
    /// Djibouti 🇩🇯
    case DJI = "DJI"
    
    /// Dominica 🇩🇲
    case DMA = "DMA"
    
    /// Denmark 🇩🇰
    case DNK = "DNK"
    
    /// Dominican Republic 🇩🇴
    case DOM = "DOM"
    
    /// Algeria 🇩🇿
    case DZA = "DZA"
    
    /// Ecuador 🇪🇨
    case ECU = "ECU"
    
    /// Egypt 🇪🇬
    case EGY = "EGY"
    
    /// Eritrea 🇪🇷
    case ERI = "ERI"
    
    /// Western Sahara 🇪🇭
    case ESH = "ESH"
    
    /// Spain 🇪🇸
    case ESP = "ESP"
    
    /// Estonia 🇪🇪
    case EST = "EST"
    
    /// Ethiopia 🇪🇹
    case ETH = "ETH"
    
    /// Finland 🇫🇮
    case FIN = "FIN"
    
    /// Fiji 🇫🇯
    case FJI = "FJI"
    
    /// Falkland Islands 🇫🇰
    case FLK = "FLK"
    
    /// France
    case FRA = "FRA"
    
    /// Faroe Islands 🇫🇴
    case FRO = "FRO"
    
    /// Micronesia 🇫🇲
    case FSM = "FSM"
    
    /// Gabon 🇬🇦
    case GAB = "GAB"
    
    /// United Kingdom 🇬🇧
    case GBR = "GBR"
    
    /// Georgia 🇬🇪
    case GEO = "GEO"
    
    /// Guernsey
    case GGY = "GGY"
    
    /// Ghana 🇬🇭
    case GHA = "GHA"
    
    /// Gibraltar 🇬🇮
    case GIB = "GIB"
    
    /// Guinea 🇬🇳
    case GIN = "GIN"
    
    /// Guadeloupe 🇬🇵
    case GLP = "GLP"
    
    /// Gambia 🇬🇲
    case GMB = "GMB"
    
    /// Guinea-Bissau 🇬🇼
    case GNB = "GNB"
    
    /// Equatorial Guinea 🇬🇶
    case GNQ = "GNQ"
    
    /// Greece 🇬🇷
    case GRC = "GRC"
    
    /// Grenada 🇬🇩
    case GRD = "GRD"
    
    /// Greenland 🇬🇱
    case GRL = "GRL"
    
    /// Guatemala 🇬🇹
    case GTM = "GTM"
    
    /// French Guiana 🇬🇫
    case GUF = "GUF"
    
    /// Guam 🇬🇺
    case GUM = "GUM"
    
    /// Guyana 🇬🇾
    case GUY = "GUY"
    
    /// Hong Kong 🇭🇰
    case HKG = "HKG"
    
    /// Heard Island and McDonald Islands (No Flag)
    case HMD = "HMD"
    
    /// Honduras 🇭🇳
    case HND = "HND"
    
    /// Croatia 🇭🇷
    case HRV = "HRV"
    
    /// Haiti 🇭🇹
    case HTI = "HTI"
    
    /// Hungary 🇭🇺
    case HUN = "HUN"
    
    /// Indonesia 🇮🇩
    case IDN = "IDN"
    
    /// Isle Of Man 🇮🇲
    case IMN = "IMN"
    
    /// India 🇮🇳
    case IND = "IND"
    
    /// British Indian Ocean Territory 🇮🇴
    case IOT = "IOT"
    
    /// Ireland 🇮🇪
    case IRL = "IRL"
    
    /// Iran 🇮🇷
    case IRN = "IRN"
    
    /// Iraq 🇮🇶
    case IRQ = "IRQ"
    
    /// Iceland 🇮🇸
    case ISL = "ISL"
    
    /// Israel 🇮🇱
    case ISR = "ISR"
    
    /// Italy 🇮🇹
    case ITA = "ITA"
    
    /// Jamaica 🇯🇲
    case JAM = "JAM"
    
    /// Jersey 🇯🇪
    case JEY = "JEY"
    
    /// Jordan 🇯🇴
    case JOR = "JOR"
    
    /// Japan 🇯🇵
    case JPN = "JPN"
    
    /// Kazakhstan 🇰🇿
    case KAZ = "KAZ"
    
    /// Kenya 🇰🇪
    case KEN = "KEN"
    
    /// Kyrgyzstan 🇰🇬
    case KGZ = "KGZ"
    
    /// Cambodia 🇰🇭
    case KHM = "KHM"
    
    /// Kiribati 🇰🇮
    case KIR = "KIR"
    
    /// Saint Kitts and Nevis 🇰🇳
    case KNA = "KNA"
    
    /// Korea Republic of (South) 🇰🇷
    case KOR = "KOR"
    
    /// Kuwait 🇰🇼
    case KWT = "KWT"
    
    /// Laos 🇱🇦
    case LAO = "LAO"
    
    /// Lebanon 🇱🇧
    case LBN = "LBN"
    
    /// Liberia 🇱🇷
    case LBR = "LBR"
    
    /// Libya 🇱🇾
    case LBY = "LBY"
    
    /// Saint Lucia 🇱🇨
    case LCA = "LCA"
    
    /// Liechtenstein 🇱🇮
    case LIE = "LIE"
    
    /// Sri Lanka 🇱🇰
    case LKA = "LKA"
    
    /// Lesotho 🇱🇸
    case LSO = "LSO"
    
    /// Lithuania 🇱🇹
    case LTU = "LTU"
    
    /// Luxembourg 🇱🇺
    case LUX = "LUX"
    
    /// Latvia 🇱🇻
    case LVA = "LVA"
    
    /// Macau 🇲🇴
    case MAC = "MAC"
    
    /// Saint-Martin (French part) 🇫🇷
    case MAF = "MAF"
    
    /// Morocco 🇲🇦
    case MAR = "MAR"
    
    /// Monaco 🇲🇨
    case MCO = "MCO"
    
    /// Moldova 🇲🇩
    case MDA = "MDA"
    
    /// Madagascar 🇲🇬
    case MDG = "MDG"
    
    /// Maldives 🇲🇻
    case MDV = "MDV"
    
    /// Mexico 🇲🇽
    case MEX = "MEX"
    
    /// Marshall Islands 🇲🇭
    case MHL = "MHL"
    
    /// North Macedonia 🇲🇰
    case MKD = "MKD"
    
    /// Mali 🇲🇱
    case MLI = "MLI"
    
    /// Malta 🇲🇹
    case MLT = "MLT"
    
    /// Myanmar (Burma) 🇲🇲
    case MMR = "MMR"
    
    /// Montenegro 🇲🇪
    case MNE = "MNE"
    
    /// Mongolia 🇲🇳
    case MNG = "MNG"
    
    /// Northern Mariana Islands 🇲🇵
    case MNP = "MNP"
    
    /// Mozambique 🇲🇿
    case MOZ = "MOZ"
    
    /// Mauritania 🇲🇷
    case MRT = "MRT"
    
    /// Montserrat 🇲🇸
    case MSR = "MSR"
    
    /// Martinique 🇲🇶
    case MTQ = "MTQ"
    
    /// Mauritius 🇲🇺
    case MUS = "MUS"
    
    /// Malawi 🇲🇼
    case MWI = "MWI"
    
    /// Malaysia 🇲🇾
    case MYS = "MYS"
    
    /// Mayotte 🇾🇹
    case MYT = "MYT"
    
    /// Namibia 🇳🇦
    case NAM = "NAM"
    
    /// New Caledonia 🇳🇨
    case NCL = "NCL"
    
    /// Niger 🇳🇬
    case NER = "NER"
    
    /// Netherlands Antilles - NES was a code resolved prior to the use of ANT.
    /// ANT was dissolved into two separate territories in 2010.
    /// Curaçao (CUW) and Sint Maarten (SXM).
    //case NES = "NES"
    
    /// Norfolk Island 🇳🇫
    case NFK = "NFK"
    
    /// Nigeria 🇳🇬
    case NGA = "NGA"
    
    /// Nicaragua 🇳🇮
    case NIC = "NIC"
    
    /// Niue 🇳🇺
    case NIU = "NIU"
    
    /// Netherlands 🇳🇱
    case NLD = "NLD"
    
    /// Norway 🇳🇴
    case NOR = "NOR"
    
    /// Nepal 🇳🇵
    case NPL = "NPL"
    
    /// Nauru 🇳🇷
    case NRU = "NRU"
    
    /// New Zealand 🇳🇿
    case NZL = "NZL"
    
    /// Oman 🇴🇲
    case OMN = "OMN"
    
    /// Pakistan 🇵🇰
    case PAK = "PAK"
    
    /// Panama 🇵🇦
    case PAN = "PAN"
    
    /// Pitcairn Islands 🇵🇳
    case PCN = "PCN"
    
    /// Peru 🇵🇪
    case PER = "PER"
    
    /// Philippines 🇵🇭
    case PHL = "PHL"
    
    /// Palau 🇵🇼
    case PLW = "PLW"
    
    /// Papua New Guinea 🇵🇬
    case PNG = "PNG"
    
    /// Poland 🇵🇱
    case POL = "POL"
    
    /// Puerto Rico 🇵🇷
    case PRI = "PRI"
    
    /// North Korea (DPRK) 🇰🇵
    case PRK = "PRK"
    
    /// Portugal 🇵🇹
    case PRT = "PRT"
    
    /// Paraguay 🇵🇾
    case PRY = "PRY"
    
    /// Palestinian Territories 🇵🇸
    case PSE = "PSE"
    
    /// French Polynesia 🇵🇫
    case PYF = "PYF"
    
    /// Qatar 🇶🇦
    case QAT = "QAT"
    
    /// Reunion 🇷🇪
    case REU = "REU"
    
    /// Romania 🇷🇴
    case ROU = "ROU"
    
    /// Russia 🇷🇺
    case RUS = "RUS"
    
    /// Rwanda 🇷🇼
    case RWA = "RWA"
    
    /// Saudi Arabia 🇸🇦
    case SAU = "SAU"
    
    /// Sudan Suriname 🇸🇩
    case SDN = "SDN"
    
    /// Senegal 🇸🇳
    case SEN = "SEN"
    
    /// Singapore 🇸🇬
    case SGP = "SGP"
    
    /// South Georgia and the South Sandwich Islands 🇬🇸
    case SGS = "SGS"
    
    /// Saint Helena, Ascension and Tristan da Cunha 🇦🇨
    case SHN = "SHN"
    
    /// Svalbard and Jan Mayen (No Flag)
    case SJM = "SJM"
    
    /// Solomon Islands 🇸🇧
    case SLB = "SLB"
    
    /// Sierra Leone 🇸🇱
    case SLE = "SLE"
    
    /// El Salvador 🇸🇻
    case SLV = "SLV"
    
    /// San Marino 🇸🇲
    case SMR = "SMR"
    
    /// Somalia 🇸🇴
    case SOM = "SOM"
    
    /// Saint Pierre and Miquelon 🇵🇲
    case SPM = "SPM"
    
    /// Serbia 🇷🇸
    case SRB = "SRB"
    
    /// South Sudan 🇸🇸
    case SSD = "SSD"
    
    /// Sao Tome and Principe 🇸🇹
    case STP = "STP"
    
    /// Suriname 🇸🇷
    case SUR = "SUR"
    
    /// Slovakia 🇸🇰
    case SVK = "SVK"
    
    /// Slovenia 🇸🇮
    case SVN = "SVN"
    
    /// Sweden 🇸🇪
    case SWE = "SWE"
    
    /// Eswatini (aka Swaziland) 🇸🇿
    case SWZ = "SWZ"
    
    /// Sint Maarten (Dutch part) 🇸🇽
    case SXM = "SXM"
    
    /// Seychelles 🇸🇨
    case SYC = "SYC"
    
    /// Syria 🇸🇾
    case SYR = "SYR"
    
    /// Caicos Islands 🇹🇨
    case TCA = "TCA"
    
    /// Chad 🇹🇩
    case TCD = "TCD"
    
    /// Togo 🇹🇬
    case TGO = "TGO"
    
    /// Thailand 🇹🇭
    case THA = "THA"
    
    /// Tajikistan 🇹🇯
    case TJK = "TJK"
    
    /// Tokelau 🇹🇰
    case TKL = "TKL"
    
    /// Turkmenistan 🇹🇲
    case TKM = "TKM"
    
    /// Timor-Leste (aka East Timor) 🇹🇱
    case TLS = "TLS"
    
    /// Tonga 🇹🇴
    case TON = "TON"
    
    //@available(*, deprecated, message: "Use SHN - Saint Helena, Ascension and Tristan da Cunha 🇦🇨")
    /// Tristan da Cunha (Deprecated - Use SHN - Saint Helena, Ascension and Tristan da Cunha)
    case TRS = "TRS"
    
    /// Trinidad 🇹🇹
    case TTO = "TTO"
    
    /// Tunisia 🇹🇳
    case TUN = "TUN"
    
    /// Türkiye🦃 🇹🇷
    case TUR = "TUR"
    
    /// Tuvalu 🇹🇻
    case TUV = "TUV"
    
    /// Taiwan 🇹🇼
    case TWN = "TWN"
    
    /// Tanzania 🇹🇿
    case TZA = "TZA"
    
    /// Uganda 🇺🇬
    case UGA = "UGA"
    
    /// Ukraine 🇺🇦
    case UKR = "UKR"
    
    /// United States Minor Outlying Islands 🇺🇸
    case UMI = "UMI"
    
    //@available(*, deprecated, message: "Code UNK is no longer used.")
    /// Kosovo - Deprecated, code UNK is no longer used.
    case UNK = "UNK"
    
    /// Uruguay 🇺🇾
    case URY = "URY"
    
    /// United States of America 🇺🇸
    case USA = "USA"
    
    /// Uzbekistan 🇺🇿
    case UZB = "UZB"
    
    /// Vatican City 🇻🇦
    case VAT = "VAT"
    
    /// Saint Vincent and the Grenadines 🇻🇨
    case VCT = "VCT"
    
    /// Venezuela 🇻🇪
    case VEN = "VEN"
    
    /// British Virgin Islands 🇻🇬
    case VGB = "VGB"
    
    /// US Virgin Islands 🇻🇮
    case VIR = "VIR"
    
    /// Vietnam 🇻🇳
    case VNM = "VNM"
    
    /// Vanuatu 🇻🇺
    case VUT = "VUT"
    
    /// Wallis and Futuna Islands 🇼🇫
    case WLF = "WLF"
    
    /// Samoa 🇼🇸
    case WSM = "WSM"
    
    /// Yemen 🇾🇪
    case YEM = "YEM"
    
    /// South Africa 🇿🇦
    case ZAF = "ZAF"
    
    /// Zambia 🇿🇲
    case ZMB = "ZMB"
    
    /// Zimbabwe 🇿🇼
    case ZWE = "ZWE"
}
