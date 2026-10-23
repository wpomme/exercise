#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "tree.h"

int leaf[100];
int i = 0;

void make_leaf(BinaryTree *pos) {
  if (pos != NULL) {
    if (pos->left == NULL && pos->right == NULL) {
      // printf("%i\n", pos->val);
      leaf[i] = pos->val;
      i++;
    }
    make_leaf(pos->left);
    make_leaf(pos->right);
  }
}

void tree_test1(void) {
  int actual_size = 7;
  int data[] = {3, 9, 20, -1, -1, 15, 7};

  BinaryTree *root = tree_create_node();

  root = tree_create_tree(data, actual_size);

  for (int i = 0; i < 100; i++) {
    leaf[i] = -1;
  }

  make_leaf(root);

  for (int i = 0; i < 100 && leaf[i] != -1; i++) {
    printf("leaf %i: %i\n", i, leaf[i]);
  }

  printf("tree_test1 passed\n");
}

int main(void) {
  tree_test1();
  return 0;
}
