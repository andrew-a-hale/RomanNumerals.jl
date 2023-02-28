module RomanNumerals

export to_int, to_roman_numeral

function build_regex(roman_numerals)
    regex = string()
    for (sym, _) ∈ roman_numerals
        regex *= "($sym)*"
    end
    return Regex(regex)
end

const roman_numerals = [("M", 1000), ("CM", 900), ("D", 500), ("CD", 400), ("C", 100), ("XC", 90), 
                        ("L", 50), ("XL", 40), ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1)]
const roman_numeral_regex = build_regex(roman_numerals)

to_roman_numeral(n::Any) = throw(ArgumentError("Expected an Int, got $n"))
function to_roman_numeral(n::Int)
    if (n < 0) 
        throw(ArgumentError("Expect a positive value, got $n"))
    end

    roman_numeral = string()
    for (sym, value) ∈ roman_numerals
        sym_fit = div(n, value)
        roman_numeral *= repeat(sym, sym_fit)
        n -= value * sym_fit
    end
    return roman_numeral
end

to_int(rn::Any) = throw(ArgumentError("Expected a String, got $rn"))
function to_int(rn::String)
    if (match(roman_numeral_regex, rn).match == "")
        throw(ArgumentError("Expected a valid Roman Numeral, got $rn"))
    end

    n = 0
    for (sym, value) ∈ roman_numerals
        while first(rn, length(sym)) == sym
            n += value
            rn = rn[(length(sym)+1):end] # peel first symbol
        end
    end
    return n
end

end