module RomanNumerals

export to_int, to_roman_numeral

const ROMAN_NUMERALS = [("M", 1000), ("CM", 900), ("D", 500), ("CD", 400), ("C", 100), ("XC", 90), 
                        ("L", 50), ("XL", 40), ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1)]
const ROMAN_NUMERALS_REGEX = Regex(mapreduce(x -> "(" * x[1] * ")*", *, ROMAN_NUMERALS))

to_roman_numeral(n::Any) = throw(ArgumentError("Expected an Int, got $n"))
function to_roman_numeral(n::Int)
    if (n < 0) 
        throw(ArgumentError("Expect a positive value, got $n"))
    end

    roman_numeral = string()
    for (sym, value) ∈ ROMAN_NUMERALS
        sym_fit = div(n, value)
        roman_numeral *= repeat(sym, sym_fit)
        n -= value * sym_fit
    end
    return roman_numeral
end

to_int(rn::Any) = throw(ArgumentError("Expected a String, got $rn"))
function to_int(rn::String)
    if (match(ROMAN_NUMERALS_REGEX, rn).match == "")
        throw(ArgumentError("Expected a valid Roman Numeral, got $rn"))
    end

    n = 0
    for (sym, value) ∈ ROMAN_NUMERALS
        while first(rn, length(sym)) == sym
            n += value
            rn = rn[(length(sym)+1):end] # remove leftmost symbol
        end
    end
    return n
end

end