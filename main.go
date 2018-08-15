package main

import (
	"errors"
	"fmt"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"os"
	//	"strings"
)

var (
	APIKEY       = os.Getenv("AK")
	ErrorBackend = errors.New("Something went wrong")
)

func Handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	fmt.Println(request)
	msg := `{"token":` + APIKEY + `,"status":0}`
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers:    map[string]string{"x-airdb-token": "416c9006ca431f503160b7e7", "Access-Control-Allow-Origin": "*"},
		Body:       msg,
	}, nil
}

func main() {
	lambda.Start(Handler)
}
