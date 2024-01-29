# Declare variable

# Declare function

# Execute Script
## read 的顯示會使用到 stderr，導致若轉導 stderr 會使得資訊消失
## 因此，在單獨執行時額外增加 2>&1，讓其資訊轉導至 stdout，則可正常顯示
## 而其後故意執行錯誤的部分仍會出現在 /tmp/error 中
(
  read -e -i "n" -p "Give an answer (y|n) ? " ans 2>&1
  echo ${ans}
  ls error
) 2> /tmp/error

## 可以注意到，若移除 2>&1，輸入的結果會顯示在前，而訊息 "Give an answer"會出現在 /tmp//error
cat /tmp/error
