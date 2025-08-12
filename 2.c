#include<string.h>
#include<stdio.h>

struct Student{
    char name[50];
    int age;
    float grade;
}student[3];

int main(){

    strcpy(student[0].name, "Hridoy Hasan");
    student[0].age = 21;
    student[0].grade = 3.37;

    strcpy(student[1].name, "Rahim Uddin");
    student[1].age = 22;
    student[1].grade = 3.50;

    strcpy(student[2].name, "Jodu");
    student[2].age = 20;
    student[2].grade = 3.90;

    for (int i = 0; i < 3; i++) {
        printf("Student %d:\n", i + 1);
        printf("  Name: %s\n", student[i].name);
        printf("  Age: %d\n", student[i].age);
        printf("  Grade: %.2f\n\n", student[i].grade);
    }


    return 0;
}