=begin
PROBLEM:
write a program that given a month, year, day of week, and
type of day, can determine what day a meetup will be
 
 INPUT:
 - #initialize -> month (int) and year (int)
 - #day -> day of week (symbol) and type of day (first, second, third, fourth, or last (of month); teenth)
 OUTPUT: (#day) -> date object for day of meetup)
 
 QUESTIONS:
 - Are there any patterns that always hold true about 'teenths' that can help simplify the solution?
    -- a first or fourth *day of the month won't be a teenth; a second or third can be (validate)
 - How can we check what day of the week a specific calendar day is? 
 - How can we form an all date integers that satisfy a certain criteria (i.e. an array of all
   calendar days that are Tuesdays in December 2020)?
 - Do the symbols for days and types of days provide any sort of key benefit here?
 
 RULES:
  SIGNATURES:
  initialize(month, year)
  day(day of week, type of day/schedule)

  - will need to require 'Date' class

 TO DO
 - look over Date class documentation to answer above questions

DATA STRUCTURE

ALGORITHM

=end
