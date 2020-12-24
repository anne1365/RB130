=begin
PROBLEM: write an archiving program to store students' names and grades. Functionality needed:
- ability to add a student to a grade
- ability to see what students are in a grade
- ability to produce sorted list of all students in all grades

QUESTIONS
- for add method, what should be done if name entered is empty or if the grade isn't valid (i.e. it's a string)?
- what should be done if input to #grade method isn't valid?

METHODS NEEDED:
#to_h               -> produces sorted hash of School object
#add(name, grade#)  -> given name string and grade integer, adds student to School hash
#grade(grade#)      -> given grade integer, produces array of students in grade

DATA STRUCTURE = hash for school with integer keys & array of strings for students

ALGO:
#add method
- will want to normalize names using method that capitalizes first method
- could add validation for name and grade down the road
- if the student's grade is present in the school hash, will append student's name to that grade's array
  of students, otherwise I'll add a key for that grade and add the student to an array corresponding to that
  key
- I will leave sorting to the #to_h method

#grade
- in order to ensure that return value is sorted, I'll invoke the to_h method, and invoke the proper key from
  its return value (the sorted school hash)

#to_h
- sort hash keys by #(asc.)
- sort hash values alphabetically(asc.)
=end
