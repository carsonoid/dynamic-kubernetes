# Process the final output pages
FROM python:3
RUN pip install beautifulsoup4
COPY utils .
COPY Slides/* /out/
RUN ./publish.py /out/*.html

# Build a minimal final image
FROM abiosoft/caddy
COPY --from=0 /out/* /srv/
COPY Caddyfile /etc/
