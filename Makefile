BUILD=dist
DEPLOYMENT=$(BUILD).zip
FUNCTION=lbs
REGION=cn-north-1

all: package
	echo $(Function) auto make success!!!
#	make git
	aws lambda update-function-code --region $(REGION) --function-name $(FUNCTION) --zip-file fileb://./$(DEPLOYMENT)

build: 
#	echo $(FunctionName)
#	go build main.go
	go get github.com/tools/godep
	godep get
	GOOS=linux go build -o $(BUILD) .

package: build
	zip $(DEPLOYMENT) $(BUILD)

test:
	aws lambda invoke --function-name $(FUNCTION) lambda.log

config:
	aws lambda update-function-configuration --function-name $(FUNCTION) --handler $(BUILD)

git:
	make clean
	git add . 
	git commit -m "auto make update"
	git push

.PHONY: clean
clean:
	rm -f $(BUILD) $(DEPLOYMENT)
	rm -f lambda.log
