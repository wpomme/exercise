// Node.jsのsort関数の実行時間をperformance.now()を使って計測する

// 1からその要素数の数値が順番に入っている配列をshuffleでランダムにしたもの
// それぞれの要素数は1000, 10000, 100000とした
// フィッシャー–イェーツのシャッフルを使用している
export function shuffle<T>(arr: T[]): T[] {
  const result = [...arr];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    // Swap the value of i and j
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

const sizes = [1000, 10000, 100_000];
const shuffledListArray = sizes.map((n) =>
  shuffle(Array.from({ length: n }, (_, i) => i + 1))
);

for (const lst of shuffledListArray) {
  const start = performance.now();
  [...lst].sort((a, b) => a - b);
  const elapsed = performance.now() - start;
  console.log(`1..${lst.length}: ${elapsed.toFixed(6)} ms`);
}
