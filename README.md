# 🏆 FIFA SQL Case Study Analysis

Welcome to my exploratory case study on FIFA player data using SQL! This project dives deep into player statistics, wage distributions, and country-level insights using structured query techniques.

---

## 📌 Project Overview

This analysis focuses on uncovering patterns within FIFA player data using SQL. It explores demographics, performance stats, wage dynamics, and more, with the goal of understanding football analytics through data.

**Tools Used:**
- MySQL Workbench
- CSV dataset (cleaned)
- Optional: Jupyter Notebook (for visualization)

---

## 📂 Dataset Information

- **Format:** CSV
- **Key Attributes:**
  - `ID`
  - `Name`
  - `Age`
  - `Nationality`
  - `Overall Rating`
  - `Potential_rating`
  - `Club`
  - `Value`
  - `Wage`
  - `Preferred Foot`
  - `Jersey_No, etc.

**Preprocessing Steps:**
- Cleaned special characters and encoding errors
- Converted height to inches, wage values to numerical format

---

## 🧠 Analytical Objectives

### Questions Explored:
- 👣 What is the distribution of preferred foot among players?
- 💰 How are wages distributed by country?
- 📊 What are the most common age groups and their average ratings?
- 🌍 Which countries have the highest-rated players?

---

## 📈 Insights & Interpretation
- 🦶 Right-footed players dominate with over 75% representation.
- 🎯 The peak age for highly rated players is between 26 and 30.
- 🔝 Players with an overall rating above 85 are distributed across fewer nationalities.

## 🚧 Challenges Faced
- Handling special characters during import
- Resolving date and numeric formatting issues
- Structuring queries for aggregated insights

## 🛠️ How to Run the Project
- Import the CSV file into MySQL Workbench.
- Create a database and table
- Execute the SQL queries in logical order (organized by theme in SQL file).

## 🔮 Future Work
- Integrate Python for advanced visualizations
- Build an interactive dashboard using React and Flask
- Extend analysis to team-level dynamics

## 🤝 Contributing
Got ideas or want to collaborate? Feel free to fork, clone, and suggest changes via pull requests.

Thank you for exploring my FIFA case study! ⚽

