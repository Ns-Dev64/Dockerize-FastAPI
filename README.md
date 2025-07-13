
# Rail Sathi Complaint Microservice

This is a FastAPI-based microservice that allows passengers to register, update, and track railway complaints. It also handles media uploads associated with complaints and provides detailed train metadata based on train numbers.

## Setup Instructions

### Requirements

- Docker and Docker Compose
- Git

### Steps

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/railsathi-service.git
cd railsathi-service
```

2. **Create a .env file**

```bash
cp .env.example .env
# Then edit the file with your own DB credentials and secrets
```

3. **Build and start the service**

```bash
docker-compose up --build
```

4. **Access the service**

Once it's running, open this URL in your browser to explore the API:

```
http://localhost:8000/rs_microservice/docs
```

## API Endpoints

All endpoints are available under the `/rs_microservice` path.

### General

- `GET /rs_microservice` - Base endpoint to confirm service is running
- `GET /health` - Basic health check

### Complaint Operations

- `POST /rs_microservice/complaint/add/` - Create a new complaint with optional media files
- `GET /rs_microservice/complaint/get/{complain_id}` - Retrieve a complaint by its ID
- `GET /rs_microservice/complaint/get/date/{date_str}?mobile_number=...` - Retrieve complaints for a specific date and mobile number
- `PATCH /rs_microservice/complaint/update/{complain_id}` - Partially update a complaint
- `PUT /rs_microservice/complaint/update/{complain_id}` - Fully replace a complaint
- `DELETE /rs_microservice/complaint/delete/{complain_id}` - Delete a complaint by ID
- `DELETE /rs_microservice/media/delete/{complain_id}` - Delete specific media files from a complaint

### Train Details

- `GET /rs_microservice/train_details/{train_no}` - Fetch train details along with depot, division, and zone info


## Limitations
- `Any user with the API URL can create, update, or delete complaints. Role-based access control is not yet implemented.`
- `Media uploads are handled in separate threads to avoid blocking, but this can be improved with async-compatible file handling for better scalability.`
- `There are no restrictions on how frequently users can submit complaints or upload files.`
- `While errors are logged and HTTP exceptions are raised, there is no structured error response format or centralized exception handler.`
