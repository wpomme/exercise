#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "list.h"

void build_graph_from_array_test1(void) {
  int size = 6;
  ListNode *graph[size];

  // initialize graph nodes
  for (int i = 0; i < size; i++) {
    graph[i] = list_new_empty_node();
    graph[i]->data = i+1;
  }

  // TODO: 配列の長さを固定する必要がある
  int build_graph[][6] = {
    {2, 3, 0, 0, 0, 0},
    {3, 4, 0, 0, 0, 0},
    {5, 0, 0, 0, 0, 0},
    {6, 0, 0, 0, 0, 0},
    {6, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 0},
  };

  int build_graph_size[] = {2, 2, 1, 1, 1, 0};

  // initialize graph nodes
  for (int i = 0; i < size; i++) {
    int actual_size = build_graph_size[i];
    int actual_array[actual_size];

    for (int j = 0; j < actual_size && build_graph[i][j] != 0; j++) {
      actual_array[j] = build_graph[i][j];
      // printf("%d: %d\n", j, actual_array[j]);
    }

    for (int j = 0; j < actual_size; j++) {
      int next_point = actual_array[j];

      // TODO: nodeをinsertする関数を作成する
      list_insert(graph[i], j, *graph[next_point]);
    }
  }

  // assertion
  for (int i = 0; i < size; i++) {
    int expected_size = 0;
    ListNode *head = graph[i];

    for (ListNode *pos = head; pos != NULL; pos = pos->next) {
      printf("actual->data: %i, actual->next: %p\n", pos->data, (void *)pos->next);
      expected_size++;
    }

    int actual_size = build_graph_size[i];

    assert(actual_size == expected_size);
  }
}

int main(void) {
  build_graph_from_array_test1();
  return 0;
}

