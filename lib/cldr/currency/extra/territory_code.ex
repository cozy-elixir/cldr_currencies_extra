defmodule Cldr.Currency.Extra.TerritoryCode do
  alias Cldr.UnknownTerritoryError

  @no_territory :NO_TERRITORY

  @territory_codes_of_currency_codes %{
    AED: :AE,
    AFN: :AF,
    ALL: :AL,
    AMD: :AM,
    ANG: :SX,
    AOA: :AO,
    ARS: :AR,
    AUD: :AU,
    AWG: :AW,
    AZN: :AZ,
    BAM: :BA,
    BBD: :BB,
    BDT: :BD,
    BGN: :BG,
    BHD: :BH,
    BIF: :BI,
    BMD: :BM,
    BND: :BN,
    BOB: :BO,
    BOV: :BO,
    BRL: :BR,
    BSD: :BS,
    BTN: :BT,
    BWP: :BW,
    BYN: :BY,
    BZD: :BZ,
    CAD: :CA,
    CDF: :CD,
    CHE: :CH,
    CHF: :CH,
    CHW: :CH,
    CLF: :CL,
    CLP: :CL,
    CNH: :CN,
    CNY: :CN,
    COP: :CO,
    COU: :CO,
    CRC: :CR,
    CUP: :CU,
    CVE: :CV,
    CZK: :CZ,
    DJF: :DJ,
    DKK: :DK,
    DOP: :DO,
    DZD: :DZ,
    EGP: :EG,
    ERN: :ER,
    ETB: :ET,
    EUR: :EU,
    FJD: :FJ,
    FKP: :FK,
    GBP: :GB,
    GEL: :GE,
    GHS: :GH,
    GIP: :GI,
    GMD: :GM,
    GNF: :GN,
    GTQ: :GT,
    GYD: :GY,
    HKD: :HK,
    HNL: :HN,
    HTG: :HT,
    HUF: :HU,
    IDR: :ID,
    ILS: :IL,
    INR: :IN,
    IQD: :IQ,
    IRR: :IR,
    ISK: :IS,
    JMD: :JM,
    JOD: :JO,
    JPY: :JP,
    KES: :KE,
    KGS: :KG,
    KHR: :KH,
    KMF: :KM,
    KPW: :KP,
    KRW: :KR,
    KWD: :KW,
    KYD: :KY,
    KZT: :KZ,
    LAK: :LA,
    LBP: :LB,
    LKR: :LK,
    LRD: :LR,
    LSL: :LS,
    LYD: :LY,
    MAD: :MA,
    MDL: :MD,
    MGA: :MG,
    MKD: :MK,
    MMK: :MM,
    MNT: :MN,
    MOP: :MO,
    MRU: :MR,
    MUR: :MU,
    MVR: :MV,
    MWK: :MW,
    MXN: :MX,
    MXV: :MX,
    MYR: :MY,
    MZN: :MZ,
    NAD: :NA,
    NGN: :NG,
    NIO: :NI,
    NOK: :NO,
    NPR: :NP,
    NZD: :NZ,
    OMR: :OM,
    PAB: :PA,
    PEN: :PE,
    PGK: :PG,
    PHP: :PH,
    PKR: :PK,
    PLN: :PL,
    PYG: :PY,
    QAR: :QA,
    RON: :RO,
    RSD: :RS,
    RUB: :RU,
    RWF: :RW,
    SAR: :SA,
    SBD: :SB,
    SCR: :SC,
    SDG: :SD,
    SEK: :SE,
    SGD: :SG,
    SHP: :SH,
    SLE: :SL,
    SLL: :SL,
    SOS: :SO,
    SRD: :SR,
    SSP: :SS,
    STN: :ST,
    SVC: :SV,
    SYP: :SY,
    SZL: :SZ,
    THB: :TH,
    TJS: :TJ,
    TMT: :TM,
    TND: :TN,
    TOP: :TO,
    TRY: :TR,
    TTD: :TT,
    TWD: :TW,
    TZS: :TZ,
    UAH: :UA,
    UGX: :UG,
    USD: :US,
    USN: :US,
    UYI: :UY,
    UYU: :UY,
    UYW: :UY,
    UZS: :UZ,
    VED: :VE,
    VES: :VE,
    VND: :VN,
    VUV: :VU,
    WST: :WS,
    XAF: :TD,
    XCD: :AI,
    XOF: :TG,
    XPF: :NC,
    YER: :YE,
    ZAR: :ZA,
    ZMW: :ZM
  }

  @territory_codes_of_historical_currency_codes %{
    ADP: :AD,
    AFA: :AF,
    ALK: :AL,
    AOK: :AO,
    AON: :AO,
    AOR: :AO,
    ARA: :AR,
    ARL: :AR,
    ARM: :AR,
    ARP: :AR,
    ATS: :AT,
    AZM: :AZ,
    BAD: :BA,
    BAN: :BA,
    BEC: :BE,
    BEF: :BE,
    BEL: :BE,
    BGM: :BG,
    BGL: :BG,
    BGO: :BG,
    BOL: :BO,
    BOP: :BO,
    BRB: :BR,
    BRC: :BR,
    BRE: :BR,
    BRN: :BR,
    BRR: :BR,
    BRZ: :BR,
    BUK: :MM,
    BYB: :BY,
    BYR: :BY,
    CLE: :CL,
    CNX: :CN,
    CSD: :RS,
    CSK: :CS,
    CUC: :CU,
    CYP: :CY,
    DDM: :DE,
    DEM: :DE,
    ECS: :EC,
    ECV: :EC,
    EEK: :EE,
    ESA: :ES,
    ESB: :ES,
    ESP: :ES,
    FIM: :FI,
    FRF: :FR,
    GEK: :GE,
    GHC: :GH,
    GNS: :GN,
    GQE: :GQ,
    GRD: :GR,
    GWE: :GN,
    GWP: :GW,
    HRD: :HR,
    HRK: :HR,
    IEP: :IE,
    ILP: :IL,
    ILR: :IL,
    ISJ: :IS,
    ITL: :IT,
    KRH: :KR,
    KRO: :KR,
    LTL: :LT,
    LTT: :LT,
    LUC: :LU,
    LUF: :LU,
    LUL: :LU,
    LVL: :LV,
    LVR: :LV,
    MAF: :MA,
    MCF: :MC,
    MDC: :MD,
    MGF: :MG,
    MKN: :MK,
    MLF: :ML,
    MRO: :MR,
    MTL: :MT,
    MTP: :MT,
    MVP: :MV,
    MXP: :MX,
    MZE: :MZ,
    MZM: :MZ,
    NIC: :NI,
    NLG: :NL,
    PEI: :PE,
    PES: :PE,
    PLZ: :PL,
    PTE: :PT,
    RHD: :RH,
    ROL: :RO,
    RUR: :RU,
    SDD: :SD,
    SDP: :SD,
    SIT: :SI,
    SKK: :SK,
    SRG: :SR,
    STD: :ST,
    SUR: :SU,
    TJR: :TJ,
    TMM: :TM,
    TPE: :TL,
    TRL: :TR,
    UAK: :UA,
    UGS: :UG,
    USS: :US,
    UYP: :UY,
    VEB: :VE,
    VEF: :VE,
    VNN: :VN,
    XEU: :EU,
    XFO: :FR,
    XFU: :FR,
    YDD: :YE,
    YUD: :YU,
    YUM: :YU,
    YUN: :YU,
    YUR: :YU,
    ZAL: :ZA,
    ZMK: :ZM,
    ZRN: :ZR,
    ZRZ: :ZR,
    ZWD: :ZW,
    ZWL: :ZW,
    ZWR: :ZW
  }

  @territory_codes_of_imf_currency_codes %{
    XBA: @no_territory,
    XBB: @no_territory,
    XBC: @no_territory,
    XBD: @no_territory,
    XDR: @no_territory,
    XSU: @no_territory,
    XUA: @no_territory
  }

  @territory_codes_of_historical_imf_currency_codes %{
    XRE: @no_territory
  }

  @territory_codes_of_precious_metal_codes %{
    XAU: @no_territory,
    XAG: @no_territory,
    XPD: @no_territory,
    XPT: @no_territory
  }

  @testing_currency_codes %{
    XTS: @no_territory
  }

  @misc_currency_codes %{
    XXX: @no_territory
  }

  @extra_currency_codes %{
    JEP: :JE
  }

  @territory_codes_of_all_currency_codes %{}
                                         |> Map.merge(@territory_codes_of_currency_codes)
                                         |> Map.merge(
                                           @territory_codes_of_historical_currency_codes
                                         )
                                         |> Map.merge(@territory_codes_of_imf_currency_codes)
                                         |> Map.merge(
                                           @territory_codes_of_historical_imf_currency_codes
                                         )
                                         |> Map.merge(@territory_codes_of_precious_metal_codes)
                                         |> Map.merge(@testing_currency_codes)
                                         |> Map.merge(@misc_currency_codes)
                                         |> Map.merge(@extra_currency_codes)

  # For testing
  @doc false
  def cldr_currency_codes() do
    %{}
    |> Map.merge(@territory_codes_of_currency_codes)
    |> Map.merge(@territory_codes_of_historical_currency_codes)
    |> Map.merge(@territory_codes_of_imf_currency_codes)
    |> Map.merge(@territory_codes_of_historical_imf_currency_codes)
    |> Map.merge(@territory_codes_of_precious_metal_codes)
    |> Map.merge(@testing_currency_codes)
    |> Map.merge(@misc_currency_codes)
    |> Map.keys()
    |> Enum.sort()
  end

  # For testing
  @doc false
  def all_currency_codes() do
    %{}
    |> Map.merge(@territory_codes_of_currency_codes)
    |> Map.merge(@territory_codes_of_historical_currency_codes)
    |> Map.merge(@territory_codes_of_imf_currency_codes)
    |> Map.merge(@territory_codes_of_historical_imf_currency_codes)
    |> Map.merge(@territory_codes_of_precious_metal_codes)
    |> Map.merge(@testing_currency_codes)
    |> Map.merge(@misc_currency_codes)
    |> Map.merge(@extra_currency_codes)
    |> Map.keys()
    |> Enum.sort()
  end

  def fetch_territory_code(currency_code) when is_atom(currency_code) do
    with {:ok, currency_code} <- Cldr.validate_currency(currency_code) do
      case Map.get(@territory_codes_of_all_currency_codes, currency_code) do
        @no_territory ->
          {:error,
           {UnknownTerritoryError, "The currency #{inspect(currency_code)} has no territory"}}

        territory_code ->
          {:ok, territory_code}
      end
    end
  end

  def fetch_territory_code!(currency_code) do
    with {:ok, currency_code} <- Cldr.validate_currency(currency_code) do
      case Map.get(@territory_codes_of_all_currency_codes, currency_code) do
        @no_territory ->
          raise UnknownTerritoryError, "The currency #{inspect(currency_code)} has no territory"

        territory_code ->
          territory_code
      end
    else
      {:error, {error, message}} when error in [Cldr.UnknownCurrencyError] ->
        raise error, message
    end
  end
end
