defmodule Cldr.Currency.Extra do
  @moduledoc """
  Extra utils for `Cldr.Currency`.

  > #### Note {: .info}
  >
  > Strictly speaking, this package doesn't rely on data provided by CLDR.
  > However, it addresses issues related to `Cldr.Currency`, so it uses the relevant naming
  > convention. If CLDR provides the related data one day, there will be no need to rename.

  ## References

  ### ISO 3166

    * [ISO 3166 from WIKIPEDIA](https://en.wikipedia.org/wiki/ISO_3166):
      * [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1)
      * [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)
      * [ISO 3166-3](https://en.wikipedia.org/wiki/ISO_3166-3)

  ### ISO 4217

    * [ISO 4217 from WIKIPEDIA](https://en.wikipedia.org/wiki/ISO_4217)

  ### WIKIPEDIA

    * [List of circulating currencies](https://en.wikipedia.org/wiki/List_of_circulating_currencies)

  """

  alias __MODULE__.TerritoryCode

  @currency_legal_tender %{
    AED: %{symbol: "د.إ‎"},
    AFN: %{symbol: "؋"},
    ALL: %{symbol: "L"},
    AMD: %{symbol: "֏"},
    ANG: %{symbol: "NAƒ"},
    AOA: %{symbol: "Kz"},
    ARS: %{symbol: "Arg$"},
    AUD: %{symbol: "A$"},
    AWG: %{symbol: "Afl."},
    AZN: %{symbol: "₼"},
    BAM: %{symbol: "KM"},
    BBD: %{symbol: "Bds$"},
    BDT: %{symbol: "৳"},
    BGN: %{symbol: "лв."},
    BHD: %{symbol: "BD"},
    BIF: %{symbol: "FBu"},
    BMD: %{symbol: "BD$"},
    BND: %{symbol: "B$"},
    BOB: %{symbol: "Bs."},
    BRL: %{symbol: "R$"},
    BSD: %{symbol: "B$"},
    BTN: %{symbol: "Nu."},
    BWP: %{symbol: "P"},
    BYN: %{symbol: "Br"},
    BZD: %{symbol: "BZ$"},
    CAD: %{symbol: "C$"},
    CDF: %{symbol: "Fr"},
    CHF: %{symbol: "Fr"},
    CLP: %{symbol: "CLP$"},
    CNY: %{symbol: "¥"},
    COP: %{symbol: "COP$"},
    CRC: %{symbol: "₡"},
    CUC: %{symbol: "$"},
    CUP: %{symbol: "$MN"},
    CVE: %{symbol: "Esc"},
    CZK: %{symbol: "Kč"},
    DJF: %{symbol: "Fdj"},
    DKK: %{symbol: "Kr"},
    DOP: %{symbol: "RD$"},
    DZD: %{symbol: "دج"},
    EGP: %{symbol: "E£"},
    ERN: %{symbol: "Nfk"},
    ETB: %{symbol: "Br"},
    EUR: %{symbol: "€"},
    FJD: %{symbol: "FJ$"},
    FKP: %{symbol: "£"},
    GBP: %{symbol: "£"},
    GEL: %{symbol: "₾"},
    GHS: %{symbol: "GH₵"},
    GIP: %{symbol: "£"},
    GMD: %{symbol: "D"},
    GNF: %{symbol: "FG"},
    GTQ: %{symbol: "Q"},
    GYD: %{symbol: "G$"},
    HKD: %{symbol: "HK$"},
    HNL: %{symbol: "L"},
    HTG: %{symbol: "G"},
    HUF: %{symbol: "Ft"},
    IDR: %{symbol: "Rp"},
    ILS: %{symbol: "₪"},
    INR: %{symbol: "₹"},
    IQD: %{symbol: "د.ع"},
    IRR: %{symbol: "﷼"},
    ISK: %{symbol: "kr"},
    JMD: %{symbol: "J$"},
    JOD: %{symbol: "د.أ"},
    JPY: %{symbol: "¥"},
    KES: %{symbol: "KSh"},
    KGS: %{symbol: "⃀"},
    KHR: %{symbol: "៛"},
    KMF: %{symbol: "CF"},
    KPW: %{symbol: "₩"},
    KRW: %{symbol: "₩"},
    KWD: %{symbol: "د.ك"},
    KYD: %{symbol: "$"},
    KZT: %{symbol: "₸"},
    LAK: %{symbol: "₭"},
    LBP: %{symbol: "L£"},
    LKR: %{symbol: "Rs"},
    LRD: %{symbol: "CI$"},
    LSL: %{symbol: "L"},
    LYD: %{symbol: "ل.د"},
    MAD: %{symbol: "درهم"},
    MDL: %{symbol: "L"},
    MGA: %{symbol: "Ar"},
    MKD: %{symbol: "ден"},
    MMK: %{symbol: "K"},
    MNT: %{symbol: "₮"},
    MOP: %{symbol: "MOP$"},
    MRU: %{symbol: "UM"},
    MUR: %{symbol: "Rs"},
    MVR: %{symbol: "Rf"},
    MWK: %{symbol: "K"},
    MXN: %{symbol: "Mex$"},
    MYR: %{symbol: "RM"},
    MZN: %{symbol: "MT"},
    NAD: %{symbol: "N$"},
    NGN: %{symbol: "₦"},
    NIO: %{symbol: "C$"},
    NOK: %{symbol: "kr"},
    NPR: %{symbol: "Rs"},
    NZD: %{symbol: "$"},
    OMR: %{symbol: "ر.ع."},
    PAB: %{symbol: "B/."},
    PEN: %{symbol: "S/"},
    PGK: %{symbol: "K"},
    PHP: %{symbol: "₱"},
    PKR: %{symbol: "Rs"},
    PLN: %{symbol: "zł"},
    PYG: %{symbol: "₲"},
    QAR: %{symbol: "ر.ق"},
    RON: %{symbol: "Lei"},
    RSD: %{symbol: "дин"},
    RUB: %{symbol: "₽"},
    RWF: %{symbol: "RF"},
    SAR: %{symbol: "ر.س"},
    SBD: %{symbol: "SI$"},
    SCR: %{symbol: "SRe"},
    SDG: %{symbol: "ج.س"},
    SEK: %{symbol: "kr"},
    SGD: %{symbol: "S$"},
    SHP: %{symbol: "£"},
    SLE: %{symbol: "Le"},
    SOS: %{symbol: "Sh.So."},
    SRD: %{symbol: "Sr$"},
    SSP: %{symbol: "£"},
    STN: %{symbol: "Db"},
    SVC: %{symbol: "₡"},
    SYP: %{symbol: "£"},
    SZL: %{symbol: "L"},
    THB: %{symbol: "฿"},
    TJS: %{symbol: "SM"},
    TMT: %{symbol: "m"},
    TND: %{symbol: "د.ت"},
    TOP: %{symbol: "T$"},
    TRY: %{symbol: "₺"},
    TTD: %{symbol: "TT$"},
    TWD: %{symbol: "NT$"},
    TZS: %{symbol: "TSh"},
    UAH: %{symbol: "₴"},
    UGX: %{symbol: "USh"},
    USD: %{symbol: "$"},
    UYU: %{symbol: "$U"},
    UZS: %{symbol: "so'm"},
    VES: %{symbol: "Bs."},
    VND: %{symbol: "₫"},
    VUV: %{symbol: "VT"},
    WST: %{symbol: "WS$"},
    XAF: %{symbol: "Fr"},
    XCD: %{symbol: "EC$"},
    XOF: %{symbol: "Fr"},
    XPF: %{symbol: "F"},
    YER: %{symbol: "﷼"},
    ZAR: %{symbol: "R"},
    ZMW: %{symbol: "ZK"}
  }
  @currency_codes_legal_tender Map.keys(@currency_legal_tender)

  # these currency codes are not included in CLDR
  @currency_legal_tender_extra %{
    GGP: %{symbol: "£"},
    IMP: %{symbol: "£"},
    JEP: %{symbol: "£"}
  }
  @currency_codes_legal_tender_extra Map.keys(@currency_legal_tender_extra)

  # these currency codes are deprecated but still used
  @currency_legal_tender_to_be_deprecated %{
    HRK: %{symbol: "kn"},
    SLL: %{symbol: "Le"}
  }
  @currency_codes_legal_tender_to_be_deprecated Map.keys(@currency_legal_tender_to_be_deprecated)

  @currency_legal_tender_deprecated %{
    ADP: %{symbol: nil},
    AFA: %{symbol: nil},
    ALK: %{symbol: nil},
    AOK: %{symbol: nil},
    AON: %{symbol: nil},
    AOR: %{symbol: nil},
    ARA: %{symbol: nil},
    ARL: %{symbol: nil},
    ARM: %{symbol: nil},
    ARP: %{symbol: nil},
    ATS: %{symbol: nil},
    AZM: %{symbol: nil},
    BAD: %{symbol: nil},
    BAN: %{symbol: nil},
    BEC: %{symbol: nil},
    BEF: %{symbol: nil},
    BEL: %{symbol: nil},
    BGM: %{symbol: nil},
    BGL: %{symbol: nil},
    BGO: %{symbol: nil},
    BOL: %{symbol: nil},
    BOP: %{symbol: nil},
    BRB: %{symbol: nil},
    BRC: %{symbol: nil},
    BRE: %{symbol: nil},
    BRN: %{symbol: nil},
    BRR: %{symbol: nil},
    BRZ: %{symbol: nil},
    BUK: %{symbol: nil},
    BYB: %{symbol: nil},
    BYR: %{symbol: nil},
    CLE: %{symbol: nil},
    CNX: %{symbol: nil},
    CSD: %{symbol: nil},
    CSK: %{symbol: nil},
    CYP: %{symbol: nil},
    DDM: %{symbol: nil},
    DEM: %{symbol: nil},
    ECS: %{symbol: nil},
    ECV: %{symbol: nil},
    EEK: %{symbol: nil},
    ESA: %{symbol: nil},
    ESB: %{symbol: nil},
    ESP: %{symbol: "₧"},
    FIM: %{symbol: nil},
    FRF: %{symbol: nil},
    GEK: %{symbol: nil},
    GHC: %{symbol: nil},
    GNS: %{symbol: nil},
    GQE: %{symbol: nil},
    GRD: %{symbol: nil},
    GWE: %{symbol: nil},
    GWP: %{symbol: nil},
    HRD: %{symbol: nil},
    IEP: %{symbol: nil},
    ILP: %{symbol: nil},
    ILR: %{symbol: nil},
    ISJ: %{symbol: nil},
    ITL: %{symbol: nil},
    KRH: %{symbol: nil},
    KRO: %{symbol: nil},
    LTL: %{symbol: "Lt"},
    LTT: %{symbol: nil},
    LUC: %{symbol: nil},
    LUF: %{symbol: nil},
    LUL: %{symbol: nil},
    LVL: %{symbol: "Ls"},
    LVR: %{symbol: nil},
    MAF: %{symbol: nil},
    MCF: %{symbol: nil},
    MDC: %{symbol: nil},
    MGF: %{symbol: nil},
    MKN: %{symbol: nil},
    MLF: %{symbol: nil},
    MRO: %{symbol: nil},
    MTL: %{symbol: nil},
    MTP: %{symbol: nil},
    MVP: %{symbol: nil},
    MXP: %{symbol: nil},
    MZE: %{symbol: nil},
    MZM: %{symbol: nil},
    NIC: %{symbol: nil},
    NLG: %{symbol: nil},
    PEI: %{symbol: nil},
    PES: %{symbol: nil},
    PLZ: %{symbol: nil},
    PTE: %{symbol: nil},
    RHD: %{symbol: nil},
    ROL: %{symbol: nil},
    RUR: %{symbol: "p."},
    SDD: %{symbol: nil},
    SDP: %{symbol: nil},
    SIT: %{symbol: nil},
    SKK: %{symbol: nil},
    SRG: %{symbol: nil},
    STD: %{symbol: nil},
    SUR: %{symbol: nil},
    TJR: %{symbol: nil},
    TMM: %{symbol: nil},
    TPE: %{symbol: nil},
    TRL: %{symbol: nil},
    UAK: %{symbol: nil},
    UGS: %{symbol: nil},
    USS: %{symbol: nil},
    UYP: %{symbol: nil},
    VEB: %{symbol: nil},
    VEF: %{symbol: "Bs"},
    VNN: %{symbol: nil},
    XEU: %{symbol: nil},
    XFO: %{symbol: nil},
    XFU: %{symbol: nil},
    YDD: %{symbol: nil},
    YUD: %{symbol: nil},
    YUM: %{symbol: nil},
    YUN: %{symbol: nil},
    YUR: %{symbol: nil},
    ZAL: %{symbol: nil},
    ZMK: %{symbol: nil},
    ZRN: %{symbol: nil},
    ZRZ: %{symbol: nil},
    ZWD: %{symbol: nil},
    ZWL: %{symbol: nil},
    ZWR: %{symbol: nil}
  }
  @currency_codes_legal_tender_deprecated Map.keys(@currency_legal_tender_deprecated)

  @currency_non_legal_tender %{
    BOV: %{symbol: nil},
    CHE: %{symbol: nil},
    CHW: %{symbol: nil},
    CLF: %{symbol: nil},
    CNH: %{symbol: nil},
    COU: %{symbol: nil},
    MXV: %{symbol: nil},
    USN: %{symbol: nil},
    UYI: %{symbol: nil},
    UYW: %{symbol: nil},
    VED: %{symbol: nil}
  }
  @currency_codes_non_legal_tender Map.keys(@currency_non_legal_tender)

  @currency_metal %{
    XAG: %{symbol: nil},
    XAU: %{symbol: nil},
    XPD: %{symbol: nil},
    XPT: %{symbol: nil}
  }
  @currency_codes_metal Map.keys(@currency_metal)

  @currency_imf %{
    XDR: %{symbol: nil}
  }
  @currency_codes_imf Map.keys(@currency_imf)

  @currency_imf_internal %{
    XBA: %{symbol: nil},
    XBB: %{symbol: nil},
    XBC: %{symbol: nil},
    XBD: %{symbol: nil},
    XSU: %{symbol: nil},
    XUA: %{symbol: nil}
  }
  @currency_codes_imf_internal Map.keys(@currency_imf_internal)

  @currency_imf_deprecated %{
    XRE: %{symbol: nil}
  }
  @currency_codes_imf_deprecated Map.keys(@currency_imf_deprecated)

  @currency_testing %{
    XTS: %{symbol: nil}
  }
  @currency_codes_testing Map.keys(@currency_testing)

  @currency_misc %{
    XXX: %{symbol: nil}
  }
  @currency_codes_misc Map.keys(@currency_misc)

  @currency_codes_circulating [
                                @currency_codes_legal_tender,
                                @currency_codes_legal_tender_extra,
                                @currency_codes_legal_tender_to_be_deprecated,
                                @currency_codes_metal,
                                @currency_codes_imf
                              ]
                              |> Enum.concat()
                              |> Enum.sort()

  @currency_codes_circulating_legal_tender [
                                             @currency_codes_legal_tender,
                                             @currency_codes_legal_tender_extra,
                                             @currency_codes_legal_tender_to_be_deprecated
                                           ]
                                           |> Enum.concat()
                                           |> Enum.sort()

  @currency_all %{}
                |> Map.merge(@currency_legal_tender)
                |> Map.merge(@currency_legal_tender_extra)
                |> Map.merge(@currency_legal_tender_to_be_deprecated)
                |> Map.merge(@currency_legal_tender_deprecated)
                |> Map.merge(@currency_non_legal_tender)
                |> Map.merge(@currency_metal)
                |> Map.merge(@currency_imf)
                |> Map.merge(@currency_imf_internal)
                |> Map.merge(@currency_imf_deprecated)
                |> Map.merge(@currency_testing)
                |> Map.merge(@currency_misc)

  @currency_codes_all @currency_all
                      |> Map.keys()
                      |> Enum.sort()

  @type currency_group ::
          :legal_tender
          | :legal_tender_extra
          | :legal_tender_to_be_deprecated
          | :legal_tender_deprecated
          | :non_legal_tender
          | :metal
          | :imf
          | :imf_internal
          | :imf_deprecated
          | :testing
          | :misc
          | :circulating
          | :circulating_legal_tender
  @type currency_code :: Cldr.Currency.code()
  @type territory_code :: Cldr.Currency.territory()
  @type symbol :: String.t()
  @type message :: String.t()

  # For testing
  @doc false
  def cldr_currency_codes() do
    []
    |> Kernel.++(@currency_codes_legal_tender)
    |> Kernel.++(@currency_codes_legal_tender_to_be_deprecated)
    |> Kernel.++(@currency_codes_legal_tender_deprecated)
    |> Kernel.++(@currency_codes_non_legal_tender)
    |> Kernel.++(@currency_codes_metal)
    |> Kernel.++(@currency_codes_imf)
    |> Kernel.++(@currency_codes_imf_internal)
    |> Kernel.++(@currency_codes_imf_deprecated)
    |> Kernel.++(@currency_codes_testing)
    |> Kernel.++(@currency_codes_misc)
    |> Enum.sort()
  end

  # For testing
  @doc false
  def all_currency_codes(), do: @currency_codes_all

  @doc """
  Returns a list of currency codes belong to a group.
  """
  @spec currency_codes(currency_group()) :: [currency_code()]
  def currency_codes(:legal_tender), do: @currency_codes_legal_tender
  def currency_codes(:legal_tender_extra), do: @currency_codes_legal_tender_extra

  def currency_codes(:legal_tender_to_be_deprecated),
    do: @currency_codes_legal_tender_to_be_deprecated

  def currency_codes(:legal_tender_deprecated), do: @currency_codes_legal_tender_deprecated
  def currency_codes(:non_legal_tender), do: @currency_codes_non_legal_tender
  def currency_codes(:metal), do: @currency_codes_metal
  def currency_codes(:imf), do: @currency_codes_imf
  def currency_codes(:imf_internal), do: @currency_codes_imf_internal
  def currency_codes(:imf_deprecated), do: @currency_codes_imf_deprecated
  def currency_codes(:testing), do: @currency_codes_testing
  def currency_codes(:misc), do: @currency_codes_misc
  def currency_codes(:circulating), do: @currency_codes_circulating
  def currency_codes(:circulating_legal_tender), do: @currency_codes_circulating_legal_tender

  def currency_codes(currency_group),
    do: raise(ArgumentError, "unknown currency group - #{inspect(currency_group)}")

  @doc """
  Fetches a territory code corresponding to a given currency code.
  """
  @spec territory_code_for_code(currency_code()) ::
          {:ok, territory_code()}
          | {:error, {Cldr.UnknownCurrencyError, message()}}
          | {:error, {Cldr.UnknownTerritoryError, message()}}
  def territory_code_for_code(currency_code),
    do: TerritoryCode.fetch_territory_code(currency_code)

  @doc """
  Fetches a territory code corresponding to a given currency code.
  """
  @spec territory_code_for_code!(currency_code()) :: territory_code()
  def territory_code_for_code!(currency_code),
    do: TerritoryCode.fetch_territory_code!(currency_code)

  @doc """
  Fetches a symbol corresponding to given currency code.
  """
  @spec symbol(currency_code()) ::
          {:ok, symbol()}
          | {:error, {RuntimeError, String.t()}}
  def symbol(currency_code) do
    case get_in(@currency_all, [currency_code, :symbol]) do
      nil -> {:error, {RuntimeError, "no symbol found"}}
      symbol -> {:ok, symbol}
    end
  end

  @doc """
  Fetches a symbol corresponding to given currency code.
  """
  @spec symbol!(currency_code()) :: symbol()
  def symbol!(currency_code) do
    case get_in(@currency_all, [currency_code, :symbol]) do
      nil -> raise RuntimeError, "no symbol found"
      symbol -> symbol
    end
  end
end
