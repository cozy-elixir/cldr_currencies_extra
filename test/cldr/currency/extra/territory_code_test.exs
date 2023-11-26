defmodule Cldr.Currency.Extra.TerritoryCodeTest do
  use ExUnit.Case
  alias Cldr.Currency.Extra, as: CurrencyExtra
  alias Cldr.Currency.Extra.TerritoryCode, as: CurrencyExtraTerritoryCode

  test "The currency codes provided by `Cldr.Currency.Extra` are handled" do
    assert CurrencyExtra.all_currency_codes() ==
             CurrencyExtraTerritoryCode.all_currency_codes()
  end
end
