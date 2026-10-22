#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "list.h"

void list_create_test1(void) {
  ListNode *actual = list_create();

  void *expected_next = NULL;
  int expected_data = 0;

  printf("actual_data: %i, expected_data: %i\n", actual->data, expected_data);
  printf("actual_next: %p, expected_next: %p\n", (void *)actual->next, expected_next);

  assert(actual->data == expected_data);
  assert(actual->next == expected_next);

  printf("list_size2_test1 passed\n");
}

// createで作成しただけのリンクリストはfreeでメモリを解放した後、NULLを参照させるようにして削除する
void list_create_test2(void) {
  ListNode *actual = list_create();

  free(actual);
  actual = NULL;

  void *expected = NULL;

  printf("actual: %p, expected_data: %p\n", (void *)actual, (void *)expected);

  assert(actual == expected);

  printf("list_create_test2 passed\n");
}

// 要素が二つだけのリンクリストを作成する
void list_insert_test1(void) {
  ListNode *head = list_create();
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

void list_size2_test1(void) {
  ListNode *head = list_create();
  head->data = 0;

  int actual = list_size2(head);
  int expected = 1;

  printf("actual: %i, expected: %i\n", actual, expected);

  assert(actual == expected);

  printf("list_size2_test1 passed\n");
}

void list_create_all_test1(void) {
  int actual_size = 10;
  int data[10] = {2, 3, 6, 1, 7, 2, 8, 9, 10, 12};

  ListNode *head = list_create();

  head = list_create_all(data, actual_size);

  int expected_size = 0;

  for (ListNode *pos = head; pos != NULL; pos = pos->next) {
    expected_size++;
    printf("actual->data: %i, actual->next: %p\n", pos->data, (void *)pos->next);
  }

  assert(actual_size == expected_size);

  printf("list_create_all_test1 passed\n");
}

int main(void) {
  list_create_test1();
  list_create_test2();
  list_insert_test1();
  list_size2_test1();
  list_create_all_test1();
  return 0;
}
