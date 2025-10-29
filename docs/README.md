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

```
git clone https://github.com/100x-Home-LLC/data_engineer_assessment.git
```

✏️ Note: Rename the repo after cloning and add your full name.

**Start the MySQL database in Docker:**

```
docker-compose -f docker-compose.initial.yml up --build -d
```

- Database is available on `localhost:3306`
- Credentials/configuration are in the Docker Compose file
- **Do not change** database name or credentials

For MySQL Docker image reference:
[MySQL Docker Hub](https://hub.docker.com/_/mysql)

---

### Problem

- You are provided with a raw JSON file containing property records is located in data/
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
  - Place your scripts in `sql/` and `scripts/`
  - The scripts should take the initial json to your final, normalized schema when executed
  - Clearly document how to run your script, dependencies, and how it integrates with your database.

**Tech Stack:**

- Python (include a `requirements.txt`)
  Use **MySQL** and SQL for all database work
- You may use any CLI or GUI for development, but the final changes must be submitted as python/ SQL scripts
- **Do not** use ORM migrations—write all SQL by hand

---

Database Design

Tables: property, leads, valuation, rehab, hoa, taxes

Primary Keys: Each table has a unique key (property_id, hoa_id, taxes_id)

Foreign Keys: Relate hoa, taxes, valuation, rehab, and leads to property

Design Decisions:

Nested JSON fields like HOA and Taxes are stored in separate tables.

Only valid columns from the JSON are inserted into MySQL to prevent errors.

Data types are chosen based on field type: INT for numbers, VARCHAR for text, FLOAT for decimals.

ETL Logic

Extract: Read raw JSON file and field configuration Excel file.

Transform:

Flatten nested lists/dictionaries (HOA, Taxes, Valuation, Rehab).

Convert dict/list objects to JSON strings if necessary.

Filter only columns that exist in the MySQL tables.

Load: Insert the cleaned data into MySQL tables using pandas.to_sql() with if_exists='append'.

How to run ETL script:

Install dependencies: pip install -r requirements.txt

Update MySQL credentials in the script.

Run the script: python scripts/load_data.py

Output CSVs are saved in output_csv/ for verification.

Requirements:

Python 3.8+

Pandas, SQLAlchemy, PyMySQL, openpyxl

MySQL 8 running locally or in Docker

Docker Instructions

Base image: python:3.10-slim

Set working directory: /app

Copy JSON, Excel config, scripts, and requirements.txt into /app

Install dependencies: pip install -r requirements.txt

Set environment variables for MySQL credentials

Run the ETL script inside container: CMD ["python", "scripts/load_data.py"]

Build image: docker build -t home_data_loader .

Run container: docker run --env-file .env home_data_loader

Optionally, mount a local folder to save CSV backups and logs
