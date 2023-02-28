using Test, RomanNumerals

begin # to_roman_numeral
    @test to_roman_numeral(0) == ""
    @test to_roman_numeral(4) == "IV"
    @test to_roman_numeral(9) == "IX"
    @test to_roman_numeral(3888) == "MMMDCCCLXXXVIII"
    @test to_roman_numeral(1900) == "MCM"

    @test_throws "ArgumentError" to_roman_numeral(-1)
    @test_throws "ArgumentError" to_roman_numeral(nothing)
    @test_throws "ArgumentError" to_roman_numeral(missing)
    @test_throws "ArgumentError" to_roman_numeral("")
    @test_throws "ArgumentError" to_roman_numeral(1.0)
end