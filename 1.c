#include<stdio.h>
#include<string.h>
typedef struct Student{
    char name[50];
    int age;
    float grade;
} Student;

int main(){
    Student student1;

    strcpy(student1.name, "Hridoy Hasan");
    student1.age = 21;
    student1.grade = 3.37;

    printf("Name: %s\n",student1.name);
    printf("Age: %d\n", student1.age);
    printf("Grade: %.2f\n", student1.grade);

}