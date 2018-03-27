
// Take r0 as the offset for the image color location
.global return_bottomleftedge

return_bottomleftedge:
	push	{r4, r5,lr}
	ldr	r4, =bottomleftedge
	mov	r5, r0				// save the offset
	ldr	r0, [r4,r5]
	
	pop		{r4,r5,pc}

.section .data

.align 4

	.global bottomleftedge

bottomleftedge:

.ascii "\270\266\266\377\307\305\305\377\336\335\335\377\367\366\366\377\377\377\377\377\377\377\377\377\363\362\362\377\336\334\333\377\301\277\277\377\271\267\267\377"
.ascii "\274\272\272\377\275\274\274\377\275\274\274\377\273\273\273\377\273\274\274\377\274\275\275\377\275\275\275\377\275\274\274\377\275\273\273\377\276\273\273\377"
.ascii "\277\273\273\377\300\274\275\377\277\275\275\377\302\301\300\377\313\313\313\377\275\277\277\377\224\227\227\3778<<\377\006\010\007\377\005\001\001\377"
.ascii "\020\000\000\377\032\000\003\377\267\265\266\377\306\305\305\377\336\335\336\377\367\366\366\377\377\377\377\377\377\377\377\377\363\362\362\377\336\333\334\377"
.ascii "\302\277\277\377\272\267\267\377\274\272\272\377\275\274\274\377\274\274\274\377\273\273\273\377\273\274\274\377\274\275\275\377\275\275\275\377\276\274\274\377"
.ascii "\276\273\273\377\277\273\273\377\301\273\274\377\302\274\275\377\301\273\274\377\304\277\300\377\316\313\314\377\300\300\300\377\225\230\230\3777=<\377"
.ascii "\003\007\006\377\002\001\001\377\016\000\000\377\031\000\003\377\266\265\267\377\305\304\306\377\335\335\336\377\366\366\367\377\377\377\377\377\377\377\377\377"
.ascii "\363\362\362\377\336\333\334\377\303\276\277\377\273\266\267\377\275\272\272\377\275\274\274\377\274\274\274\377\273\273\273\377\273\274\274\377\274\275\275\377"
.ascii "\276\274\275\377\276\273\274\377\277\272\273\377\301\273\274\377\303\273\274\377\304\273\274\377\304\271\273\377\307\275\277\377\321\312\314\377\302\300\301\377"
.ascii "\225\231\231\3775<;\377\000\007\006\377\000\001\000\377\015\000\001\377\031\000\003\377\266\265\267\377\304\304\306\377\334\335\336\377\366\366\367\377"
.ascii "\377\377\377\377\377\377\377\377\363\362\362\377\336\334\334\377\302\277\277\377\272\267\267\377\274\272\272\377\275\274\274\377\275\274\274\377\273\273\273\377"
.ascii "\273\274\274\377\274\275\275\377\276\274\275\377\277\273\274\377\300\272\273\377\302\272\274\377\304\272\274\377\305\272\274\377\305\271\273\377\307\273\276\377"
.ascii "\317\310\311\377\300\275\275\377\224\225\225\3773:9\377\000\006\005\377\003\001\000\377\022\000\001\377\037\000\005\377\266\265\270\377\304\304\306\377"
.ascii "\333\335\337\377\365\366\367\377\377\377\377\377\377\377\377\377\362\362\362\377\335\335\334\377\301\300\277\377\270\267\267\377\273\272\272\377\274\274\274\377"
.ascii "\274\274\274\377\272\273\273\377\273\274\274\377\274\275\275\377\276\274\275\377\277\273\274\377\300\272\273\377\303\272\274\377\304\272\274\377\305\272\274\377"
.ascii "\302\271\273\377\303\274\276\377\314\310\311\377\276\274\274\377\224\224\224\377398\377\000\005\004\377\005\001\000\377\025\000\002\377#\000\006\377"
.ascii "\266\265\271\377\304\304\310\377\333\335\337\377\365\366\367\377\377\377\377\377\377\377\377\377\362\362\362\377\334\334\334\377\277\300\277\377\267\267\267\377"
.ascii "\272\272\272\377\273\274\274\377\272\274\274\377\271\273\273\377\273\274\274\377\274\275\275\377\276\274\275\377\277\273\274\377\300\272\273\377\303\272\274\377"
.ascii "\304\272\274\377\303\272\274\377\275\272\273\377\274\277\277\377\311\313\313\377\275\277\277\377\224\226\226\377487\377\001\004\003\377\004\000\000\377"
.ascii "\023\000\002\377!\002\006\377\270\265\267\377\306\305\306\377\334\335\336\377\366\366\367\377\377\377\377\377\377\377\377\377\363\362\362\377\336\334\335\377"
.ascii "\302\277\300\377\272\266\267\377\275\271\272\377\275\273\274\377\274\273\274\377\272\273\273\377\273\274\274\377\274\275\275\377\274\275\275\377\275\274\274\377"
.ascii "\275\273\273\377\300\272\274\377\302\273\274\377\301\273\273\377\274\272\272\377\274\276\276\377\312\313\313\377\277\300\300\377\226\227\227\377677\377"
.ascii "\001\002\001\377\001\000\000\377\016\004\005\377\032\010\013\377\272\266\264\377\307\305\304\377\335\335\335\377\366\366\366\377\377\377\377\377\377\377\377\377"
.ascii "\363\362\362\377\337\333\334\377\304\277\277\377\274\266\267\377\277\271\272\377\276\273\274\377\275\273\274\377\273\273\273\377\273\274\274\377\273\275\275\377"
.ascii "\273\275\275\377\272\274\274\377\273\273\273\377\275\273\274\377\277\273\274\377\276\273\273\377\272\271\271\377\274\274\274\377\314\314\314\377\301\301\301\377"
.ascii "\230\227\227\377645\377\000\000\000\377\000\000\000\377\006\003\003\377\017\011\011\377\270\267\263\377\306\306\303\377\334\336\335\377\365\367\366\377"
.ascii "\377\377\377\377\377\377\377\377\362\362\362\377\335\333\334\377\302\277\277\377\272\267\267\377\275\272\272\377\275\273\274\377\274\274\274\377\272\273\273\377"
.ascii "\271\274\274\377\271\275\275\377\271\275\275\377\271\274\274\377\271\273\273\377\273\274\274\377\274\274\274\377\274\273\273\377\270\267\267\377\273\272\272\377"
.ascii "\315\314\314\377\304\302\302\377\232\227\227\3773//\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\270\267\263\377\305\306\302\377"
.ascii "\334\336\334\377\365\367\366\377\377\377\377\377\377\377\377\377\362\362\362\377\334\334\333\377\300\277\277\377\271\267\267\377\274\272\272\377\274\274\274\377"
.ascii "\272\274\274\377\270\273\273\377\270\275\274\377\270\276\275\377\270\276\275\377\270\275\274\377\270\273\273\377\271\274\273\377\271\274\274\377\272\274\273\377"
.ascii "\270\272\271\377\273\273\273\377\305\305\305\377\301\277\277\377\253\250\250\377top\377TPQ\377QPQ\377RRR\377TTT\377"
.ascii "\270\267\263\377\305\306\302\377\333\336\333\377\364\367\366\377\377\377\377\377\377\377\377\377\361\362\362\377\332\334\334\377\277\277\277\377\270\267\267\377"
.ascii "\273\272\272\377\272\273\274\377\271\274\274\377\267\274\273\377\267\275\274\377\270\276\275\377\267\276\275\377\266\275\274\377\266\274\273\377\266\275\273\377"
.ascii "\267\275\273\377\271\275\274\377\272\275\275\377\273\275\275\377\273\274\274\377\274\273\273\377\277\274\274\377\304\277\300\377\306\302\303\377\305\303\304\377"
.ascii "\304\304\305\377\303\305\305\377\273\266\263\377\307\305\302\377\334\336\333\377\364\366\366\377\377\377\377\377\377\377\377\377\361\362\362\377\332\334\334\377"
.ascii "\276\277\277\377\266\267\267\377\271\272\272\377\271\273\274\377\270\274\274\377\267\274\273\377\267\275\274\377\270\276\275\377\267\276\275\377\266\275\274\377"
.ascii "\266\274\273\377\266\275\273\377\267\275\273\377\270\275\274\377\272\275\275\377\273\275\275\377\271\272\272\377\271\272\272\377\274\273\273\377\304\302\302\377"
.ascii "\310\305\305\377\305\303\303\377\301\301\301\377\276\300\300\377\275\266\263\377\311\305\302\377\336\335\333\377\365\366\366\377\377\377\377\377\377\377\377\377"
.ascii "\361\362\362\377\332\334\334\377\276\277\277\377\265\267\267\377\270\272\272\377\271\273\274\377\271\274\274\377\270\274\273\377\270\275\274\377\270\276\275\377"
.ascii "\267\276\275\377\267\275\274\377\266\274\273\377\266\275\273\377\267\275\273\377\270\275\274\377\272\275\275\377\273\274\274\377\272\273\273\377\272\272\272\377"
.ascii "\273\273\273\377\276\275\275\377\277\276\276\377\275\274\274\377\273\273\273\377\271\272\272\377\276\266\263\377\313\305\302\377\340\335\333\377\367\366\366\377"
.ascii "\377\377\377\377\377\377\377\377\361\362\362\377\333\334\334\377\277\277\277\377\267\267\267\377\271\272\272\377\272\274\274\377\272\274\274\377\271\273\273\377"
.ascii "\271\274\274\377\271\275\275\377\270\276\275\377\267\275\274\377\267\274\273\377\267\275\274\377\267\275\274\377\271\275\274\377\273\274\274\377\274\274\274\377"
.ascii "\276\275\275\377\276\275\275\377\275\275\275\377\273\273\273\377\273\273\273\377\275\275\275\377\277\277\277\377\301\301\301\377\276\265\264\377\313\304\304\377"
.ascii "\341\335\334\377\367\366\366\377\377\377\377\377\377\377\377\377\361\362\362\377\333\334\334\377\277\277\277\377\267\267\267\377\272\272\272\377\273\274\274\377"
.ascii "\273\274\274\377\272\273\273\377\272\274\274\377\272\275\275\377\271\276\275\377\271\275\274\377\270\273\273\377\270\274\273\377\271\275\274\377\273\274\274\377"
.ascii "\276\274\274\377\300\274\275\377\277\275\275\377\276\275\275\377\274\274\274\377\271\271\271\377\271\271\271\377\273\273\273\377\276\276\276\377\277\277\277\377"
.ascii "\274\265\266\377\312\304\305\377\341\334\336\377\367\366\366\377\377\377\377\377\377\377\377\377\362\362\362\377\334\334\334\377\277\277\277\377\267\267\267\377"
.ascii "\272\272\272\377\274\274\274\377\274\274\274\377\273\273\273\377\273\274\274\377\273\275\275\377\273\275\275\377\272\274\274\377\271\273\273\377\271\273\273\377"
.ascii "\272\274\273\377\274\274\274\377\277\274\275\377\301\274\275\377\277\274\275\377\275\273\274\377\273\273\273\377\272\272\272\377\272\272\272\377\273\273\273\377"
.ascii "\274\274\274\377\275\275\275\377\267\265\270\377\306\304\307\377\336\335\337\377\367\366\367\377\377\377\377\377\377\377\377\377\362\362\362\377\334\333\333\377"
.ascii "\277\277\277\377\267\267\267\377\272\272\272\377\274\274\274\377\274\274\274\377\273\273\273\377\274\274\274\377\275\275\275\377\275\275\275\377\274\274\274\377"
.ascii "\273\273\273\377\273\273\273\377\273\273\273\377\274\274\274\377\275\275\275\377\276\275\275\377\275\273\274\377\274\273\273\377\275\273\273\377\276\275\275\377"
.ascii "\277\276\276\377\277\276\276\377\277\275\275\377\277\275\275\377\262\264\271\377\302\305\311\377\336\337\342\377\371\372\372\377\377\377\377\377\377\377\377\377"
.ascii "\364\364\364\377\333\334\334\377\273\274\274\377\262\263\263\377\265\266\266\377\270\271\271\377\271\272\272\377\273\273\273\377\274\274\274\377\275\275\275\377"
.ascii "\275\275\275\377\274\274\274\377\273\273\273\377\273\273\273\377\274\273\274\377\274\274\274\377\273\275\274\377\272\275\274\377\273\274\273\377\274\273\273\377"
.ascii "\276\273\274\377\301\275\275\377\302\275\276\377\302\274\275\377\300\274\274\377\300\274\274\377\257\265\272\377\277\304\310\377\331\334\337\377\364\364\365\377"
.ascii "\377\377\377\377\375\375\375\377\360\361\361\377\333\335\335\377\300\302\302\377\270\272\272\377\273\275\275\377\273\276\276\377\273\275\275\377\273\273\273\377"
.ascii "\274\274\274\377\275\275\275\377\275\275\275\377\274\274\274\377\273\273\273\377\274\273\274\377\274\273\274\377\273\274\274\377\271\275\274\377\270\275\274\377"
.ascii "\272\275\274\377\275\275\274\377\277\274\274\377\302\273\274\377\303\273\274\377\302\272\273\377\301\272\273\377\300\272\273\377\267\272\274\377\274\276\300\377"
.ascii "\303\305\307\377\313\313\314\377\314\314\314\377\311\311\311\377\321\321\321\377\335\335\335\377\351\352\352\377\356\356\356\377\353\354\354\377\342\343\343\377"
.ascii "\322\322\322\377\275\275\275\377\272\272\272\377\274\274\274\377\274\274\274\377\274\274\274\377\273\273\273\377\273\273\273\377\273\273\273\377\273\273\273\377"
.ascii "\273\274\274\377\273\274\274\377\273\274\274\377\274\274\274\377\275\274\274\377\276\274\274\377\276\274\274\377\276\273\274\377\275\273\274\377\275\273\274\377"
.ascii "\272\274\274\377\272\273\274\377\271\272\272\377\270\271\271\377\265\265\265\377\261\261\261\377\304\303\303\377\340\337\337\377\377\377\377\377\377\377\377\377"
.ascii "\377\377\377\377\366\366\366\377\334\334\334\377\274\274\274\377\266\266\266\377\267\267\267\377\271\271\271\377\272\272\272\377\273\273\273\377\272\272\272\377"
.ascii "\271\271\271\377\271\271\271\377\272\271\271\377\272\272\272\377\272\272\272\377\272\272\272\377\272\272\272\377\271\272\272\377\271\272\272\377\271\272\272\377"
.ascii "\271\272\272\377\271\272\272\377\270\272\272\377\271\273\273\377\274\275\275\377\277\300\300\377\276\276\276\377\272\272\272\377\311\311\311\377\340\340\340\377"
.ascii "\374\374\374\377\377\377\377\377\377\377\377\377\361\361\361\377\331\331\331\377\275\275\275\377\265\265\265\377\264\264\264\377\267\267\267\377\274\274\274\377"
.ascii "\277\277\277\377\275\275\275\377\273\273\273\377\272\272\272\377\272\272\272\377\272\272\272\377\272\272\272\377\272\272\272\377\272\272\272\377\272\272\272\377"
.ascii "\272\272\272\377\272\272\272\377\272\272\272\377\272\272\272\377\273\273\274\377\273\273\274\377\274\274\274\377\275\275\275\377\274\274\274\377\272\272\272\377"
.ascii "\301\301\301\377\313\313\313\377\327\327\327\377\331\331\331\377\327\327\327\377\332\332\332\377\336\336\336\377\342\342\342\377\341\341\341\377\340\340\340\377"
.ascii "\341\341\341\377\342\342\342\377\343\343\343\377\343\343\343\377\342\342\342\377\342\342\342\377\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377"
.ascii "\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377\300\277\301\377\277\276\300\377\275\274\275\377\273\272\273\377"
.ascii "\272\272\272\377\272\272\272\377\272\272\272\377\271\271\271\377\271\271\271\377\265\265\265\377\266\266\266\377\307\307\307\377\342\342\342\377\377\377\377\377"
.ascii "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"
.ascii "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\310\307\311\377\306\305\307\377"
.ascii "\302\301\302\377\275\275\275\377\274\274\274\377\275\275\275\377\274\274\274\377\273\273\273\377\272\272\272\377\266\266\266\377\267\267\267\377\311\311\311\377"
.ascii "\344\344\344\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"
.ascii "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"
.ascii "jjk\377zz{\377\226\226\227\377\266\267\267\377\305\304\304\377\277\277\277\377\275\275\275\377\273\273\273\377\272\272\272\377\270\270\270\377"
.ascii "\271\271\271\377\302\302\302\377\321\321\321\377\341\341\341\377\343\343\343\377\342\342\342\377\342\342\342\377\343\343\343\377\343\343\343\377\342\342\342\377"
.ascii "\341\341\341\377\341\341\341\377\342\342\342\377\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377\343\343\343\377"
.ascii "\343\343\343\377\343\343\343\377\000\000\000\377\034\034\035\377^_`\377\255\255\255\377\316\316\316\377\301\301\301\377\275\275\275\377\273\273\273\377"
.ascii "\273\273\273\377\273\273\273\377\273\273\273\377\273\273\273\377\272\272\272\377\271\271\271\377\270\270\270\377\271\271\271\377\271\271\271\377\272\272\272\377"
.ascii "\273\273\273\377\273\273\273\377\272\272\272\377\273\273\273\377\273\273\273\377\274\274\274\377\274\274\274\377\274\274\274\377\274\274\274\377\274\274\274\377"
.ascii "\274\274\274\377\274\274\274\377\274\274\274\377\274\274\274\377\000\000\000\377\034\035\035\377bdd\377\265\266\266\377\332\332\332\377\317\317\317\377"
.ascii "\314\314\314\377\312\312\312\377\311\311\311\377\311\311\311\377\312\312\312\377\311\311\311\377\310\310\310\377\307\307\307\377\310\310\310\377\310\310\310\377"
.ascii "\307\307\307\377\305\305\305\377\303\303\303\377\305\305\305\377\306\306\306\377\307\307\307\377\310\310\310\377\310\310\310\377\310\310\310\377\310\310\310\377"
.ascii "\310\310\310\377\310\310\310\377\310\310\310\377\310\310\310\377\310\310\310\377\310\310\310\377\000\000\000\377\027\032\031\377EHG\377|}}\377"
.ascii "\225\224\225\377\215\215\215\377\213\213\213\377\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\213\213\213\377"
.ascii "\214\214\214\377\214\214\214\377\213\213\213\377\211\211\211\377\207\207\207\377\210\210\210\377\211\211\211\377\212\212\212\377\212\212\212\377\212\212\212\377"
.ascii "\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\212\212\212\377\002\011\004\377\004\012\006\377"
.ascii "\010\013\011\377\015\015\015\377\015\014\015\377\010\010\010\377\010\010\010\377\011\011\011\377\014\014\014\377\014\014\014\377\012\012\012\377\011\011\011\377"
.ascii "\013\013\013\377\015\015\015\377\014\014\014\377\013\013\013\377\013\013\013\377\015\015\015\377\016\016\016\377\015\015\015\377\013\013\013\377\013\013\013\377"
.ascii "\013\013\013\377\014\014\014\377\014\014\014\377\014\014\014\377\014\014\014\377\014\014\014\377\014\014\014\377\014\014\014\377\014\014\014\377\014\014\014\377"
.ascii "\001\012\003\377\000\007\001\377\000\003\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377"
.ascii "\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377"
.ascii "\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377\000\000\000\377"
.ascii "\000\000\000\377\000\000\000\377\000\011\001\377\001\010\001\377\002\007\002\377\003\005\003\377\004\004\004\377\004\004\004\377\005\005\005\377\006\006\006\377"
.ascii "\007\007\007\377\005\005\005\377\003\003\003\377\003\003\003\377\005\005\005\377\007\007\007\377\005\005\005\377\003\003\003\377\003\003\003\377\004\004\004\377"
.ascii "\006\006\006\377\007\007\007\377\007\007\007\377\007\007\007\377\006\006\006\377\005\005\005\377\005\005\005\377\005\005\005\377\005\005\005\377\005\005\005\377"
.ascii "\005\005\005\377\005\005\005\377\005\005\005\377\005\005\005\377"