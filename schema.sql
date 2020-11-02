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