FROM hollowman6/mdbook-pdf

COPY --from=peaceiris/mdbook:v0.5.0-rust /usr/bin/mdbook-mermaid /usr/bin/mdbook-mermaid
COPY --from=peaceiris/mdbook:v0.5.0-rust /usr/bin/mdbook-toc /usr/bin/mdbook-toc