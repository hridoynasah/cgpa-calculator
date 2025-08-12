%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

double total_points = 0.0;
double total_credits = 0.0;
int course_count = 0;
#define MAX_COURSES 50

struct Course {
    char grade[4];
    char type;
    double credits;
    double points;
} courses[MAX_COURSES];

double grade_to_point(int grade);
void print_menu(void);
void print_courses(void);
%}

/* Declare tokens */
%token APLUS A AMINUS BPLUS B BMINUS CPLUS C D F THEORY LAB QUIT

%%

input:
    /* empty */
    | input course
    ;

course:
    grade THEORY {
        if (course_count < MAX_COURSES) {
            courses[course_count].credits = 3.0;
            courses[course_count].points = grade_to_point($1) * 3.0;
            courses[course_count].type = 'T';
            total_points += courses[course_count].points;
            total_credits += 3.0;
            course_count++;
        }
    }
    | grade LAB {
        if (course_count < MAX_COURSES) {
            courses[course_count].credits = 1.5;
            courses[course_count].points = grade_to_point($1) * 1.5;
            courses[course_count].type = 'L';
            total_points += courses[course_count].points;
            total_credits += 1.5;
            course_count++;
        }
    }
    | QUIT { YYACCEPT; }
    ;

grade:
    APLUS   { $$ = APLUS; strcpy(courses[course_count].grade, "A+"); }
    | A     { $$ = A; strcpy(courses[course_count].grade, "A"); }
    | AMINUS{ $$ = AMINUS; strcpy(courses[course_count].grade, "A-"); }
    | BPLUS { $$ = BPLUS; strcpy(courses[course_count].grade, "B+"); }
    | B     { $$ = B; strcpy(courses[course_count].grade, "B"); }
    | BMINUS{ $$ = BMINUS; strcpy(courses[course_count].grade, "B-"); }
    | CPLUS { $$ = CPLUS; strcpy(courses[course_count].grade, "C+"); }
    | C     { $$ = C; strcpy(courses[course_count].grade, "C"); }
    | D     { $$ = D; strcpy(courses[course_count].grade, "D"); }
    | F     { $$ = F; strcpy(courses[course_count].grade, "F"); }
    ;

%%

double grade_to_point(int grade) {
    switch (grade) {
        case APLUS:  return 4.00;
        case A:      return 3.75;
        case AMINUS: return 3.50;
        case BPLUS:  return 3.25;
        case B:      return 3.00;
        case BMINUS: return 2.75;
        case CPLUS:  return 2.50;
        case C:      return 2.25;
        case D:      return 2.00;
        case F:      return 0.00;
        default:     return 0.00;
    }
}

void print_menu(void) {
    system("cls");  // Clear screen on Windows
    printf("\n=== CGPA Calculator ===\n\n");
    printf("Enter grades in the following format:\n");
    printf("- For theory courses: grade followed by 't' (e.g., 'A+ t')\n");
    printf("- For lab courses: grade followed by 'l' (e.g., 'B l')\n");
    printf("- Type 'q' to finish and see results\n\n");
    printf("Available grades: A+, A, A-, B+, B, B-, C+, C, D, F\n");
    printf("\nCurrent courses:\n");
    print_courses();
    printf("\nEnter grade and course type: ");
}

void print_courses(void) {
    if (course_count == 0) {
        printf("No courses entered yet.\n");
        return;
    }

    printf("\nNo. | Grade | Type | Credits | Points\n");
    printf("----+-------+------+---------+-------\n");
    for (int i = 0; i < course_count; i++) {
        printf("%3d | %5s | %4c | %7.1f | %6.2f\n", 
            i + 1, courses[i].grade, courses[i].type, 
            courses[i].credits, courses[i].points);
    }
    
    if (total_credits > 0) {
        printf("\nCurrent CGPA: %.2f\n", total_points / total_credits);
    }
    printf("\n");
}

int main() {
    print_menu();
    yyparse();
    
    system("cls");  // Clear screen
    printf("\n=== Final Results ===\n\n");
    print_courses();
    
    if (total_credits > 0) {
        printf("\nFinal CGPA: %.2f\n", total_points / total_credits);
        printf("Total Credits: %.1f\n", total_credits);
    }
    
    printf("\nPress Enter to exit...");
    getchar();
    return 0;
}

int yyerror(const char *msg) {
    fprintf(stderr, "\nError: Invalid input! Please try again.\n");
    printf("Press Enter to continue...");
    getchar();
    print_menu();
    return 0;
}
