defmodule Cldr.Currency.ExtraTest do
  use ExUnit.Case
  alias Cldr.Currency.Extra, as: CurrencyExtra

  test "The currency codes provided by `Cldr.Currency` are handled" do
    assert CurrencyExtra.cldr_currency_codes() == Cldr.Currency.known_currency_codes()
  end

  describe "currency_code/1" do
    assert 166 == CurrencyExtra.currency_codes(:in_circulation) |> Enum.count()
    assert 125 == CurrencyExtra.currency_codes(:historical_in_circulation) |> Enum.count()
    assert 7 == CurrencyExtra.currency_codes(:imf) |> Enum.count()
    assert 1 == CurrencyExtra.currency_codes(:historical_imf) |> Enum.count()
    assert 4 == CurrencyExtra.currency_codes(:precious_metal) |> Enum.count()
    assert 1 == CurrencyExtra.currency_codes(:testing) |> Enum.count()
    assert 1 == CurrencyExtra.currency_codes(:misc) |> Enum.count()
    assert 1 == CurrencyExtra.currency_codes(:extra) |> Enum.count()
  end

  describe "territory_code_for_code/0" do
    test "returns a territory code" do
      assert {:ok, :US} = CurrencyExtra.territory_code_for_code(:USD)
    end

    test "returns an error when the given currency code is invalid" do
      assert {:error, {Cldr.UnknownCurrencyError, "The currency :UNKNOWN is invalid"}} =
               CurrencyExtra.territory_code_for_code(:UNKNOWN)
    end

    test "returns an error when the given currency code has no territory code" do
      assert {:error, {Cldr.UnknownTerritoryError, "The currency :XXX has no territory"}} =
               CurrencyExtra.territory_code_for_code(:XXX)
    end
  end
end
