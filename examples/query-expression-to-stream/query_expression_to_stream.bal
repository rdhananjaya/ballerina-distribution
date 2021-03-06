import ballerina/io;

type Student record {
    string firstName;
    string lastName;
    int intakeYear;
    float score;
};

type Report record {
    string name;
    string degree;
    int expectedGradYear;
};

public function main() {

    Student s1 = {firstName: "Alex", lastName: "George", intakeYear: 2020, score: 1.5};
    Student s2 = {firstName: "Ranjan", lastName: "Fonseka", intakeYear: 2020, score: 0.9};
    Student s3 = {firstName: "John", lastName: "David", intakeYear: 2022, score: 1.2};
    Student s4 = {firstName: "Gorge", lastName: "Fernando", intakeYear: 2021, score: 1.1};

    Student[] studentList = [s1, s2, s3, s4];

    //The `from` clause works similarly to a `foreach` statement.
    //It can be used to iterate any iterable value.
    //The `reportStream` is the result of the `query` expression.
    stream<Report> reportStream = stream from var student in studentList
       //The `where` clause provides a way to perform conditional execution and works similarly to an `if` condition.
       //It can refer to variables bound by the from clause.
       //When the `where` condition evaluates to false, the iteration skips the following clauses.
       where student.score >= 1
       //The `let` clause binds the variables.
       let string degreeName = "Bachelor of Medicine",
       int graduationYear = calGraduationYear(student.intakeYear)
       //The `select` clause is evaluated for each iteration.
       //The result of the query expression is a list(`reportList`) whose members are the result of the
       //`select` clause.
       select {
              name: student.firstName,
              degree: degreeName,
              expectedGradYear: graduationYear
       }
       //The `limit` clause limits the output items.
       limit 2;

    foreach var report in reportStream {
        io:println(report);
    }
}

function calGraduationYear(int year) returns int {
    return year + 5;
}
