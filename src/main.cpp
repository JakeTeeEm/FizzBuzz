#include <cstdio>
#include <cstdint>



int
main(void)
{
	for (uint8_t i = 1; i <= 100; i++)
	{	
		if (0 == i % 3 && 0 == i % 5)
		{
			printf("FizzBuzz");
		}
		else if (0 == i % 3)
		{
			printf("Fizz");
		}
		else if (0 == i % 5)
		{
			printf("Buzz");
		}
		else
		{
			printf("%u", i);
		}

		printf("\t\t");
	}

	
	printf("\n");

	return 0;
}
