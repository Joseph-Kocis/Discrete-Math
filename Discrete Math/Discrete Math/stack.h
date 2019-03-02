#define ERROR_CHAR '?'

typedef struct node
{
	char element;
	struct node *next;
} node;

typedef struct stack
{
	node *top;
} stack;

void push(stack *st, char element)
{
	node *newNode = malloc(sizeof(node));

	if (st == NULL)
	{
		return;
	}

	newNode->next = st->top;
	newNode->element = element;

	st->top = newNode;
}

// Returns \0 if the stack is empty
char pop(stack *st)
{
	char element;
	node *newTop;

	if (st == NULL)
	{
		return ERROR_CHAR;
	}

	if (st->top == NULL)
	{
		return ERROR_CHAR;
	}

	newTop = st->top->next;
	element = st->top->element;
	free(st->top);
	st->top = newTop;

	return element;
}

// Returns 1 if the stack is empty, returns 0 otherwise.
int isEmpty(stack *st)
{
	if (st == NULL || st->top == NULL)
	{
		return 1;
	}

	return 0;
}

char top(stack *st)
{
	if (st == NULL || st->top == NULL)
	{
		return ERROR_CHAR;
	}

	return st->top->element;
}

void free_stack(stack *st)
{
	node *curTop = st->top, *lastNode;
	while (curTop != NULL)
	{
		lastNode = curTop;
		curTop = curTop->next;
		free(lastNode);
	}

	free(st);
}

void print_stack(stack* st)
{
	node *top = st->top;

	printf("-----\n");

	while (top != NULL)
	{
		printf("%3c\n", top->element);
		printf("-----\n");

		top = top->next;
	}
}