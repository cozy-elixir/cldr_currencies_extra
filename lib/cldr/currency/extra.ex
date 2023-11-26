defmodule Cldr.Currency.Extra do
  @moduledoc """
  Extra utils for `Cldr.Currency`.
  """

  alias __MODULE__.TerritoryCode

  @currency_codes [
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
    :BOV,
    :BRL,
    :BSD,
    :BTN,
    :BWP,
    :BYN,
    :BZD,
    :CAD,
    :CDF,
    :CHE,
    :CHF,
    :CHW,
    :CLF,
    :CLP,
    :CNH,
    :CNY,
    :COP,
    :COU,
    :CRC,
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
    :MXV,
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
    :SLL,
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
    :USN,
    :UYI,
    :UYU,
    :UYW,
    :UZS,
    :VED,
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

  @historical_currency_codes [
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
    :CUC,
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
    :HRK,
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

  # IMF - International Monetary Fund
  @imf_currency_codes [
    :XBA,
    :XBB,
    :XBC,
    :XBD,
    :XDR,
    :XSU,
    :XUA
  ]

  @historical_imf_currency_codes [
    :XRE
  ]

  @precious_metal_codes [
    :XAU,
    :XAG,
    :XPD,
    :XPT
  ]

  @testing_currency_codes [
    :XTS
  ]

  @misc_currency_codes [
    :XXX
  ]

  @extra_currency_codes [
    :JEP
  ]

  # For testing
  @doc false
  def cldr_currency_codes() do
    []
    |> Kernel.++(@currency_codes)
    |> Kernel.++(@historical_currency_codes)
    |> Kernel.++(@imf_currency_codes)
    |> Kernel.++(@historical_imf_currency_codes)
    |> Kernel.++(@precious_metal_codes)
    |> Kernel.++(@testing_currency_codes)
    |> Kernel.++(@misc_currency_codes)
    |> Enum.sort()
  end

  # For testing
  @doc false
  def all_currency_codes() do
    []
    |> Kernel.++(@currency_codes)
    |> Kernel.++(@historical_currency_codes)
    |> Kernel.++(@imf_currency_codes)
    |> Kernel.++(@historical_imf_currency_codes)
    |> Kernel.++(@precious_metal_codes)
    |> Kernel.++(@testing_currency_codes)
    |> Kernel.++(@misc_currency_codes)
    |> Kernel.++(@extra_currency_codes)
    |> Enum.sort()
  end

  @doc """
  Returns currency codes belongs to a type.
  """
  def currency_codes(:in_circulation), do: @currency_codes
  def currency_codes(:historical_in_circulation), do: @historical_currency_codes
  def currency_codes(:imf), do: @imf_currency_codes
  def currency_codes(:historical_imf), do: @historical_imf_currency_codes
  def currency_codes(:precious_metal), do: @precious_metal_codes
  def currency_codes(:testing), do: @testing_currency_codes
  def currency_codes(:misc), do: @misc_currency_codes
  def currency_codes(:extra), do: @extra_currency_codes

  @doc """
  Returns a territory code from a given currency code.
  """
  def territory_code_for_code(code), do: TerritoryCode.fetch_territory_code(code)

  @doc """
  Returns a territory code from a given currency code.
  """
  def territory_code_for_code!(code), do: TerritoryCode.fetch_territory_code!(code)
end
