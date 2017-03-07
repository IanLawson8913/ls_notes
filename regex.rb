++++++++++++++++++++++++++++++
+++++++++++REGEX++++++++++++++
++++++++++++++++++++++++++++++

str = 'cast'
print "matched 's'" if str.match(/s/)
print "matched 'x'" if str.match(/x/)

p str.match(/s/)
p str.match(/x/)

$ ^ * + ? . ( ) [ ] { } | \
meta chars inside regex
^ \ - [ ]
metta chars inside Character Classes /[]/

================================
   CHARACTER CLASSES  /[abc]/
================================

only these chars are meta chars inside CHARACTER CLASS


patterns that let you specify a set of characters that you want to match

list of chars between /[ ]/

/[abc]/

can be used to check upper and lower case without using the i flag

/[Hh]oover/ 
matches "Hoover" or "hoover", but not "HOOVER".

/[abc][12]/ 
matches any two chars where first is a, b, or c and second is 1 or 2

/[a-z]/
/[0-5][a-h]/
/[0-9A-Fa-f]/
ranges inside CHARACTER CLASSES

+++++++++++++++++++++++++++++++++
    CHARACTER CLASS SHORTCUTS
+++++++++++++++++++++++++++++++++

/./
Any Char
cannot be used inside [] inside means literal .

/\s/
/[a-z\s]/
Whitespace Chars
can be used inside [] ( provides aditional alternative to a-z )

/\S/
/[a-z\S]/
Non-Whitespace chars
can be used inside []

/\d/
any Decimal Digit (0-9)
/\D/
any character Non Decimal Digit

/\h/
any Hexidecimal Digit
/\H/
any Non Hexidecimal Digit


/\w/
"word characters"
[a-zA-Z0-9] and _

/\W/
non "word characters"

All above can be used inside [] but /./

++++++++++++++++++++++++++
        ANCHORS
++++++++++++++++++++++++++

LINE DEPENDENT
/^cat/
matches cat only if 'cat' is at the beginning of a line

/cat$/
matches cat only if 'cat' is at the end of a line

/^cat$/
only if 'cat' at the beginning and end of a line

# these anchors will behave treat /n in strings as new lines, thus
# changing how they interact with first and last characters

STRING DEPENDENT
/\Acat/
matches cat if at the beginning of a strings

/\z/
always matches the end of string

/\Z/
match up to but not included a newline at the end of the string

# as a rule, us \z unless you really need \Z
# \A and \z are usually recommended over ^ and $

WORD BOUNDARIES

# word boundaries occur at the beginning or end of a sequence of word chars
# bounded by either whitespace or the biginning / end of string

# non word boundary occurs everywhere else

/\b/
word boundary

/\B/
non word boundary

+++++++++++++++++++++++++++
        QUANTIFIERS
+++++++++++++++++++++++++++

/co*t/
matches 'c' followed by 0 or more 'o's followed by 't'
/1(234)*5/
matches '234' as delimited by paranthesis

/co+t/
1 or more

/co?t/
0 or 1

# if matching for one pattern occuring 0 times, you may select everything
/h*/
/o?/

----RANGE

/\d{5}/
exactly 5 in length

/\d{4,}/
at least 4 in length

/\b[a-z]{5,8}\b/i
all words between 5 and 8 (inclusive) letters

----Lazy Quantifier /a?/
/a[abc]*?c/
# ? after quantifier
# priority given to match with shorter length

+++++++++++++++++++++++++++++++++++++++++++++++++++

+REAL LIFE EXAMPLES+ ==================== +STRINGS+

+++++++++++++++++++++++++++++++++++++++++++++++++++

Matching Strings

fetch_url(text) if text.match(/\Ahttps?:\/\/\S+\z/)

# returns a value that is truthy (MatchData object) if match
# nil if no match
# if object is save to variable; 
# - variable[0] variable [1] represent matched parts of text

or

fetch_url(text) if text =~ /\Ahttps?:\/\/\S+\z/

# The =~ operator is much faster than #match
# - it returns the index within the string at which regex matched
# - nil if no match

String.scan method is also used
# global form of #match that returns an Array of all matching substrings

Splitting Strings

record = "xyzzy\t3456\t334\tabc"
fields = record.split("\t")
# -> ['xyzzy', '3456', '334', 'abc']

# Dealing with one or more whitespace using regex

record = "xyzzy  3456  \t  334\t\t\tabc"
fields = record.split(/\s+/)
# -> ['xyzzy', '3456', '334', 'abc']


Capturing Groups

/['"].+?['"]/

/(['"]).+?\1/

# \1 is called a backreference
# - it references the first capturing group of the regex
# - in this ex it will match either ' or " depending on which was found

Transformation

text = 'Four score and seven'
vowelless = text.gsub(/[aeiou]/, '')
# -> 'Fr scr nd svn'

# or gsub!

text = %(We read "War of the Worlds".)
puts text.sub(/(['"]).+\1/, '\1The Time Machine\1')
# prints: We read "The Time Machine".

# One thing to note here is that if you double quote the replacement string, 
# you need to double up on the backslashes:

puts text.sub(/(['"]).+\1/, "\\1The Time Machine\\1")

# try to avoid double quotes for this reason

