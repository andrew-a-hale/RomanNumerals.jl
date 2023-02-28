using Test, RomanNumerals

begin # to_int
    @test to_int("IV") == 4
    @test to_int("IX") == 9
    @test to_int("MMMDCCCLXXXVIII") == 3888
    @test to_int("MCM") == 1900

    @test_throws "ArgumentError" to_int("")
    @test_throws "ArgumentError" to_int("A")
    @test_throws "ArgumentError" to_int(nothing)
    @test_throws "ArgumentError" to_int(missing)
    @test_throws "ArgumentError" to_int(1.0)
    @test_throws "ArgumentError" to_int(1)
end