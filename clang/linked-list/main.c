#include <stdio.h>
#include "list.h"

int main(void) {
  ListNode *l;

  l = list_create();
  l->data = 0;

  for (int i = 0; i < 26; i++) {
    list_insert(l, i, 1 + i);
  }

  list_traverse(l);

  return 0;
}
