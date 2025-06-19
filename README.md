# Fun Analytics: Wildlife Analysis on Saint Maarten

A data analysis project for exploring and visualizing wildlife observations on the Caribbean island of Saint Maarten.

## Project Overview

This project provides tools and tutorials for analyzing wildlife data from Saint Maarten, a beautiful Caribbean island known for its diverse ecosystem. Whether you're interested in tracking bird migrations, monitoring marine life, or studying the island's unique fauna, this toolkit will help you clean, analyze, and visualize your wildlife observations.

## Setup Instructions

This project uses `uv` for Python dependency management. Follow these steps to get started:

1. **Install uv** (if not already installed):
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. **Clone the repository**:
   ```bash
   git clone <your-repo-url>
   cd fun_analyitics
   ```

3. **Sync dependencies**:
   ```bash
   uv sync
   ```

4. **Activate the virtual environment**:
   ```bash
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

## Tutorial: Analyzing Wildlife on Saint Maarten

### Step 1: Prepare Your Data

Before analyzing wildlife observations, ensure your data is clean and well-structured. Follow the excellent guide on [cleaning data with Datasette](https://datasette.io/tutorials/clean-data) for best practices.

### Step 2: Common Wildlife Categories on Saint Maarten

Saint Maarten hosts various wildlife species:
- **Birds**: Brown Pelicans, Bananaquits, Caribbean Martins
- **Marine Life**: Sea Turtles, Dolphins, Tropical Fish
- **Land Animals**: Iguanas, Mongoose, Various Lizard Species

### Step 3: Basic Analysis Example

```python
import pandas as pd
import matplotlib.pyplot as plt

# Load your wildlife observation data
df = pd.read_csv('saint_maarten_wildlife.csv')

# Filter for specific species
pelicans = df[df['species'] == 'Brown Pelican']

# Analyze sighting patterns by location
sightings_by_location = pelicans.groupby('location').size()

# Visualize the data
sightings_by_location.plot(kind='bar')
plt.title('Brown Pelican Sightings by Location in Saint Maarten')
plt.xlabel('Location')
plt.ylabel('Number of Sightings')
plt.show()
```

### Step 4: Geographic Analysis

Saint Maarten's unique geography (Dutch and French sides) offers interesting analysis opportunities:

```python
# Analyze wildlife distribution between Dutch and French sides
df['side'] = df['location'].apply(lambda x: 'Dutch' if x in dutch_locations else 'French')
wildlife_by_side = df.groupby(['side', 'species']).size().unstack()
```

### Step 5: Seasonal Patterns

Track migration patterns and seasonal variations:

```python
# Convert date column to datetime
df['date'] = pd.to_datetime(df['date'])
df['month'] = df['date'].dt.month

# Analyze monthly patterns
monthly_sightings = df.groupby(['month', 'species']).size()
```

## Data Sources

- Local wildlife observation groups
- eBird (for bird observations)
- iNaturalist
- Local marine conservation organizations

## Contributing

We welcome contributions! Please see our contributing guidelines for more information.

## Resources

- [Datasette Tutorial: Clean Data](https://datasette.io/tutorials/clean-data) - Essential reading for data preparation
- [Saint Maarten Nature Foundation](https://naturefoundationsxm.org/)
- [Caribbean Birding Trail](https://www.caribbeanbirdingtrail.org/)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
