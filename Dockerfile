FROM danielgatis/rembg:latest

EXPOSE 7000

# TEMP: confirm available memory + whether the server supports --no-ui
ENTRYPOINT []
CMD ["sh", "-c", "echo ===MEM===; grep -E 'MemTotal|MemFree|MemAvailable' /proc/meminfo; echo ===VERSION===; rembg --version; echo ===S_HELP===; rembg s --help; echo ===DONE===; sleep 3600"]
