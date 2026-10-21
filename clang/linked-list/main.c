#include <stdio.h>
#include <stdlib.h>

struct element {
  char data;
  struct element *next;
};

struct element *new(void) {
  return ((struct element*) (unsigned long *)malloc(sizeof(struct element)));
}

struct element *create(void) {
  struct element *p;

  p = new();
  p->next = NULL;
  return(p);
}

void insert(struct element *l, int k, char item) {
  struct element *p;

  if (k > 1) {
    insert(l->next, k-1, item);
  } else {
    p = new();
    p->data = item;
    p->next = l->next;
    l->next = p;
  }
}

void delete(struct element *l, int k) {
  if (k > 1) {
    delete(l->next, k-1);
  } else {
    l->next = l->next->next;
  }
}

char access(struct element *l, int k) {
  if (k > 1) {
    return (access(l->next, k-1));
  } else {
    return (l->next->data);
  }
}

int size(struct element *l) {
  int count = 1;

  while (l->next != NULL) {
    count++;
    l->next = l->next->next;
  }

  return count;
}

// 一度実行するとリストを辿ることが出来なくなってしまう
void traverse(struct element *l) {
  printf("%c", l->data);

  while (l->next != NULL) {
    printf("%c", l->next->data);
    l->next = l->next->next;
  }
  printf("\n");
}

int main(void) {
  struct element *l;

  // 最初にダミーノードを作成する
  l = create();
  l->data = 'z';

  for (int i = 1; i <= 10; i++) {
    // 0x61 == a
    insert(l, i, 0x60 + i);
  }

  traverse(l);

  return 0;
}
