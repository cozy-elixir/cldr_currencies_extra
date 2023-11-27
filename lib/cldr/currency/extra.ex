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

  @currency_codes_legal_tender [
    :AED,
    :AFN,
    :ALL,
    :AMD,
    :ANG,
    :AOA,
    :ARS,
    :AUD,
    :AWG,
    :AZN,
    :BAM,
    :BBD,
    :BDT,
    :BGN,
    :BHD,
    :BIF,
    :BMD,
    :BND,
    :BOB,
    :BRL,
    :BSD,
    :BTN,
    :BWP,
    :BYN,
    :BZD,
    :CAD,
    :CDF,
    :CHF,
    :CLP,
    :CNY,
    :COP,
    :CRC,
    :CUC,
    :CUP,
    :CVE,
    :CZK,
    :DJF,
    :DKK,
    :DOP,
    :DZD,
    :EGP,
    :ERN,
    :ETB,
    :EUR,
    :FJD,
    :FKP,
    :GBP,
    :GEL,
    :GHS,
    :GIP,
    :GMD,
    :GNF,
    :GTQ,
    :GYD,
    :HKD,
    :HNL,
    :HTG,
    :HUF,
    :IDR,
    :ILS,
    :INR,
    :IQD,
    :IRR,
    :ISK,
    :JMD,
    :JOD,
    :JPY,
    :KES,
    :KGS,
    :KHR,
    :KMF,
    :KPW,
    :KRW,
    :KWD,
    :KYD,
    :KZT,
    :LAK,
    :LBP,
    :LKR,
    :LRD,
    :LSL,
    :LYD,
    :MAD,
    :MDL,
    :MGA,
    :MKD,
    :MMK,
    :MNT,
    :MOP,
    :MRU,
    :MUR,
    :MVR,
    :MWK,
    :MXN,
    :MYR,
    :MZN,
    :NAD,
    :NGN,
    :NIO,
    :NOK,
    :NPR,
    :NZD,
    :OMR,
    :PAB,
    :PEN,
    :PGK,
    :PHP,
    :PKR,
    :PLN,
    :PYG,
    :QAR,
    :RON,
    :RSD,
    :RUB,
    :RWF,
    :SAR,
    :SBD,
    :SCR,
    :SDG,
    :SEK,
    :SGD,
    :SHP,
    :SLE,
    :SOS,
    :SRD,
    :SSP,
    :STN,
    :SVC,
    :SYP,
    :SZL,
    :THB,
    :TJS,
    :TMT,
    :TND,
    :TOP,
    :TRY,
    :TTD,
    :TWD,
    :TZS,
    :UAH,
    :UGX,
    :USD,
    :UYU,
    :UZS,
    :VES,
    :VND,
    :VUV,
    :WST,
    :XAF,
    :XCD,
    :XOF,
    :XPF,
    :YER,
    :ZAR,
    :ZMW
  ]

  # these currency codes are not included in CLDR
  @currency_codes_legal_tender_extra [
    :GGP,
    :IMP,
    :JEP
  ]

  # these currency codes are deprecated but still used
  @currency_codes_legal_tender_to_be_deprecated [
    :HRK,
    :SLL
  ]

  @currency_codes_legal_tender_deprecated [
    :ADP,
    :AFA,
    :ALK,
    :AOK,
    :AON,
    :AOR,
    :ARA,
    :ARL,
    :ARM,
    :ARP,
    :ATS,
    :AZM,
    :BAD,
    :BAN,
    :BEC,
    :BEF,
    :BEL,
    :BGM,
    :BGL,
    :BGO,
    :BOL,
    :BOP,
    :BRB,
    :BRC,
    :BRE,
    :BRN,
    :BRR,
    :BRZ,
    :BUK,
    :BYB,
    :BYR,
    :CLE,
    :CNX,
    :CSD,
    :CSK,
    :CYP,
    :DDM,
    :DEM,
    :ECS,
    :ECV,
    :EEK,
    :ESA,
    :ESB,
    :ESP,
    :FIM,
    :FRF,
    :GEK,
    :GHC,
    :GNS,
    :GQE,
    :GRD,
    :GWE,
    :GWP,
    :HRD,
    :IEP,
    :ILP,
    :ILR,
    :ISJ,
    :ITL,
    :KRH,
    :KRO,
    :LTL,
    :LTT,
    :LUC,
    :LUF,
    :LUL,
    :LVL,
    :LVR,
    :MAF,
    :MCF,
    :MDC,
    :MGF,
    :MKN,
    :MLF,
    :MRO,
    :MTL,
    :MTP,
    :MVP,
    :MXP,
    :MZE,
    :MZM,
    :NIC,
    :NLG,
    :PEI,
    :PES,
    :PLZ,
    :PTE,
    :RHD,
    :ROL,
    :RUR,
    :SDD,
    :SDP,
    :SIT,
    :SKK,
    :SRG,
    :STD,
    :SUR,
    :TJR,
    :TMM,
    :TPE,
    :TRL,
    :UAK,
    :UGS,
    :USS,
    :UYP,
    :VEB,
    :VEF,
    :VNN,
    :XEU,
    :XFO,
    :XFU,
    :YDD,
    :YUD,
    :YUM,
    :YUN,
    :YUR,
    :ZAL,
    :ZMK,
    :ZRN,
    :ZRZ,
    :ZWD,
    :ZWL,
    :ZWR
  ]

  @currency_codes_non_legal_tender [
    :BOV,
    :CHE,
    :CHW,
    :CLF,
    :CNH,
    :COU,
    :MXV,
    :USN,
    :UYI,
    :UYW,
    :VED
  ]

  @currency_codes_metal [
    :XAG,
    :XAU,
    :XPD,
    :XPT
  ]

  @currency_codes_imf [
    :XDR
  ]

  @currency_codes_imf_internal [
    :XBA,
    :XBB,
    :XBC,
    :XBD,
    :XSU,
    :XUA
  ]

  @currency_codes_imf_deprecated [
    :XRE
  ]

  @currency_codes_testing [
    :XTS
  ]

  @currency_codes_misc [
    :XXX
  ]

  @currency_codes_international [
                                  @currency_codes_legal_tender,
                                  @currency_codes_legal_tender_extra,
                                  @currency_codes_legal_tender_to_be_deprecated,
                                  @currency_codes_metal,
                                  @currency_codes_imf
                                ]
                                |> Enum.concat()
                                |> Enum.sort()

  @currency_codes_international_paper_money [
                                              @currency_codes_legal_tender,
                                              @currency_codes_legal_tender_extra,
                                              @currency_codes_legal_tender_to_be_deprecated
                                            ]
                                            |> Enum.concat()
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
          | :international
          | :international_paper_money
  @type currency_code :: Cldr.Currency.code()
  @type territory_code :: Cldr.Currency.territory()
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
  def all_currency_codes() do
    []
    |> Kernel.++(@currency_codes_legal_tender)
    |> Kernel.++(@currency_codes_legal_tender_extra)
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
  def currency_codes(:international), do: @currency_codes_international
  def currency_codes(:international_paper_money), do: @currency_codes_international_paper_money

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
end
