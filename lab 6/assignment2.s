// Assignment 2 Peter Luo
start:
ld.local.s64 x[10],r1; // load array x with 10 items from local address r1.
.reg s64 r2,0; //create register r2 with 0 value
.reg s64 r4,0; //create register r4 with 0 value
.reg s64 r6,0; //create register r6 with 0 value
.reg s64 r8,0; //create register r8 with 0 value
.reg s64 r10,0; //create register r10 with 0 value
.reg s64 r12,0; //create register r12 with 0 value
.reg s32 r13,0; // creates register 13 with value of 0
.reg s32 r14,0; // creates register 14 with value of 0
// r2 = neg, r4 = pos, r6 = neg_sum, r8 = pos_sum, r10 = neg_mean, r12 = pos_mean, r13 =i , r14 = byte offset
//r15 predicate for if statement
loop:
setp.lt.s32 p,r13,10; //p = 1 if i <10
@p //loop
setp.gt.s64 r15,x[r14], 0 // if x[i] >0, r15 = 1 
@r15 // if
add.s64 r2,r2,1 //neg = neg+1
add.s64 r6, r6, x[r14] //neg_sum = neg_sum + x[i]
add.s64 r13,r13,1 //increment i
add.s64 r14,r14,16 //add 16 bites to offset
bra loop; //go back to loop
@r15 //else
add.s64 r4,r4,1; //pos = pos+1
add.s64,r8,r8,x[r14]; //pos_sum = pos_sum + x[i]
add.s64 r13,r13,1 //increment i
add.s64 r14,r14,16 //add 16 bites to offset
bra loop;
@!p //outside of for-loop
div.s64 r10,r6,r2;//neg_mean = neg_sum/neg
div.s64 r12,r8,r4;//pos_mean = pos_sum/pos
exit // end




