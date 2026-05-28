FROM danielgatis/rembg:latest

# The base image bakes in the u2net model and sets ENTRYPOINT ["rembg"].
# We override CMD so the container launches the HTTP server instead of --help.
# --no-ui skips the heavy Gradio UI (faster start, lower idle memory).
# Limit onnxruntime threads to be a good neighbour on the shared VPS.
ENV OMP_NUM_THREADS=2 \
    ORT_NUM_THREADS=2

EXPOSE 7000

HEALTHCHECK --interval=15s --timeout=5s --start-period=60s --retries=10 \
  CMD curl -fsS http://localhost:7000/api || exit 1

CMD ["s", "-p", "7000", "-h", "0.0.0.0", "--no-ui"]
