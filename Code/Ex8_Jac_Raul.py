import requests
from bs4 import BeautifulSoup
import pandas as pd
import matplotlib.pyplot as plt

team_to_search = "Boston Bruins"  
url = "https://www.scrapethissite.com/pages/forms/"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")

table = soup.find("table", {"class": "table"})
rows = table.find_all("tr")[1:]  
data = []
for row in rows:
    cols = row.find_all("td")
    if cols and team_to_search in cols[0].text.strip():
        data.append({
            "Year": int(cols[1].text.strip()) if cols[1].text.strip().isdigit() else 0,
            "Wins": int(cols[2].text.strip()) if cols[2].text.strip().isdigit() else 0,
            "Losses": int(cols[3].text.strip()) if cols[3].text.strip().isdigit() else 0,
            "OT Losses": int(cols[4].text.strip()) if cols[4].text.strip().isdigit() else 0,
            "Win Percentage": float(cols[5].text.strip('%')) / 100 if cols[5].text.strip() else 0.0,
            "Goals For": int(cols[6].text.strip()) if cols[6].text.strip().isdigit() else 0,
            "Goals Against": int(cols[7].text.strip()) if cols[7].text.strip().isdigit() else 0,
            "Plus/Minus": int(cols[8].text.strip()) if cols[8].text.strip().isdigit() else 0
        })

df = pd.DataFrame(data)

if not df.empty:
    df.to_excel("boston_bruins_data.xlsx", index=False)
    df.to_csv("boston_bruins_data.csv", index=False)
    print(f"Data for {team_to_search} exported to 'boston_bruins_data.xlsx' and 'boston_bruins_data.csv'")
else:
    print(f"No data found for {team_to_search}")
    exit()

plt.figure(figsize=(10, 6))
x = df["Year"]
width = 0.35  
plt.bar(x - width/2, df["Wins"], width=width, label="Wins", color="cyan")
plt.bar(x + width/2, df["Losses"], width=width, label="Losses", color="magenta")

plt.title(f"{team_to_search} Win/Loss Statistics", fontsize=16)
plt.xlabel("Year", fontsize=12)
plt.ylabel("Number of Games", fontsize=12)
plt.xticks(x, rotation=45)
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()

plt.savefig("boston_bruins_wins_losses.png")
plt.show()
