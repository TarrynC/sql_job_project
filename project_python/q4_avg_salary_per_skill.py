# Put average salary per skill into df to easily access the index of each skill

import pandas as pd

df = pd.read_csv('csv_files\q4_avg_salary_per_skill.csv') 

print(df.head())

print(df[df["skills"] == "python"])
print(df[df["skills"] == "sql"])
print("Top skill: \n {}  ".format(df.iloc[0]))
