/*
 ============================================================================
 Name        : ArraysOfVariableLength3_true-valid.c
 Author      : Anton Vasilyev
 Version     : Created on: Jul 31, 2015
 Copyright   :
 Description : Variable-length automatic arrays are allowed in ISO C99 6.5.3.4
 ============================================================================
 */


int foo(int size, char b[]) {
    char a[32];
    int i;
    for (i=0; i<size; i++) {
    	a[i]=b[i];
    }
	return i;
}

int main() {
	int i, b[100];
	unsigned char buffer[32];
	char mask[32];
	for (i = 0; i < sizeof(mask); i++) {
		b[i] = foo(32, mask);
	}
	for (i = 0; i < sizeof(mask); i++) {
		if (b[i] != 32) {
			ERROR:	return 1;
		}
	}
	return 0;
}
