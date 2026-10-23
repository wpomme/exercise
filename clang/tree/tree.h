#ifndef TREE_H
#define TREE_H

typedef struct BinaryTree_tag {
  int val;
  struct BinaryTree_tag *left;
  struct BinaryTree_tag *right;
} BinaryTree;

BinaryTree *tree_allocate(void);
BinaryTree *tree_create_node(void);
BinaryTree *tree_create_tree(int data[], int size);
// void preorder(BinaryTree *pos, int leaf[], int i);
// int preorder(BinaryTree *pos, int leaf[], int i);

#endif
