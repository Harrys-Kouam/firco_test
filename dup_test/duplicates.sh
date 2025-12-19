
#!/usr/bin/env bash
set -euo pipefail

ROOT=("./dup_test/team_test"
      "./dup_test/team_bench_dev"
      "./dup_test/team_chou_dev"
      "./dup_test/team_gog_dev"
      )

OUT="merged.txt"
: > "$OUT"


for dir in "${ROOT[@]}"; do
    while IFS= read -r -d '' f; do
    cat "$f" >> "$OUT"
    echo "" >> "$OUT"
    done < <(find "$dir" -type f -name 'config.txt' -print0)
done
echo "Fusion écrite dans: $OUT"

dupes=$(sort "$OUT" | uniq -d);
if [ -n "$dupes" ]; then
    echo "ERROR: lignes dupliquées détectées :"
    echo "$dupes"
    exit 1
else 
    echo "Aucun doublons"
fi