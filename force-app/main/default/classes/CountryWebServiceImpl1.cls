public with sharing class CountryWebServiceImpl1 
{
    public static void getFullCountryInfo(String sCountryISOCode)
    {
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

    public static void getCountryFlagURL(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        System.debug(sCountryISOCode);
        System.debug(countryInfo.CountryFlag(sCountryISOCode));
    }
    
    public static void getCountryName(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        System.debug(sCountryISOCode);
        System.debug(countryInfo.CountryName(sCountryISOCode));
    }
    
    public static void getCountryCurrency(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.tCurrency getCurrencyName = countryInfo.CountryCurrency(sCountryISOCode);
        System.debug(sCountryISOCode);
        System.debug(getCurrencyName.sName);
        System.debug(getCurrencyName.sISOCode);
    }
    
    public static void getListOfCurrenciesByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCurrency getCurrencyNames = countryInfo.ListOfCurrenciesByName();
        List<CountryWebService.tCurrency> tCurrency = getCurrencyNames.tCurrency;
        for(CountryWebService.tCurrency currentCurrency : tCurrency)
        {
            System.debug(currentCurrency.sISOCode);
            System.debug(currentCurrency.sName);
        }
    }
    
    public static void getArrayOftCountryCodeAndName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName getCountryCodeAndName = countryInfo.ListOfCountryNamesByCode();
        List<CountryWebService.tCountryCodeAndName> tCountryCodeAndName = getCountryCodeAndName.tCountryCodeAndName;
        for(CountryWebService.tCountryCodeAndName currentCountryCodeAndName : tCountryCodeAndName)
        {
            System.debug(currentCountryCodeAndName.sName);
            System.debug(currentCountryCodeAndName.sISOCode);
        }
    }
    
    public static void getCountryIntPhoneCode(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        System.debug(sCountryISOCode);
        System.debug(countryInfo.CountryIntPhoneCode(sCountryISOCode));
    }
    
    public static void getCurrencyName(String sCurrencyISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        System.debug(sCurrencyISOCode);
        System.debug(countryInfo.CurrencyName(sCurrencyISOCode));
    }

    public static void getListOfCurrenciesByCode()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCurrency getArrayOftCurrency = countryInfo.ListOfCurrenciesByCode();
        List<CountryWebService.tCurrency> getTCurrency = getArrayOftCurrency.tCurrency;
        for(CountryWebService.tCurrency currentCurrencyCode : getTCurrency)
        {
            System.debug(currentCurrencyCode.sISOCode);
            System.debug(currentCurrencyCode.sName);
        }
    }
    
    public static void getListOfLanguagesByCode()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftLanguage getArrayOftLanguage = countryInfo.ListOfLanguagesByCode();
        List<CountryWebService.tLanguage> getTLanguage = getArrayOftLanguage.tLanguage;
        for(CountryWebService.tLanguage currentLanguage : getTLanguage)
        {
            System.debug(currentLanguage.sISOCode);
            System.debug(currentLanguage.sName);
        }
    }
    
    public static void getLanguageISOCode(String sLanguageName)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug(sLanguageName);
        System.debug(countryInfo.LanguageISOCode(sLanguageName));
    }

    public static void getCapitalCity(String sCountryISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug(sCountryISOCode);
        System.debug(countryInfo.CapitalCity(sCountryISOCode));
    }
    
    public static void getListOfLanguagesByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftLanguage getArrayOftLanguage = countryInfo.ListOfLanguagesByName();
        List<CountryWebService.tLanguage> getTLanguage = getArrayOftLanguage.tLanguage;
        for(CountryWebService.tLanguage currentLanguage : getTLanguage)
        {
            System.debug(currentLanguage.sISOCode);
            System.debug(currentLanguage.sName);
        }
    }
    
    public static void getListOfCountryNamesGroupedByContinent()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndNameGroupedByContinent getCountryCodeAndNameGroupedByContinent = countryInfo.ListOfCountryNamesGroupedByContinent();
        List<CountryWebService.tCountryCodeAndNameGroupedByContinent> tCountryCodeAndNameGroupedByContinent = getCountryCodeAndNameGroupedByContinent.tCountryCodeAndNameGroupedByContinent;
        
        for(CountryWebService.tCountryCodeAndNameGroupedByContinent currentContinent : tCountryCodeAndNameGroupedByContinent)
        {
            CountryWebService.tContinent tContinent = currentContinent.Continent;
            CountryWebService.ArrayOftCountryCodeAndName getCountryCodeAndName = currentContinent.CountryCodeAndNames;
            List<CountryWebService.tCountryCodeAndName> tCountryCodeAndName = getCountryCodeAndName.tCountryCodeAndName;

            System.debug(tContinent.sName);
            System.debug(tContinent.sCode);

            for(CountryWebService.tCountryCodeAndName currentCountry : tCountryCodeAndName)
            {
                System.debug(currentCountry.sName);
                System.debug(currentCountry.sISOCode);
            }
        }
    }
    
    public static void getListOfCountryNamesByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName getCountryCodeAndName = countryInfo.ListOfCountryNamesByName();
        List<CountryWebService.tCountryCodeAndName> tCountryCodeAndName = getCountryCodeAndName.tCountryCodeAndName;
        for(CountryWebService.tCountryCodeAndName currentCountryCodeAndName : tCountryCodeAndName)
        {
            System.debug(currentCountryCodeAndName.sName);
            System.debug(currentCountryCodeAndName.sISOCode);
        }
    }
    
    public static void getListOfContinentsByName()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftContinent getContinentName = countryInfo.ListOfContinentsByName();
        List<CountryWebService.tContinent> tContinent = getContinentName.tContinent;
        for(CountryWebService.tContinent currentContinent : tContinent)
        {
            System.debug(currentContinent.sName);
            System.debug(currentContinent.sCode);
        }
    }
    
    public static void getLanguageName(String sISOCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        System.debug(sISOCode);
        System.debug(countryInfo.LanguageName(sISOCode));
    }
    
    public static void getListOfContinentsByCode()
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftContinent getContinentCode = countryInfo.ListOfContinentsByCode();
        List<CountryWebService.tContinent> tContinent = getContinentCode.tContinent;
        for(CountryWebService.tContinent currentContinent : tContinent)
        {
            System.debug(currentContinent.sName);
            System.debug(currentContinent.sCode);
        }
    }

    public static void getCountriesUsingCurrency(String sISOCurrencyCode)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryCodeAndName getArrayOfCountryCodeAndName = countryInfo.CountriesUsingCurrency(sISOCurrencyCode);
        List<CountryWebService.tCountryCodeAndName> getCountryNameAndCode = getArrayOfCountryCodeAndName.tCountryCodeAndName;
        System.debug(sISOCurrencyCode);
        for(CountryWebService.tCountryCodeAndName currentCountry : getCountryNameAndCode)
        {
            System.debug(currentCountry.sName);
            System.debug(currentCountry.sISOCode);
        }
    }
   
    public static void getCountryISOCode(String sCountryName)
    {
        CountryWebService.CountryInfoServiceSoap countryInfo =  new CountryWebService.CountryInfoServiceSoap();

        System.debug(sCountryName);
        System.debug(countryInfo.CountryISOCode(sCountryName));
    }
    
    public static void getArrayOfCountryInfo() 
    {
        CountryWebService.CountryInfoServiceSoap countryInfo = new CountryWebService.CountryInfoServiceSoap();
        CountryWebService.ArrayOftCountryInfo getArrayOftCountryInfo = countryInfo.FullCountryInfoAllCountries();
    
        if (getArrayOftCountryInfo != null && getArrayOftCountryInfo.tCountryInfo != null) 
        {
            List<CountryWebService.tCountryInfo> getCountryInfo = getArrayOftCountryInfo.tCountryInfo;
            for (CountryWebService.tCountryInfo currentCountry : getCountryInfo) 
            {
                if (currentCountry != null) 
                {
                    System.debug(currentCountry.sISOCode);
                    System.debug(currentCountry.sName);
                    System.debug(currentCountry.sCapitalCity);
                    System.debug(currentCountry.sPhoneCode);
                    System.debug(currentCountry.sContinentCode);
                    System.debug(currentCountry.sCurrencyISOCode);
                    System.debug(currentCountry.sCountryFlag);
    
                    if(currentCountry.Languages != null && currentCountry.Languages.tLanguage != null) 
                    {
                        List<CountryWebService.tLanguage> getLanguage = currentCountry.Languages.tLanguage;
                        System.debug(getLanguage);
    
                        for (CountryWebService.tLanguage currentLanguage : getLanguage) 
                        {
                            if (currentLanguage != null) 
                            {
                                System.debug(currentLanguage.sName);
                                System.debug(currentLanguage.sISOCode);
                            }
                        }
                    }
                }
            }
        }
    }
    
}