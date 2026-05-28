FROM danielgatis/rembg:latest

EXPOSE 7000

# TEMPORARY DIAGNOSTIC: reset entrypoint and capture why rembg crashes on the VPS
# (host info + rembg stderr + exit code), then stay alive so logs are readable.
ENTRYPOINT []
CMD ["sh", "-c", "echo ===DIAG_START===; echo NPROC=$(nproc); echo AVX2=$(grep -c avx2 /proc/cpuinfo); head -2 /proc/meminfo; echo ===FREE_BEFORE===; free -m; echo ===RUN_REMBG===; rembg s -p 7000 -h 0.0.0.0; echo ===EXITCODE=$?===; echo ===FREE_AFTER===; free -m; echo ===SLEEP===; sleep 3600"]
