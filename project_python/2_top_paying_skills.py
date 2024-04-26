import pandas as pd

df = pd.read_csv('csv_files\q2_top_paying_job_skills_table.csv') 
 
print(df["skills"])

df_skills = df['skills'].value_counts().reset_index()

df_skills.columns = ['Skill', 'Frequency']
df_skills.set_index('Skill', inplace=True)

bar_chart = df_skills.plot.barh()
fig = bar_chart.get_figure()
fig.savefig("project_images\q2_highest_paying_skills")

print(df_skills)