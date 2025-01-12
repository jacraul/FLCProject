import requests
from bs4 import BeautifulSoup
import pandas as pd

url = "https://www.scrapethissite.com/pages/forms/"
response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')
table = soup.find('table', {'class': 'table'})

columns = [header.text.strip() for header in table.find_all('th')]
data = []
for row in table.find_all('tr')[1:]:
    cells = row.find_all('td')
    if len(cells) > 0:
        data.append([cell.text.strip() for cell in cells])

df = pd.DataFrame(data, columns=columns)

df.to_excel('teams_data.xlsx', index=False)

df['City'] = df['Team Name'].apply(lambda x: x.split()[0])
teams_same_city = df.groupby('City')['Team Name'].apply(list).reset_index()

print("Teams from the same city:")
print(teams_same_city)

df['Wins'] = df['Wins'].astype(int)
sorted_teams = df.sort_values(by='Wins', ascending=False)['Team Name'].reset_index(drop=True)

print("\nTeams ordered by number of wins:")
print(sorted_teams)

def search_team(name):
    return df[df['Team Name'].str.contains(name, case=False, na=False)]

team_name = 'Toronto'
print(f"\nSearch results for '{team_name}':")
print(search_team(team_name))
