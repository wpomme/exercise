#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "list.h"

// データが一つだけの場合、sizeは1を返すこと
void list_size_test1(void) {
  ListNode *head = list_new_empty_node();
  head->data = 0;

  int actual = list_size(head);
  int expected = 1;

  printf("actual: %i, expected: %i\n", actual, expected);

  assert(actual == expected);

  printf("list_size_test1 passed\n");
}

int main(void) {
  list_size_test1();
  return 0;
}
