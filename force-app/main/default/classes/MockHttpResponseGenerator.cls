  private class MockHttpResponseGenerator implements HttpCalloutMock {
        private String mockResponse;
        
        public MockHttpResponseGenerator(String mockResponse) {
            this.mockResponse = mockResponse;
        }
        
        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            response.setBody(mockResponse);
            response.setStatusCode(200);
            return response;
        }
    }