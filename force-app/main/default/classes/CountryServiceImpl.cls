public with sharing class CountryServiceImpl{
    
    public static void fullCountryInfoImpl(){
        CountryWebService.CountryInfoServiceSoap countryInfo = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.tCountryInfo countryInfoResponse = countryInfo.FullCountryInfo('US');
        CountryWebService.ArrayOftLanguage countryLanguages = countryInfoResponse.Languages;
        CountryWebService.tLanguage languageResponse = countryLanguages.tLanguage.get(0);
        System.debug(countryInfoResponse.sISOCode);
        System.debug(countryInfoResponse.sName);
        System.debug(countryInfoResponse.sCapitalCity);
        System.debug(countryInfoResponse.sPhoneCode);
        System.debug(countryInfoResponse.sContinentCode);
        System.debug(countryInfoResponse.sCurrencyISOCode);
        System.debug(countryInfoResponse.sCountryFlag);
        System.debug(countryInfoResponse.Languages);
        System.debug(languageResponse.sISOCode);
        System.debug(languageResponse.sName);
    }
    
    public static void countryFlagImpl(){
        CountryWebService.CountryInfoServiceSoap conFlag= new CountryWebService.CountryInfoServiceSoap();
        System.debug(conFlag.CountryFlag('US'));
    }
    
    public static void countryNameImpl(){
        CountryWebService.CountryInfoServiceSoap conName = new CountryWebService.CountryInfoServiceSoap();
        System.debug(conName.CountryName('US'));
    }
    
    public static void countryCurrencyImpl(){
        CountryWebService.CountryInfoServiceSoap conCurrency= new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.tCurrency conTCurrency = conCurrency.CountryCurrency('US');
        System.debug(conTCurrency.sISOCode);
        System.debug(conTCurrency.sName);
    }
    
    public static void listOfCurrenciesByNameImpl(){
        CountryWebService.CountryInfoServiceSoap conCurrencyName = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCurrency arrOfCurrency = conCurrencyName.ListOfCurrenciesByName();
        list<CountryWebService.ArrayOftCurrency> arrCurrencyName = conCurrencyName.tCurrency;
        for(CountryWebService.tCurrency currentCurrency : arrCurrencyName){
        System.debug(currencyName.sISOCode);
        System.debug(currencyName.sName);
        }
    }

    //ListOfCountryNamesByCodeImpl
   
    public static void countryIntPhoneCodeImpl(){
        CountryWebService.CountryInfoServiceSoap conPhoneCode = new CountryWebService.CountryInfoServiceSoap();
        System.debug(conPhoneCode.CountryIntPhoneCode('US'));   
    }
    
    public static void currencyNameImpl(){
        CountryWebService.CountryInfoServiceSoap conCurrencyName = new CountryWebService.CountryInfoServiceSoap();
        System.debug(conCurrencyName.CurrencyName('USD'));
    }

    //ListOfCurrenciesByCodeImpl

    //ListOfLanguagesByCodeImpl
   
    public static void languageISOCodeImpl(){
        CountryWebService.CountryInfoServiceSoap conLangISOCode = new CountryWebService.CountryInfoServiceSoap();
        System.debug(conLangISOCode.LanguageISOCode('English'));
    }
    
    public static void capitalCityImpl(){
        CountryWebService.CountryInfoServiceSoap conCapitalCity = new CountryWebService.CountryInfoServiceSoap();
        System.debug(conCapitalCity.CapitalCity('US'));
    }
    
    //ListOfLanguagesByNameImpl

    //ListOfCountryNamesGroupedByContinentImpl

    //ListOfCountryNamesByNameImpl

    //ListOfContinentsByNameImpl

    public static void languageNameImpl(){
        CountryWebService.CountryInfoServiceSoap conLanguageName = new CountryWebService.CountryInfoServiceSoap();
        System.debug(conLanguageName.LanguageName('Eng'));
    }

    //ListOfContinentsByCodeImpl
    
    //Error : (Illegal assignment from List<CountryWebService.tCountryCodeAndName> to CountryWebService.tCountryCodeAndName)
    public static void countriesUsingCurrencyImpl(){
        CountryWebService.CountryInfoServiceSoap conUsingCurrency = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName wrpUsingCurrency = conUsingCurrency.CountriesUsingCurrency('Rs');
        CountryWebService.tCountryCodeAndName wrpUsingCurrencies = wrpUsingCurrency.tCountryCodeAndName;
        System.debug(wrpUsingCurrencies.sISOCode);
        System.debug(wrpUsingCurrencies.sName);
    }
    
    public static void countryISOCodeImpl(){
        CountryWebService.CountryInfoServiceSoap conISOCode = new CountryWebService.CountryInfoServiceSoap();
        System.debug(conISOCode.CountryISOCode('Australia'));
    }


    //Error : (Variable does not exist: tCountryInfo)
    public static void fullCountryInfoAllCountriesImpl(){
        CountryWebService.CountryInfoServiceSoap conInfoAllCountries = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryInfo conInfo = conInfoAllCountries.tCountryInfo;
        CountryWebService.tCountryInfo ConInfoAllCountry = conInfo.FullCountryInfoAllCountries();
        CountryWebService.ArrayOftLanguage countryLanguages = countryInfoResponse.Languages;
        CountryWebService.tLanguage languageResponse = countryLanguages.tLanguage.get(0);
        System.debug(ConInfoAllCountries.sISOCode);
        System.debug(ConInfoAllCountries.sName);
        System.debug(ConInfoAllCountries.sCapitalCity);
        System.debug(ConInfoAllCountries.sPhoneCode);
        System.debug(ConInfoAllCountries.sContinentCode);
        System.debug(ConInfoAllCountries.sCurrencyISOCode);
        System.debug(ConInfoAllCountries.sCountryFlag);
        System.debug(ConInfoAllCountries.Languages);
        System.debug(languageResponse.sISOCode);
        System.debug(languageResponse.sName);
    }
}