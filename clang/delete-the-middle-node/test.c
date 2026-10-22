#include <stdio.h>
#include <assert.h>
#include "list.h"

struct ListNode* deleteMiddleNode(struct ListNode *l);

void delete_middle_node_test1(void) {
  struct ListNode *l = list_create();
  l->data = 0;

  int act_val[] = {1, 3, 4, 7, 1, 2, 6};
  int n = 7;
  for (int i = 0; i < n; i++) {
    list_insert(l, i, act_val[i]);
  }

  assert(list_size(l) == 7);

  // struct ListNode *actual = list_create();
  // actual->data = 0;

  deleteMiddleNode(l);

  assert(list_size(l) == 6);

  int expected[] = {1, 3, 4, 1, 2, 6};
  struct ListNode *cur = l->next;
  for (int i = 0; i < 6; i++) {
    printf("act_val: %i, expected: %i\n", cur->data, expected[i]);
    assert(cur->data == expected[i]);
    cur = cur->next;
  }

  printf("delete_middle_node_test1 passed\n");
}

void delete_middle_node_test2(void) {
  struct ListNode *l = list_create();
  l->data = 0;

  int actual[] = {1, 2, 3, 4};
  int n = 4;
  for (int i = 0; i < n; i++) {
    list_insert(l, i, actual[i]);
  }

  assert(list_size(l) == n);

  deleteMiddleNode(l);

  assert(list_size(l) == n - 1);

  int expected[] = {1, 2, 4};
  struct ListNode *cur = l->next;
  for (int i = 0; i < n-1; i++) {
    // printf("actual: %i, expected: %i\n", cur->data, expected[i]);
    assert(cur->data == expected[i]);
    cur = cur->next;
  }

  printf("delete_middle_node_test2 passed\n");
}

void delete_middle_node_test3(void) {
  struct ListNode *l = list_create();
  l->data = 0;

  int actual[] = {2, 1};
  int n = 2;
  for (int i = 0; i < n; i++) {
    list_insert(l, i, actual[i]);
  }

  assert(list_size(l) == n);

  deleteMiddleNode(l);

  assert(list_size(l) == n - 1);

  int expected[] = {2};
  struct ListNode *cur = l->next;
  for (int i = 0; i < n-1; i++) {
    // printf("actual: %i, expected: %i\n", cur->data, expected[i]);
    assert(cur->data == expected[i]);
    cur = cur->next;
  }

  printf("delete_middle_node_test3 passed\n");
}

int main(void) {
  delete_middle_node_test1();
  delete_middle_node_test2();
  delete_middle_node_test3();
  return 0;
}
