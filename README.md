# Dental Appointment System

A Java-based web application designed to facilitate dental appointment scheduling, patient registration, and interactions between patients and dental practitioners through dedicated user interfaces.

Developed as a collaborative academic group project under the BS Computer Science program at the University of Santo Tomas.

## Key Features

- Patient registration and login
- Doctor and patient dashboards
- Dental appointment scheduling interfaces
- Patient and doctor account interfaces
- Treatment management interfaces
- In-memory demonstration data storage

## Technology Stack

| Category | Technologies |
| --- | --- |
| Backend | Java, Java Servlets |
| Frontend | JSP, HTML, CSS |
| Data Storage | In-memory storage |
| Application Server | GlassFish |
| Development Environment | Apache NetBeans |

## My Role and Contributions

**Frontend-focused Developer | Academic Group Project**

Worked primarily on frontend development as part of a three-person software development team.

This repository showcases our team's collective implementation and my experience contributing to web application interfaces, user-facing features, and collaborative Java web development.

## Project Structure

- `src/` - Java application source code
- `web/` - Web interfaces and application resources
- `nbproject/` - NetBeans project configuration
- `build.xml` - Ant build configuration

## Local Setup

1. Open the project in Apache NetBeans with a compatible Java and GlassFish environment.
2. Copy `web/WEB-INF/web.xml.example` to `web/WEB-INF/web.xml`.
3. Configure the required local application settings.
4. Restore the required libraries in `web/WEB-INF/lib/`.
5. Resolve application server and library references in NetBeans.
6. Set the following environment variables in the application server environment:

   - `DEMO_DOCTOR_PASSWORD`
   - `DEMO_PATIENT_PASSWORD`

7. Build and deploy the application through GlassFish.

**Note:** Do not commit local configuration files or credentials.

### Required Dependencies

Refer to the NetBeans project configuration for the required libraries and application server dependencies.

## Project Status and Limitations

This application was developed for academic purposes and is not intended for production deployment.

The current implementation uses in-memory demonstration data storage rather than a persistent database.

The demonstration authentication implementation uses plaintext credentials stored in memory. Secure password hashing and persistent database integration would be required before production use.

The portfolio version has not undergone full runtime testing or a comprehensive security audit.

Use fictional demonstration accounts only. Do not enter real patient information, medical records, or sensitive credentials.

## Acknowledgments

Developed collaboratively as an academic group project under the BS Computer Science program at the University of Santo Tomas. Credit belongs to all contributing team members.

### Group Members

- Cabrera, Keith Loise
- Diccion, Ma. Ailah Jolie
- Santiago, Faith Oliver