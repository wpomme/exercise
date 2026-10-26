#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "list.h"

// 要素が二つだけのリンクリストを作成する
void list_insert_test1(void) {
  ListNode *head = list_new_empty_node();
  int size = 1;

  for (int i = 0; i < size; i++) {
    list_insert(head, i, i);
  }

  for (ListNode *pos = head; pos != NULL; pos = pos->next) {
    printf("actual->data: %i, actual->next: %p\n", pos->data, (void *)pos->next);
  }

  assert(head->next->next == NULL);

  printf("list_insert_test1 passed\n");
}

int main(void) {
  list_insert_test1();
  return 0;
}

