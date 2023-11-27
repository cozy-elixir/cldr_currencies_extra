defmodule Cldr.Currency.ExtraTest do
  use ExUnit.Case
  alias Cldr.Currency.Extra, as: CurrencyExtra

  test "The currency codes provided by `Cldr.Currency` are handled" do
    assert CurrencyExtra.cldr_currency_codes() == Cldr.Currency.known_currency_codes()
  end

  describe "currency_code/1" do
    test "returns currency codes as expected" do
      assert CurrencyExtra.currency_codes(:legal_tender) |> Enum.count() == 157
      assert CurrencyExtra.currency_codes(:legal_tender_extra) |> Enum.count() == 3
      assert CurrencyExtra.currency_codes(:legal_tender_deprecated) |> Enum.count() == 125
      assert CurrencyExtra.currency_codes(:non_legal_tender) |> Enum.count() == 9
      assert CurrencyExtra.currency_codes(:metal) |> Enum.count() == 4
      assert CurrencyExtra.currency_codes(:imf) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:imf_internal) |> Enum.count() == 6
      assert CurrencyExtra.currency_codes(:imf_deprecated) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:testing) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:misc) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:international) |> Enum.count() == 165
    end

    test "raises an error when the unknown group is given" do
      assert_raise ArgumentError, "unknown currency group - :unknown", fn ->
        CurrencyExtra.currency_codes(:unknown)
      end
    end
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
