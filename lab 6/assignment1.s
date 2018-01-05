//Assignment 1 Peter Luo
start:
//load registers a to e from local memory into 32 signed bit registers with an offset of 8 bytes between each
ld.local.s32 r2,r1;
ld.local.s32 r3,[r1 +8];
ld.local.s32 r4,[r1 +16];
ld.local.s32 r5,[r1 +24];
ld.local.s32 r3,[r1 +32];
.global.s32 i = 0; // global integer i holds value zero.
// a =r2 , b=r3, c=r4, d=r5, e =r6
// r6 holds predicate for if condition inside for loop
loop:
setp.lt.s32 p,i,10 //p = 1 if i <10
@p //for loop iteration
setp.gt.s32 r6, r2,r3 // if a>b then predicate r6 is 1.
@!r5 // a<=b
add.s32 r2,r2,r4; // a = a+c
sd.local.s32 r2,r6[i]; //e[i] = a
@r5// a>b
sub.s32 r2,r2,r5 //
add.s32 i,i,1; // increment i by 1 
st.local.s32 r2,r6[i]; //e[i] = a
bra loop; // branch to loop
@!p //end of for-loop
exit //exits