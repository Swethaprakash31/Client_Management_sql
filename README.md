# Client Management System

This project implements a **Client Management System** designed to track clients, contacts, projects, and interactions. It uses a MySQL database to store and manage data related to clients, their projects, associated contacts, and interaction history.

## Database Structure

The system consists of four primary tables:

1. **clients** - Stores information about the clients.
2. **contacts** - Stores information about the contacts linked to each client.
3. **projects** - Stores details about projects for each client.
4. **interactions** - Tracks interactions with clients (e.g., meetings, calls).

### Table Descriptions

#### `clients` Table
- **id**: Unique identifier for each client.
- **name**: Name of the client.
- **company_name**: Name of the client's company.
- **email**: Email address of the client.
- **phone**: Contact number for the client.
- **created_at**: Timestamp of when the client was added to the database.

#### `contacts` Table
- **id**: Unique identifier for each contact.
- **client_id**: The client associated with the contact (foreign key).
- **contact_name**: Name of the contact person.
- **contact_role**: Role or title of the contact.
- **contact_email**: Email address of the contact.
- **contact_phone**: Phone number of the contact.

#### `projects` Table
- **id**: Unique identifier for each project.
- **client_id**: The client associated with the project (foreign key).
- **project_name**: Name of the project.
- **status**: Current status of the project (e.g., "In Progress", "Completed").
- **start_date**: The start date of the project.
- **end_date**: The end date of the project.

#### `interactions` Table
- **id**: Unique identifier for each interaction.
- **client_id**: The client associated with the interaction (foreign key).
- **interaction_type**: Type of interaction (e.g., "Meeting", "Call").
- **interaction_date**: The date of the interaction.
- **notes**: Additional notes about the interaction.

## Sample Data

The following sample data has been inserted into the database:

- **Clients**: John Doe (Acme Corp) and Jane Smith (Globex Ltd).
- **Contacts**: Mike Johnson (Acme Corp) and Sara Lee (Globex Ltd).
- **Projects**: Website Redesign (Acme Corp), Mobile App Development (Globex Ltd).
- **Interactions**: A meeting with John Doe and a call with Jane Smith.

## SQL Queries

The system includes various sample queries to interact with the database:

- **View all clients**: Displays all the clients in the system.
- **View client projects**: Shows all projects for each client.
- **View interactions in the last 60 days**: Fetches interactions that occurred within the last 60 days.
- **Count projects per client**: Displays the number of projects each client has.
- **List all client emails and phone numbers**: Shows the email and phone number of all clients.
- **List all project names and their status**: Displays all project names along with their status.
- **List all interactions in March 2024**: Displays interactions that occurred during March 2024.
- **Show all contacts for 'Jane Smith'**: Fetches all contacts associated with Jane Smith.

## Getting Started

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/client-management.git
   cd client-management
