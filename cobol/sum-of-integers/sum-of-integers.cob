       IDENTIFICATION DIVISION.
       PROGRAM-ID. SumOfIntegers.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 n BINARY-LONG.
       01 i BINARY-LONG.
       01 sum BINARY-LONG VALUE 0.
       PROCEDURE DIVISION.
       DISPLAY "自然数を入力してください"
       ACCEPT n
       PERFORM VARYING i FROM 1 BY 1 UNTIL i > n
           ADD i TO sum
       END-PERFORM
       DISPLAY "入力した自然数: " sum.
