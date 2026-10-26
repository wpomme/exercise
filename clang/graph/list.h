#ifndef LIST_H
#define LIST_H

typedef struct ListNode_tag {
  int data;
  struct ListNode_tag *next;
} ListNode;

// typedef struct ListNode ListNode;

ListNode *list_allocate(void);
ListNode *list_new_empty_node(void);
ListNode *list_build_nodes_from_array(int data[], int size);
void list_insert(ListNode *l, int k, int item);
void list_delete(ListNode *l, int k);
int  list_size(ListNode *l);
void list_traverse(ListNode *l);

#endif
