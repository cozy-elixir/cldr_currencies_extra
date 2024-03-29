defmodule Cldr.Currency.ExtraTest do
  use ExUnit.Case
  alias Cldr.Currency.Extra, as: CurrencyExtra

  test "The currency codes provided by `Cldr.Currency` are handled" do
    assert CurrencyExtra.cldr_currency_codes() == Cldr.Currency.known_currency_codes()
  end

  describe "currency_codes/1" do
    test "returns currency codes as expected" do
      assert CurrencyExtra.currency_codes(:legal_tender) |> Enum.count() == 155
      assert CurrencyExtra.currency_codes(:legal_tender_extra) |> Enum.count() == 3
      assert CurrencyExtra.currency_codes(:legal_tender_to_be_deprecated) |> Enum.count() == 2
      assert CurrencyExtra.currency_codes(:legal_tender_deprecated) |> Enum.count() == 123
      assert CurrencyExtra.currency_codes(:non_legal_tender) |> Enum.count() == 11
      assert CurrencyExtra.currency_codes(:metal) |> Enum.count() == 4
      assert CurrencyExtra.currency_codes(:imf) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:imf_internal) |> Enum.count() == 6
      assert CurrencyExtra.currency_codes(:imf_deprecated) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:testing) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:misc) |> Enum.count() == 1
      assert CurrencyExtra.currency_codes(:circulating) |> Enum.count() == 165
      assert CurrencyExtra.currency_codes(:circulating_legal_tender) |> Enum.count() == 160
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

  describe "territory_code_for_code!/0" do
    test "returns a territory code" do
      assert :US = CurrencyExtra.territory_code_for_code!(:USD)
    end

    test "raises an error when the given currency code is invalid" do
      assert_raise Cldr.UnknownCurrencyError, "The currency :UNKNOWN is invalid", fn ->
        CurrencyExtra.territory_code_for_code!(:UNKNOWN)
      end
    end

    test "raises an error when the given currency code has no territory code" do
      assert_raise Cldr.UnknownTerritoryError, "The currency :XXX has no territory", fn ->
        CurrencyExtra.territory_code_for_code!(:XXX)
      end
    end
  end

  describe "symbol/1" do
    test "returns a symbol" do
      assert CurrencyExtra.symbol(:CNY) == {:ok, "¥"}
    end

    test "returns an error when the given currency code is invalid" do
      assert {:error, {RuntimeError, "no symbol found"}} = CurrencyExtra.symbol(:CNF)
    end
  end

  describe "symbol!/1" do
    test "returns a symbol" do
      assert CurrencyExtra.symbol!(:CNY) == "¥"
    end

    test "raises an error when the given currency code is invalid" do
      assert_raise RuntimeError, "no symbol found", fn ->
        CurrencyExtra.symbol!(:CNF)
      end
    end
  end
end
