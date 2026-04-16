def my_union(lst1, lst2)
  hash_table = lst1.to_h {|i| [i, true]}
  lst2.filter { |i| hash_table.key?(i) }
end
