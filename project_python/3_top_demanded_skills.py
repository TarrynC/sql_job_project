# Get percentage each skill was requested to better uns=derstand the weighting
# Visualise the top 5 skills demanded for data analyst jobs  

import pandas as pd
import matplotlib.pyplot as plt
import os

df = pd.read_csv('csv_files\q3_top_demanded_skills.csv') 

df["percentage_skill_requested"] = df['demand_count']*100/df['demand_count'].sum()

print(df)

bar_chart = df.plot.barh(x='skills', y='demand_count')

directory = 'project_images'
if not os.path.exists(directory):
    os.makedirs(directory)

fig = bar_chart.get_figure()
file_path_bar = os.path.join(directory, 'q3_most_demanded_skills_bar.png')
fig = bar_chart.get_figure()
fig.savefig(file_path_bar)

plt.figure(figsize=(8, 8))
plt.pie(df['demand_count'], labels=df['skills'], autopct='%1.1f%%', startangle=140)
plt.title('Distribution of Skills')
plt.axis('equal')
file_path_pie = os.path.join(directory, 'q3_most_demanded_skills_pie.png')
plt.savefig(file_path_pie)