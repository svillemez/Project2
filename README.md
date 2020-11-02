## ETL_Book_Club

ETL Project - Book Club Adela, Juliet, and Shannon

Data Cleanup & Analysis
 
The following sources of data were used:
 NYT Books API
 Goodreads API
 data.world: https://data.world/andidewa/books/workspace/file?filename=books.csv

The type of transformation needed for this data(cleaning, joining, filtering, aggregating, etc).
The data required cleaning, joining, and filtering.  We cleaned the data by dropping null values and filtered by specific columns.  The columns we filtered by the average ratings and isbn13 columns.  The NYT Book API data was merged with the Goodreads API data and the data.world was merged with the Goodreads API data.  


-The type of final production database to load the data into (relational or non-relational).
It was a relational database.


-The final tables or collections that will be used in the production database.
CREATE TABLE "books_data" (
    "Primary_ISBN_13" varchar   NOT NULL,
    "Title" varchar   NOT NULL,
    "Author" varchar   NOT NULL,
    "Whole_Rating" int   NOT NULL,
    CONSTRAINT "pk_books_data" PRIMARY KEY (
        "Primary_ISBN_13"
     )
);
CREATE TABLE "ratings_data" (
    "Primary_ISBN_13" varchar   NOT NULL,
    "Average_Rating" float   NOT NULL,
    "Whole_Rating" int   NOT NULL,
    "Rating_Count" int   NOT NULL,
    CONSTRAINT "pk_ratings_data" PRIMARY KEY (
        "Primary_ISBN_13"
     )
);
CREATE TABLE "nyt_data" (
    "Primary_ISBN_13" varchar   NOT NULL,
    "List" varchar   NOT NULL,
    "Weeks_On_List" int   NOT NULL,
    "Publisher" varchar   NOT NULL,
    "Description" varchar   NOT NULL,
    "List_Date" date   NOT NULL,
    "Rank_This_Week" int   NOT NULL,
    "Primary_ISBN_10" varchar,
    CONSTRAINT "uc_nyt_data_Primary_ISBN_13" UNIQUE (
        "Primary_ISBN_13"
    )
);
CREATE TABLE "bookxing_data" (
    "Primary_ISBN_13" varchar   NOT NULL,
    "book_id" int   NOT NULL,
    "original_title" varchar   NOT NULL,
    "original_publication_year" int   NOT NULL,
    "Primary_ISBN_10" varchar,
    CONSTRAINT "uc_bookxing_data_Primary_ISBN_13" UNIQUE (
        "Primary_ISBN_13"
    )
);
ALTER TABLE "ratings_data" ADD CONSTRAINT "fk_ratings_data_Primary_ISBN_13" FOREIGN KEY("Primary_ISBN_13")
REFERENCES "books_data" ("Primary_ISBN_13");

