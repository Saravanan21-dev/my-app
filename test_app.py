import pytest
from src.app import app   # import your Flask app

@pytest.fixture
def client():
    # Flask provides a test client for simulating HTTP requests
    with app.test_client() as client:
        yield client

def test_home_route(client):
    # Send a GET request to "/"
    response = client.get("/")
    
    # Check status code
    assert response.status_code == 200
    
    # Check response body
    assert response.data.decode("utf-8") == "Hello from Azure WebApp via GitHub Actions CI/CD!"
