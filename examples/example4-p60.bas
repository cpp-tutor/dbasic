10 DIM A(20,20),B(20,20),C(20,20)
20 READ M,N
30 MAT READ A(M,N), B(N,N)
40 MAT C = A + A
50 MAT PRINT C;
60 MAT C = A*B
70 PRINT
75 PRINT "A*B =",
80 MAT PRINT C
90 DATA 2,3
91 DATA 1,2,3
92 DATA 4,5,6
93 DATA 1,0,-1
94 DATA 0,-1,-1
95 DATA -1,0,0
99 END
