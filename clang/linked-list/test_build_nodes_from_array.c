#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "list.h"

void list_build_nodes_from_array_test1(void) {
  int actual_size = 10;
  int data[] = {2, 3, 6, 1, 7, 2, 8, 9, 10, 12};

  ListNode *head = list_new_empty_node();

  head = list_build_nodes_from_array(data, actual_size);

  int expected_size = 0;

  for (ListNode *pos = head; pos != NULL; pos = pos->next) {
    expected_size++;
    printf("actual->data: %i, actual->next: %p\n", pos->data, (void *)pos->next);
  }

  assert(actual_size == expected_size);

  printf("list_build_nodes_from_array_test1 passed\n");
}

int main(void) {
  list_build_nodes_from_array_test1();
  return 0;
}
