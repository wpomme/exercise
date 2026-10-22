#ifndef LIST_H
#define LIST_H

struct ListNode {
  int data;
  struct ListNode *next;
};

typedef struct ListNode ListNode;

ListNode *list_new(void);
ListNode *list_create(void);
void list_insert(ListNode *l, int k, int item);
void list_delete(ListNode *l, int k);
int  list_size(ListNode *l);
void list_traverse(ListNode *l);
int  list_size2(ListNode *l);

#endif
