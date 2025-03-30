       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYROLL-SYSTEM.
       AUTHOR. Jade Doumani.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-FILE ASSIGN TO "EMPLOYEE.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PAYROLL-REPORT ASSIGN TO "PAYROLL.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD EMPLOYEE-FILE.
           01 EMPLOYEE-RECORD.
               05 EMP-ID            PIC 9(5).
               05 EMP-NAME          PIC A(30).
               05 HOURS-WORKED      PIC 9(2).
               05 HOURLY-RATE       PIC 9(4)V99.

           FD PAYROLL-REPORT.
           01 PAYROLL-OUT.
               05 OUT-EMP-ID        PIC 9(5).
               05 OUT-EMP-NAME      PIC A(30).
               05 OUT-GROSS-PAY     PIC 9(7)V99.

       WORKING-STORAGE SECTION.
           01 GROSS-PAY            PIC 9(7)V99.
           01 EOF-FLAG             PIC X(2) VALUE 'NO'.
           01 NUM-EMPLOYEES       PIC 9(3).  
           01 I                    PIC 9(2).
           01 USER-EMP-ID          PIC 9(5).
           01 USER-EMP-NAME        PIC A(30).
           01 USER-HOURS-WORKED    PIC 9(2).
           01 USER-HOURLY-RATE     PIC 9(4)V99.

       PROCEDURE DIVISION.
       MAIN-PROCESS.
           DISPLAY "Welcome to the Payroll System!".
           DISPLAY "Please follow the instructions to enter details.".

           DISPLAY "Enter the number of employees to process: ".
           ACCEPT NUM-EMPLOYEES.

           OPEN OUTPUT PAYROLL-REPORT.
           DISPLAY "Starting payroll processing..." 

           PERFORM PROCESS-EMPLOYEES 
               VARYING I FROM 1 
               BY 1 
               UNTIL I > NUM-EMPLOYEES.
               
           CLOSE PAYROLL-REPORT.

           DISPLAY "PAYROLL PROCESSING COMPLETED."

           STOP RUN.

       PROCESS-EMPLOYEES.
           DISPLAY "Enter details for Employee # " I.
           DISPLAY "Enter Employee ID: ".
           ACCEPT USER-EMP-ID.
           DISPLAY "Enter Employee Name: ".
           ACCEPT USER-EMP-NAME.
           DISPLAY "Enter Hours Worked: ".
           ACCEPT USER-HOURS-WORKED.
           DISPLAY "Enter Hourly Rate: ".
           ACCEPT USER-HOURLY-RATE.

           COMPUTE GROSS-PAY = USER-HOURS-WORKED * USER-HOURLY-RATE.

           MOVE USER-EMP-ID TO OUT-EMP-ID.
           MOVE USER-EMP-NAME TO OUT-EMP-NAME.
           MOVE GROSS-PAY TO OUT-GROSS-PAY.

           WRITE PAYROLL-OUT.

           DISPLAY "Employee " USER-EMP-NAME " Gross pay of " GROSS-PAY.
           DISPLAY "----------------------------------------".
           MOVE 'NO' TO EOF-FLAG.
