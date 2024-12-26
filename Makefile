debug:
	hugo server --buildDrafts

deploy:
	rm -rf docs && hugo && cp CNAME docs/CNAME