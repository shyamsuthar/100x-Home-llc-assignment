# Data Engineering Assessment

Welcome!  
This exercise evaluates your core **data-engineering** skills:

| Competency | Focus                                                         |
| ---------- | ------------------------------------------------------------- |
| SQL        | relational modelling, normalisation, DDL/DML scripting        |
| Python ETL | data ingestion, cleaning, transformation, & loading (ELT/ETL) |

---

## 0 Prerequisites & Setup

> **Allowed technologies**

- **Python ≥ 3.8** – all ETL / data-processing code
- **MySQL 8** – the target relational database
- **Lightweight helper libraries only** (e.g. `pandas`, `mysql-connector-python`).  
  List every dependency in **`requirements.txt`** and justify anything unusual.
- **No ORMs / auto-migration tools** – write plain SQL by hand.

---

## 1 Clone the skeleton repo

`````bash

git clone https://github.com/100x-Home-LLC/data_engineer_assessment.git
````bash
✏️ Note: feel free to rename the repo after cloning; the grading script only cares about the folder structure inside. Add you name to the repo.


2. **Start the MySQL database in Docker:**

   ```bash
   docker-compose -f docker-compose.initial.yml up --build -d
   ```

   - Database is available on `localhost:3306`
   - Credentials/configuration are in the Docker Compose file
   - **Do not change** database name or credentials

3. For MySQL Docker image reference:
   [MySQL Docker Hub](https://hub.docker.com/_/mysql)

---

### Problem

- You are provided with A raw JSON file containing property records is located in data/raw_properties.json
- Each row relates to a property. Each row mixes many unrelated attributes (property details, HOA data, rehab estimates, valuations, etc.).
- There are multiple Columns related to this property.
- The database is not normalized and lacks relational structure.
- Use the supplied Field Config.xlsx (in data/) to understand business semantics.

### Task

- **Normalize the data:**

  - Develop a Python ETL script to read, clean, transform, and load data into your normalized MySQL tables.
  - Refer the field config document for the relation of business logic
  - Use primary keys and foreign keys to properly capture relationships

- **Deliverable:**
  - Write necessary python and sql scripts
  - Place the scripts inside the `scripts/` directory
  - The scripts should take the initial json to your final, normalized schema when executed
  - Clearly document how to run your script, dependencies, and how it integrates with your database.

**Tech Stack:**

- Python (include a `requirements.txt`)
  Use **MySQL** and SQL for all database work
- You may use any CLI or GUI for development, but the final changes must be submitted as python/ SQL scripts
- **Do not** use ORM migrations—write all SQL by hand

### Solution

> **Document your database design and solution here:**
>
> - Explain your schema and any design decisions
> - Give clear instructions on how to run and test your script

> **Document your ETL logic here:**
>
> - Outline your approach and design
> - Provide instructions and code snippets for running the ETL
> - List any requirements

---

## Submission Guidelines

- Edit this README with your solutions and instructions for each section
- Place all scripts/code in their respective folders (`sql/`, `scripts/`, etc.)
- Ensure all steps are fully **reproducible** using your documentation
- Create a Private fork from the original repository and share with https://github.com/mantreshjain

---

**Good luck! We look forward to your submission.**
`````
