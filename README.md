# CGPA Calculator

A command-line CGPA (Cumulative Grade Point Average) calculator built using Flex and Bison. This tool helps students calculate their CGPA by entering their course grades.

## Features

- Support for both theory (3.0 credits) and lab courses (1.5 credits)
- Interactive text-based user interface
- Real-time CGPA calculation
- Display of entered courses and current CGPA
- Support for standard grading scale (A+ to F)

## Prerequisites

To compile and run this program, you need:
- GCC (GNU Compiler Collection)
- Flex (Fast Lexical Analyzer)
- Bison (Parser Generator)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/hridoynasah/cgpa-calculator.git
cd cgpa-calculator
```

2. Navigate to the utils directory:
```bash
cd utils
```

3. Compile the program:
```bash
flex lexer.l
bison -d parser.y
gcc lex.yy.c parser.tab.c -o cgpa.exe
```

## Usage

1. Run the program:
```bash
./cgpa.exe  # On Unix-like systems
cgpa.exe    # On Windows
```

2. Enter grades in the following format:
   - For theory courses: `grade t` (e.g., `A+ t`)
   - For lab courses: `grade l` (e.g., `B l`)

3. Available grades:
   - A+ (4.00)
   - A  (3.75)
   - A- (3.50)
   - B+ (3.25)
   - B  (3.00)
   - B- (2.75)
   - C+ (2.50)
   - C  (2.25)
   - D  (2.00)
   - F  (0.00)

4. Type `q` when you're done to see your final CGPA.

## Example

```
=== CGPA Calculator ===

Enter grades in the following format:
- For theory courses: grade followed by 't' (e.g., 'A+ t')
- For lab courses: grade followed by 'l' (e.g., 'B l')
- Type 'q' to finish and see results

Available grades: A+, A, A-, B+, B, B-, C+, C, D, F

Current courses:
No. | Grade | Type | Credits | Points
----+-------+------+---------+-------
  1 | A+    |   T  |    3.0 | 12.00
  2 | B     |   L  |    1.5 |  4.50

Current CGPA: 3.67
```

## Credit Hour System

- Theory courses: 3.0 credits
- Lab courses: 1.5 credits

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

[Hridoy Hasan](https://github.com/hridoynasah)