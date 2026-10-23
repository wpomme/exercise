#include <stdio.h>
#include <stdlib.h>
#include "tree.h"

BinaryTree *tree_allocate(void) {
  return ((BinaryTree*) (unsigned long *)malloc(sizeof(BinaryTree)));
}

BinaryTree *tree_create_node(void) {
  BinaryTree *t;

  t = tree_allocate();
  t->val = 0;
  t->left = NULL;
  t->right = NULL;
  return(t);
}

BinaryTree *tree_create_tree(int data[], int size) {
  BinaryTree *tree_nodes[size];

  for (int i = 0; i < size; i++) {
    if (data[i] != -1) {
      tree_nodes[i] = tree_create_node();
      tree_nodes[i]->val = data[i];
    } else {
      tree_nodes[i] = NULL;
    }
  }

  for (int i = 0; i < size; i++) {
    int left = 2 * i + 1;
    int right = left + 1;

    if (left >= size) {
      break;
    }

    if (tree_nodes[i] != NULL) {

      tree_nodes[i]->left = tree_nodes[left];
      tree_nodes[i]->right = tree_nodes[right];
    }
  }

  // for (int i = 0; i < size; i++) {
  //   if (tree_nodes[i] != NULL) {
  //     printf("%i, %p, %p\n", tree_nodes[i]->val, (void *)tree_nodes[i]->left, (void *)tree_nodes[i]->right);
  //   }
  // }

  return tree_nodes[0];
}
