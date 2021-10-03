/*
 ============================================================================
 *  Author      : Vadim Mutilin
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 ============================================================================
*/
#include "header.h"

//store in the array example

struct A17 {
	int data;
};

int alloc_unsafe_17(struct A17 **array, int len) {
	struct A17 *p;
	int i=0;
	int j;
	for(; i<len; i++) {
		p = (struct A17 *)ldv_malloc(sizeof(struct A17));
		if(!p) goto err;
		array[i]=p;
	};
	
err:
	for(j=i-1; j>=0; j--) {
		free(array[j]);
		//unsafe: double free
	}
	return -ENOMEM;	
}

void free_17(struct A17 **array, int len) {
	int i;
	for(i=0; i<len; i++) {
		free(array[i]);
	}
}

void entry_point(void) {
	int i;
	int len = 10;
	struct A17 **array = (struct A17 **)ldv_malloc(sizeof(struct A17*)*len); 
	if(!array) return;
	for(i=0; i<len; i++) {
		array[i]=0;
	}
	alloc_unsafe_17(array, len);//unsafe: buggy alloc
	free_17(array, len);
	free(array);
}

void main(void) {
     entry_point();
}
