#include <tchar.h>
#include <stdio.h>
#include <test_lib/printhello.h>

int _tmain(int argc, _TCHAR* argv[])
{
	int ret = printhello("myname");
	printf("ret = %d\n", ret);
	printf("my name is ");
	ret = printname("myname");
	printf("\nret = %d\n", ret);
	return 0;
}

