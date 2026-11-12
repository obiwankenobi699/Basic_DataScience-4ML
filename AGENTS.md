# AGENTS.md — Basic_DataScience-4ML

Learning-notebooks repo (NumPy, Pandas, SQLite SQL). No app, no build, no tests, no lint/typecheck, no CI.

## Setup
- Python pinned by `.python-version`: `3.10.13`. A prebuilt env exists at `.venv/`; prefer `.venv/bin/python` / `.venv/bin/jupyter` over system python.
- Install: `pip install -r requirements.txt` (notebooks need `numpy<2.0`, `pandas>=2.2`, `ydata-profiling`, `scikit-learn`, `seaborn`, `matplotlib`).
- Run: `.venv/bin/jupyter lab` from repo root. Start with `numpy/Phase_1.ipynb`.

## Layout (filesystem is truth — README tree is stale)
- `numpy/`, `pandas/`, `sql/*.sql`, `data visualization/`, `data prepare/{EDA,Preprocessing,Feature enginerring}/`, `Projects/`, `assets/data/*.csv`, `rough.ipynb` (root scratch).
- Actual names differ from README: `Feature enginerring` is misspelled (keep as-is), `pandas/` has an extra `phase_4.ipynb`, `Feature enginerring/` has `phase_1–12` (incl. untracked `phase_12.ipynb`), phase filename case is inconsistent (`Phase_1` vs `phase_2`).
- Quote paths with spaces in shell: `"data prepare/EDA/phase_1.ipynb"`.

## Gotchas
- Many notebooks hardcode absolute dataset paths (`C:\Basic_Datascience_4ML\...`, `/home/mukul/Main/...`, `/assets/data/...`) that break on other machines. Fix by pointing to repo-relative `assets/data/*.csv` (all datasets live there) — do not commit machine-specific paths.
- `sql/` files are plain SQLite-dialect scripts with no live DB wired up; test via `sqlite3 :memory:` or Python `sqlite3` in a notebook.
- Generated artifacts — don't hand-edit: `**/report.html` (ydata-profiling output), `**/boxplot.png`, `Projects/anime_csv_project/Cleaned_dataset.csv`, `data prepare/ml_workflow.dot`.
- `.ipynb_checkpoints/` dirs exist in repo; leave them alone (covered by `.gitignore`).
- Keep notebook outputs cleared for large profiling runs (`ydata-profiling` reports bloat diffs); commit the small `.html` report instead.
