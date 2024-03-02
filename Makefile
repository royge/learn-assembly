build-env:
	docker build -t learn-asm -f Dockerfile .

run-env:
	docker run -it --rm --name learn-asm -v $(PWD):/home/app learn-asm
