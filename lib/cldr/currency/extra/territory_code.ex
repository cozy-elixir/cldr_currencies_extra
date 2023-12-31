defmodule Cldr.Currency.Extra.TerritoryCode do
  @moduledoc false

  alias Cldr.UnknownTerritoryError

  @no_territory nil

  @territory_codes_main %{
    ADP: :AD,
    AED: :AE,
    AFA: :AF,
    AFN: :AF,
    ALK: :AL,
    ALL: :AL,
    AMD: :AM,
    ANG: :SX,
    AOA: :AO,
    AOK: :AO,
    AON: :AO,
    AOR: :AO,
    ARA: :AR,
    ARL: :AR,
    ARM: :AR,
    ARP: :AR,
    ARS: :AR,
    ATS: :AT,
    AUD: :AU,
    AWG: :AW,
    AZM: :AZ,
    AZN: :AZ,
    BAD: :BA,
    BAM: :BA,
    BAN: :BA,
    BBD: :BB,
    BDT: :BD,
    BEC: :BE,
    BEF: :BE,
    BEL: :BE,
    BGL: :BG,
    BGM: :BG,
    BGN: :BG,
    BGO: :BG,
    BHD: :BH,
    BIF: :BI,
    BMD: :BM,
    BND: :BN,
    BOB: :BO,
    BOL: :BO,
    BOP: :BO,
    BOV: :BO,
    BRB: :BR,
    BRC: :BR,
    BRE: :BR,
    BRL: :BR,
    BRN: :BR,
    BRR: :BR,
    BRZ: :BR,
    BSD: :BS,
    BTN: :BT,
    BUK: :MM,
    BWP: :BW,
    BYB: :BY,
    BYN: :BY,
    BYR: :BY,
    BZD: :BZ,
    CAD: :CA,
    CDF: :CD,
    CHE: :CH,
    CHF: :CH,
    CHW: :CH,
    CLE: :CL,
    CLF: :CL,
    CLP: :CL,
    CNH: :CN,
    CNX: :CN,
    CNY: :CN,
    COP: :CO,
    COU: :CO,
    CRC: :CR,
    CSD: :RS,
    CSK: :CS,
    CUC: :CU,
    CUP: :CU,
    CVE: :CV,
    CYP: :CY,
    CZK: :CZ,
    DDM: :DE,
    DEM: :DE,
    DJF: :DJ,
    DKK: :DK,
    DOP: :DO,
    DZD: :DZ,
    ECS: :EC,
    ECV: :EC,
    EEK: :EE,
    EGP: :EG,
    ERN: :ER,
    ESA: :ES,
    ESB: :ES,
    ESP: :ES,
    ETB: :ET,
    EUR: :EU,
    FIM: :FI,
    FJD: :FJ,
    FKP: :FK,
    FRF: :FR,
    GBP: :GB,
    GEK: :GE,
    GEL: :GE,
    GHC: :GH,
    GHS: :GH,
    GIP: :GI,
    GMD: :GM,
    GNF: :GN,
    GNS: :GN,
    GQE: :GQ,
    GRD: :GR,
    GTQ: :GT,
    GWE: :GN,
    GWP: :GW,
    GYD: :GY,
    HKD: :HK,
    HNL: :HN,
    HRD: :HR,
    HRK: :HR,
    HTG: :HT,
    HUF: :HU,
    IDR: :ID,
    IEP: :IE,
    ILP: :IL,
    ILR: :IL,
    ILS: :IL,
    INR: :IN,
    IQD: :IQ,
    IRR: :IR,
    ISJ: :IS,
    ISK: :IS,
    ITL: :IT,
    JMD: :JM,
    JOD: :JO,
    JPY: :JP,
    KES: :KE,
    KGS: :KG,
    KHR: :KH,
    KMF: :KM,
    KPW: :KP,
    KRH: :KR,
    KRO: :KR,
    KRW: :KR,
    KWD: :KW,
    KYD: :KY,
    KZT: :KZ,
    LAK: :LA,
    LBP: :LB,
    LKR: :LK,
    LRD: :LR,
    LSL: :LS,
    LTL: :LT,
    LTT: :LT,
    LUC: :LU,
    LUF: :LU,
    LUL: :LU,
    LVL: :LV,
    LVR: :LV,
    LYD: :LY,
    MAD: :MA,
    MAF: :MA,
    MCF: :MC,
    MDC: :MD,
    MDL: :MD,
    MGA: :MG,
    MGF: :MG,
    MKD: :MK,
    MKN: :MK,
    MLF: :ML,
    MMK: :MM,
    MNT: :MN,
    MOP: :MO,
    MRO: :MR,
    MRU: :MR,
    MTL: :MT,
    MTP: :MT,
    MUR: :MU,
    MVP: :MV,
    MVR: :MV,
    MWK: :MW,
    MXN: :MX,
    MXP: :MX,
    MXV: :MX,
    MYR: :MY,
    MZE: :MZ,
    MZM: :MZ,
    MZN: :MZ,
    NAD: :NA,
    NGN: :NG,
    NIC: :NI,
    NIO: :NI,
    NLG: :NL,
    NOK: :NO,
    NPR: :NP,
    NZD: :NZ,
    OMR: :OM,
    PAB: :PA,
    PEI: :PE,
    PEN: :PE,
    PES: :PE,
    PGK: :PG,
    PHP: :PH,
    PKR: :PK,
    PLN: :PL,
    PLZ: :PL,
    PTE: :PT,
    PYG: :PY,
    QAR: :QA,
    RHD: :RH,
    ROL: :RO,
    RON: :RO,
    RSD: :RS,
    RUB: :RU,
    RUR: :RU,
    RWF: :RW,
    SAR: :SA,
    SBD: :SB,
    SCR: :SC,
    SDD: :SD,
    SDG: :SD,
    SDP: :SD,
    SEK: :SE,
    SGD: :SG,
    SHP: :SH,
    SIT: :SI,
    SKK: :SK,
    SLE: :SL,
    SLL: :SL,
    SOS: :SO,
    SRD: :SR,
    SRG: :SR,
    SSP: :SS,
    STD: :ST,
    STN: :ST,
    SUR: :SU,
    SVC: :SV,
    SYP: :SY,
    SZL: :SZ,
    THB: :TH,
    TJR: :TJ,
    TJS: :TJ,
    TMM: :TM,
    TMT: :TM,
    TND: :TN,
    TOP: :TO,
    TPE: :TL,
    TRL: :TR,
    TRY: :TR,
    TTD: :TT,
    TWD: :TW,
    TZS: :TZ,
    UAH: :UA,
    UAK: :UA,
    UGS: :UG,
    UGX: :UG,
    USD: :US,
    USN: :US,
    USS: :US,
    UYI: :UY,
    UYP: :UY,
    UYU: :UY,
    UYW: :UY,
    UZS: :UZ,
    VEB: :VE,
    VED: :VE,
    VEF: :VE,
    VES: :VE,
    VND: :VN,
    VNN: :VN,
    VUV: :VU,
    WST: :WS,
    XAF: :TD,
    XCD: :AI,
    XEU: :EU,
    XFO: :FR,
    XFU: :FR,
    XOF: :TG,
    XPF: :NC,
    YDD: :YE,
    YER: :YE,
    YUD: :YU,
    YUM: :YU,
    YUN: :YU,
    YUR: :YU,
    ZAL: :ZA,
    ZAR: :ZA,
    ZMK: :ZM,
    ZMW: :ZM,
    ZRN: :ZR,
    ZRZ: :ZR,
    ZWD: :ZW,
    ZWL: :ZW,
    ZWR: :ZW
  }

  @territory_codes_extra %{
    GGP: :GGP,
    IMP: :IM,
    JEP: :JE
  }

  @territory_codes_metal %{
    XAU: @no_territory,
    XAG: @no_territory,
    XPD: @no_territory,
    XPT: @no_territory
  }

  @territory_codes_imf %{
    XBA: @no_territory,
    XBB: @no_territory,
    XBC: @no_territory,
    XBD: @no_territory,
    XDR: @no_territory,
    XRE: @no_territory,
    XSU: @no_territory,
    XUA: @no_territory
  }

  @territory_codes_testing %{
    XTS: @no_territory
  }

  @territory_codes_misc %{
    XXX: @no_territory
  }

  @territory_codes_all [
                         @territory_codes_main,
                         @territory_codes_extra,
                         @territory_codes_metal,
                         @territory_codes_imf,
                         @territory_codes_testing,
                         @territory_codes_misc
                       ]
                       |> Enum.reduce(%{}, fn codes, acc -> Map.merge(acc, codes) end)

  # For testing
  @doc false
  def all_currency_codes() do
    @territory_codes_all
    |> Map.keys()
    |> Enum.sort()
  end

  def fetch_territory_code(currency_code) when is_atom(currency_code) do
    with {:ok, currency_code} <- Cldr.validate_currency(currency_code),
         territory_code when territory_code != @no_territory <-
           Map.get(@territory_codes_all, currency_code) do
      {:ok, territory_code}
    else
      @no_territory ->
        {:error,
         {UnknownTerritoryError, "The currency #{inspect(currency_code)} has no territory"}}

      other ->
        other
    end
  end

  def fetch_territory_code!(currency_code) do
    with {:ok, currency_code} <- Cldr.validate_currency(currency_code),
         territory_code when territory_code != @no_territory <-
           Map.get(@territory_codes_all, currency_code) do
      territory_code
    else
      {:error, {Cldr.UnknownCurrencyError = error, message}} ->
        raise error, message

      @no_territory ->
        raise UnknownTerritoryError, "The currency #{inspect(currency_code)} has no territory"
    end
  end
end
