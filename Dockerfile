FROM danielgatis/rembg:latest

# The base image bakes in the u2net model (RUN rembg d u2net) and sets
# ENTRYPOINT ["rembg"]. We only need to override the default CMD so the
# container launches the HTTP server instead of printing --help.
EXPOSE 7000

HEALTHCHECK --interval=15s --timeout=5s --start-period=90s --retries=5 \
  CMD curl -fsS http://localhost:7000/api || exit 1

CMD ["s", "-p", "7000", "-h", "0.0.0.0"]
