# COBOL Payroll System

## Overview

The COBOL Payroll System is a simple payroll processing application that is written in COBOL. It allows users to input employee details, such as Employee ID, Name, Hours Worked, and Hourly Rate. The system then computes each employee's gross pay and generates a payroll report in text file format.

The system has file handling capabilities to read from and write to sequential files. The generated payroll report includes the employee ID, name, and gross pay.

## Features

- **Employee Input**: The system prompts the user to input details for multiple employees, such as:
  - Employee ID
  - Employee Name
  - Hours Worked
  - Hourly Rate
- **Payroll Calculation**: The system calculates the gross pay for each employee using the formula:
  
  `Gross Pay = Hours Worked * Hourly Rate`
  
- **Payroll Report Generation**: After processing the employee details, the system generates a payroll report in a text file format that includes:
  - Employee ID
  - Employee Name
  - Gross Pay
  
- **File Handling**: The system handles both input and output via files:
  - **Input File**: Employee data can be read from a file (currently not implemented in the given code but prepared for future file input integration).
  - **Output File**: A payroll report is written in a human-readable format to a file.

## COBOL Features and Techniques Used

- **File Handling**: 
  - The system defines input and output files using the `SELECT`, `FD`, and `01` level data structures.
  - The `WRITE` statement is used to write processed employee data to the output file.

- **Data Structures**:
  - Data items for employees are defined with `PIC` clauses, which specify the data types and sizes. For example, `EMP-ID` is defined as `PIC 9(5)` to store a 5-digit employee ID, and `USER-HOURLY-RATE` is defined as `PIC 9(4)V99` to store a decimal value for the hourly rate.

- **Computations**:
  - The `COMPUTE` statement is used to calculate the gross pay for each employee.
  - The system uses basic arithmetic operations such as multiplication to compute the gross pay: `Gross Pay = Hours Worked * Hourly Rate`.

- **Control Structures**:
  - A `PERFORM` loop is used to iterate over each employee and process their data.
  - The `VARYING` option in the `PERFORM` statement allows each employee to be processed sequentially based on the employee count.

- **Error Handling**:
  The system uses the `EOF-FLAG` to detect if the end of the employee file has been reached (in case of future file input).

## How to Run

1. **Install a COBOL Compiler**:
   - You need a COBOL compiler such as GnuCOBOL (`cobc`) to run this system.

2. **Compile the Program**:
   - Compile the COBOL program using the following command:
     ```bash
     cobc -x COBOL_PAYROLL_PROCESSING_SYSTEM.cbl
     ```

3. **Run the Program**:
   - Execute the compiled program:
     ```bash
     ./COBOL_PAYROLL_PROCESSING_SYSTEM
     ```

4. **Enter Employee Data**:
   - The program will prompt you to enter the number of employees, and for each employee, it will ask for:
     - Employee ID
     - Employee Name
     - Hours Worked
     - Hourly Rate

5. **View Payroll Report**:
   - After the program processes the employee data, it generates the payroll report and displays it on the console.

## Future Enhancements

- Implement the ability to read employee data from an input file (e.g., CSV or another data format).
- Add error handling for invalid user inputs.
- Improve formatting of the payroll report (e.g., including decimal precision for gross pay).

