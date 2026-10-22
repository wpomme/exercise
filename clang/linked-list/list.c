#include <stdio.h>
#include <stdlib.h>
#include "list.h"

ListNode *list_new(void) {
  return ((ListNode*) (unsigned long *)malloc(sizeof(ListNode)));
}

ListNode *list_create(void) {
  ListNode *p;

  p = list_new();
  p->data = 0;
  p->next = NULL;
  return(p);
}

void list_insert(ListNode *l, int k, int item) {
  ListNode *p;

  if (k > 0) {
    list_insert(l->next, k-1, item);
  } else {
    p = list_new();
    p->data = item;
    p->next = l->next;
    l->next = p;
  }
}

ListNode *list_create_all(int data[], int size) {
  ListNode *list_nodes[size];

  for (int i = 0; i < size; i++) {
    list_nodes[i] = list_create();
    list_nodes[i]->data = data[i];
  }

  for (int i = 0; i < size - 1; i++) {
    list_nodes[i]->next = list_nodes[i+1];
  }

  // 最後の要素はNULLを参照する
  list_nodes[size - 1]->next = NULL;

  return list_nodes[0];
}

void list_delete(ListNode *l, int k) {
  if (k > 0 && l->next->next != NULL) {
    list_delete(l->next, k-1);
  } else {
    ListNode *tmp;
    tmp = l->next;
    l->next = l->next->next;
    free(tmp);
    tmp = NULL;
  }
}

int list_size(ListNode *l) {
  int count = 0;

  ListNode *traversal;
  traversal = list_create();
  traversal->next = l->next;

  while (traversal->next != NULL) {
    count++;
    traversal->next = traversal->next->next;
  }

  return count;
}

void list_traverse(ListNode *l) {
  ListNode *traversal;
  traversal = list_create();
  traversal->next = l->next;
  traversal->data = l->data;

  printf("%i\n", traversal->data);

  while (traversal->next != NULL) {
    printf("%i\n", traversal->next->data);
    traversal->next = traversal->next->next;
  }
}

int list_size2(ListNode *head) {
  int count = 0;
  for (ListNode *pos = head; pos != NULL; pos = pos->next) {
    count++;
  }
  return count;
}

// void list_search(ListNode *l) {
//   for (struct pos = l; pos != NULL; pos = pos->next) {
//     // if (found) {
//     //   break;
//     // }
//   }
//
//   if (pos == NULL) {
//     // 見つからなかった場合
//   } else {
//     // 見つかった場合
//   }
// }
