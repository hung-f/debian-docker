
### Build:
```
docker build -t my_debian_image .
```

### Run:
```
docker run -it --name "debian_container" my_debian_image 
```

### Execute:
```
docker exec -it debian_container bash
```

### Thông tin hệ điều hành:
```
cat /etc/os-release
```
```
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```
### Thông tin CPU:
```
cat /proc/cpuinfo
```
```
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 151
model name      : 12th Gen Intel(R) Core(TM) i7-12700
stepping        : 2
microcode       : 0xffffffff
cpu MHz         : 2111.999
cache size      : 25600 KB
physical id     : 0
siblings        : 20
core id         : 0
cpu cores       : 10
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 28
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology tsc_reliable nonstop_tsc cpuid pni pclmulqdq vmx ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves avx_vnni umip waitpkg gfni vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize flush_l1d arch_capabilities
vmx flags       : vnmi invvpid ept_x_only ept_ad ept_1gb tsc_offset vtpr ept vpid unrestricted_guest ept_mode_based_exec tsc_scaling usr_wait_pause
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs retbleed eibrs_pbrsb
bogomips        : 4223.99
clflush size    : 64
cache_alignment : 64
address sizes   : 46 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 151
model name      : 12th Gen Intel(R) Core(TM) i7-12700
stepping        : 2
microcode       : 0xffffffff
cpu MHz         : 2111.999
cache size      : 25600 KB
physical id     : 0
siblings        : 20
core id         : 0
```

```
nproc

free -h  # Thông tin bộ nhớ (RAM) sử dụng và khả dụng

top

htop

uname -a

```


Lệnh `docker run` có nhiều tùy chọn (options) cho phép bạn kiểm soát cách container được tạo và chạy. Dưới đây là danh sách các tùy chọn phổ biến nhất cùng với giải thích của chúng:

### Tùy chọn cơ bản

1. **`-d`, `--detach`**
   - Chạy container trong chế độ tách biệt (detached mode). Container sẽ chạy ở chế độ nền.

2. **`--name`**
   - Đặt tên cho container. Điều này giúp dễ dàng tham chiếu đến container sau này.

3. **`-p`, `--publish`**
   - Map cổng từ container ra máy chủ. Ví dụ: `-p 8080:80` sẽ chuyển tiếp cổng 80 trong container ra cổng 8080 trên máy chủ.

4. **`-e`, `--env`**
   - Thiết lập biến môi trường cho container. Ví dụ: `-e MY_VAR=value`.

5. **`-v`, `--volume`**
   - Mount một volume hoặc thư mục từ máy chủ vào container. Ví dụ: `-v /host/path:/container/path`.

6. **`--rm`**
   - Tự động xóa container khi nó dừng lại. Hữu ích để không để lại các container đã dừng.

7. **`-it`**
   - Kết hợp hai tùy chọn:
     - `-i` (interactive): Giữ STDIN mở cho container.
     - `-t` (tty): Tạo một terminal ảo. Thường dùng để chạy shell tương tác trong container.

8. **`--restart`**
   - Thiết lập chính sách khởi động lại cho container. Ví dụ: `--restart always` để khởi động lại container khi nó dừng.

### Tùy chọn nâng cao

9. **`--network`**
   - Chỉ định mạng mà container sẽ sử dụng. Ví dụ: `--network my_network`.

10. **`--privileged`**
    - Cung cấp quyền truy cập cao hơn cho container, cho phép nó thực hiện các tác vụ mà một container thông thường không thể.

11. **`--user`**
    - Chạy container dưới một người dùng cụ thể, ví dụ: `--user myuser`.

12. **`--workdir`, `-w`**
    - Đặt thư mục làm việc cho container. Ví dụ: `-w /app`.

13. **`--cap-add`**
    - Thêm các capability bổ sung cho container. Ví dụ: `--cap-add NET_ADMIN`.

14. **`--cap-drop`**
    - Xóa các capability không cần thiết từ container. Ví dụ: `--cap-drop MKNOD`.

15. **`--gpus`**
    - Chỉ định số lượng GPU mà container có thể sử dụng, thường dùng trong các ứng dụng machine learning.

16. **`--entrypoint`**
    - Thay đổi entrypoint của container. Điều này sẽ ghi đè lên entrypoint mặc định trong image.

17. **`--dns`**
    - Thiết lập máy chủ DNS cho container. Ví dụ: `--dns 8.8.8.8`.

18. **`--log-driver`**
    - Chỉ định driver cho logging. Ví dụ: `--log-driver json-file`.

19. **`--memory`**
    - Giới hạn lượng bộ nhớ mà container có thể sử dụng. Ví dụ: `--memory 512m`.

20. **`--cpus`**
    - Giới hạn số lượng CPU mà container có thể sử dụng. Ví dụ: `--cpus 1.5`.

### Ví dụ sử dụng
```bash
docker run -d --name my_container -p 8080:80 -e MY_VAR=value --rm my_image
```

Trong ví dụ trên, container sẽ chạy ở chế độ tách biệt, được đặt tên là `my_container`, chuyển tiếp cổng 80 từ container ra cổng 8080 trên máy chủ, thiết lập một biến môi trường, và tự động xóa khi dừng.

### Kết luận
Tùy chọn trong lệnh `docker run` rất đa dạng và linh hoạt, cho phép bạn cấu hình môi trường và tài nguyên của container một cách chi tiết. Bạn có thể tham khảo tài liệu chính thức của Docker để biết thêm chi tiết về từng tùy chọn.