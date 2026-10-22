#include "list.h"
#include <stdio.h>

static int floor_dev(int a, int b) {
  return (a + b - 1) / b;
}

struct ListNode* deleteMiddleNode(struct ListNode *head) {
  int a = list_size(head);
  int m = floor_dev(a-1, 2);
  // printf("deleted node: %i\n", m);
  list_delete(head, m);
  return head;
}
