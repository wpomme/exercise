#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "list.h"

void list_new_empty_node_test1(void) {
  ListNode *actual = list_new_empty_node();

  void *expected_next = NULL;
  int expected_data = 0;

  printf("actual_data: %i, expected_data: %i\n", actual->data, expected_data);
  printf("actual_next: %p, expected_next: %p\n", (void *)actual->next, expected_next);

  assert(actual->data == expected_data);
  assert(actual->next == expected_next);

  printf("list_size2_test1 passed\n");
}

// new_empty_nodeで作成しただけのリンクリストはfreeでメモリを解放した後、NULLを参照させるようにして削除する
void list_new_empty_node_test2(void) {
  ListNode *actual = list_new_empty_node();

  free(actual);
  actual = NULL;

  void *expected = NULL;

  printf("actual: %p, expected_data: %p\n", (void *)actual, (void *)expected);

  assert(actual == expected);

  printf("list_new_empty_node_test2 passed\n");
}

int main(void) {
  list_new_empty_node_test1();
  list_new_empty_node_test2();
  return 0;
}
