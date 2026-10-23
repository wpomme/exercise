#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "tree.h"
#include <stdbool.h>

int leaf[100];
int i = 0;

void make_leaf(BinaryTree *pos) {
  if (pos != NULL) {
    if (pos->left == NULL && pos->right == NULL) {
      printf("%i\n", pos->val);
      leaf[i] = pos->val;
      i++;
    }
    make_leaf(pos->left);
    make_leaf(pos->right);
  }
}

int j = 0;

bool result = true;

void check_similar_leaf(BinaryTree *pos) {
  if (pos != NULL) {
    if (pos->left == NULL && pos->right == NULL) {
      if (leaf[j] != pos->val) {
        printf("pos: %i\n", pos->val);
        printf("leaf: %i\n", leaf[j]);
        result = false;
      }
      j++;
    }
    check_similar_leaf(pos->left);
    check_similar_leaf(pos->right);
  }
}

void tree_test1(void) {
  int node_size1 = 11;
  int data1[] = {3, 5, 1, 6, 2, 9, 8, -1, -1, 7, 4};

  int node_size2 = 15;
  int data2[] = {3, 5, 1, 6, 7, 4, 2, -1, -1, -1, -1, -1, -1, 9, 8};

  BinaryTree *root1 = tree_create_node();
  BinaryTree *root2 = tree_create_node();

  root1 = tree_create_tree(data1, node_size1);
  root2 = tree_create_tree(data2, node_size2);

  for (int i = 0; i < 100; i++) {
    leaf[i] = -1;
  }

  make_leaf(root1);
  check_similar_leaf(root2);

  assert(result);

  // for (int i = 0; i < 100 && leaf[i] != -1; i++) {
  //   printf("leaf %i: %i\n", i, leaf[i]);
  // }

  printf("tree_test1 passed\n");
}

void leafSimilar(void) {
  int node_size1 = 3;
  int data1[] = {1, 2, 3};

  int node_size2 = 3;
  int data2[] = {1, 3, 2};

  BinaryTree *root1 = tree_create_node();
  BinaryTree *root2 = tree_create_node();

  root1 = tree_create_tree(data1, node_size1);
  root2 = tree_create_tree(data2, node_size2);

  for (int i = 0; i < 100; i++) {
    leaf[i] = -1;
  }
  i = 0;
  j = 0;

  make_leaf(root1);
  check_similar_leaf(root2);

  assert(result == false);

  // for (int i = 0; i < 100 && leaf[i] != -1; i++) {
  //   printf("leaf %i: %i\n", i, leaf[i]);
  // }

  printf("tree_test1 passed\n");
}

void tree_test3(void) {
  BinaryTree *root1 = tree_create_node();
  BinaryTree *node1 = tree_create_node();

  root1->val = 1;
  root1->left = node1;
  node1->val = 2;

  BinaryTree *root2 = tree_create_node();
  BinaryTree *node2 = tree_create_node();

  root2->val = 2;
  root2->left = node2;
  node2->val = 2;

  for (int i = 0; i < 100; i++) {
    leaf[i] = -1;
  }

  // グローバル変数を初期化する
  i = 0;
  j = 0;
  result = true;

  make_leaf(root1);
  check_similar_leaf(root2);

  // 葉の数が合わない場合はfalseにする
  if (i != j) {
    result = false;
  }

  assert(result == true);

  // for (int i = 0; i < 100 && leaf[i] != -1; i++) {
  //   printf("leaf %i: %i\n", i, leaf[i]);
  // }

  printf("tree_test1 passed\n");
}

int main(void) {
  // tree_test1();
  // tree_test2();
  tree_test3();
  return 0;
}
