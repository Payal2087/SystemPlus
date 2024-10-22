
# Bright_Horizons_Robot Framework Test Automation

This project contains test cases automated using Robot Framework and SeleniumLibrary.

## Prerequisites
- **Python** (Install Python 3.10 or higher )
- **Robot Framework** (install using `pip install robotframework`)
- **SeleniumLibrary** (install using `pip install robotframework-seleniumlibrary`)
- **Browser Drivers** (e.g., ChromeDriver, GeckoDriver)

## Setup
1. Clone the repository.
2. Install dependencies by running:
   ```bash
   pip install -r pip-requirements.txt
   ```

## Running Tests
Run the tests using the following command:
```bash
cd path\to\your\project
```

## Example Command
```bash
robot --outputdir results/ Test_Cases
```

## Folder Structure
- `Test Cases/`: Contains the Robot Framework test cases.
- `Resources/`:
	- `keywords/`: Custom keywords for reuse across test cases.
	- `variables/`: Files with common variables used across the tests.
	- `Other Resources/`: Files with custome keyword used across the tests.

---

