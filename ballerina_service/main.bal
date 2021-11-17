import ballerina/http;

service /hello on new http:Listener(9090) {
    resource function get greeting() returns string { 
        return "Hello World!"; 
    }
    resource function get greetingInJson() returns json {
        return {
            "message": "Hello World!"
        };
    }
    resource function get users/[string username]() returns string {
        return "Username is: " + username;
    }
    resource function get users(string username, int age) returns json {
	    return {
		    "username ": username,
		    "age": age
	    };
    }
    resource function get userName(@http:Header {name: "username"} string username) returns string {
        return "Username is: " + username;
    }
    resource function put users(@http:Payload string username) returns string {
        return "Username is: " + username;
    }
    resource function post users(@http:Payload json user) returns json {
        return {"user": user};
    }
    resource function post usersXml(@http:Payload xml user) returns xml {
        return user;
    }
}
