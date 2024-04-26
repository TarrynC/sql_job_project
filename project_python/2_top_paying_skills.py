import pandas as pd
import os

df = pd.read_csv('csv_files\q2_top_paying_job_skills_table.csv') 
 
print(df["skills"])

df_skills = df['skills'].value_counts().reset_index()

df_skills.columns = ['Skill', 'Frequency']
df_skills.set_index('Skill', inplace=True)

bar_chart = df_skills.plot.barh()

directory = 'project_images'
if not os.path.exists(directory):
    os.makedirs(directory)

fig = bar_chart.get_figure()
file_path = os.path.join(directory, 'q2_highest_paying_skills.png')
fig = bar_chart.get_figure()
fig.savefig(file_path)

print(df_skills)