#ifndef LIST_H
#define LIST_H

struct ListNode {
  int data;
  struct ListNode *next;
};

struct ListNode *list_new(void);
struct ListNode *list_create(void);
void list_insert(struct ListNode *l, int k, int item);
void list_delete(struct ListNode *l, int k);
int  list_size(struct ListNode *l);
void list_traverse(struct ListNode *l);

#endif
