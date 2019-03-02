#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

int main(void)
{
	stack *s = malloc(sizeof(stack));
	push(s, 'a');
	print_stack(s);
	free_stack(s);
}