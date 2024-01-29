# tutorial-os-script

作業系統對應腳本語法練習與腳本範本。

## 簡介

作業系統本質是一套軟體的聚合體，其上所有軟體都是基於作業系統提供的基礎指令、工具、驅動等服務來運行，因此，若要對作業系統提供的服務除了軟體本身對系統的操作語法外，可以使用作業系統本身的腳本機制來撰寫對作業系統服務的邏輯操作與工作流，並以此來設計對系統的自動化與軟體啟動前的前置處理。

+ Window：batch script
+ Linux / Mac ：shell script


### 變數處理 ( Variable process )

利用變數的運算式對變數內容進行局部提取、字串解析。

+ [Linux](./src/linux/variable)
+ [Window](./src/win/variable)

### 邏輯描述 ( Logic statement )

邏輯描述泛指所有關於條件式 ( Conditional )、迴圈 ( Loops ) 等運用

+ [Linux](./src/linux/statement)

### 檔案操作 ( File operate )

利用檔案與字串解析指令，對目標檔案新增、刪除、修改資訊

+ [Linux](./src/linux/file-operate)

### 重導向 ( Redirection )

在 Console 若要輸出入文字、錯誤訊息，會基於 stdout、stdin、stderr 這些標準訊息指標 ( fp ) 顯示至目標，而若要將此些訊息輸出至某些檔案則稱為重導向 ( Redirection )。

+ [Linux I/O 輸入與輸出重新導向，基礎概念教學](https://blog.gtwang.org/linux/linux-io-input-output-redirection-operators/)
+ [An Introduction to Linux I/O Redirection](https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-i-o-redirection)
    - [How to redirect standard (stderr) error in bash](https://www.cyberciti.biz/faq/how-to-redirect-standard-error-in-bash/)

範本程式：

+ [Linux](./src/linux/redirection)

### 應用 ( Application )

基於前述項目的進階運用

+ [函數呼叫者檢索](./src/linux/app/called)
+ [序號檔產生](./src/linux/app/serial-number)
+ [try-catch 架構](./src/linux/app/try-catch)
+ [執行變數腳本](./src/linux/app/script-runner)

## 文獻
