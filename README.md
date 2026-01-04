# 📊 Telecom Customer Churn Prediction

## 📝 Project Overview
This project focuses on analyzing and predicting customer churn for a telecommunications company. By leveraging historical customer data, including demographics, service usage, and account information, we aim to identify key factors driving churn and build predictive models to retain at-risk customers.

The analysis is performed using **R**, utilizing powerful libraries for data manipulation, visualization, and machine learning.

## ✨ Key Features
*   **Data Integration**: Seamless merging of multiple datasets (`churn_data.csv`, `customer_data.csv`, `internet_data.csv`) to create a unified customer view.
*   **Comprehensive EDA**: In-depth Exploratory Data Analysis using `ggplot2` to uncover patterns in:
    *   **Demographics**: Gender, Senior Citizen status, Partners, Dependents.
    *   **Services**: Phone specific services, Internet services, Streaming, etc.
    *   **Account Information**: Contract type, Payment method, Monthly/Total charges.
*   **Data Preprocessing**: Handling missing values, data cleaning, and categorical variable transformation.
*   **Correlation Analysis**: Visualizing relationships between numerical variables (`TotalCharges`, `MonthlyCharges`, `tenure`).
*   **Predictive Modeling**: Implementation and comparison of multiple machine learning algorithms:
    *   **Decision Trees** (`rpart`)
    *   **Random Forest** (`randomForest`)
    *   **Logistic Regression** (`glm`)
*   **Model Evaluation**: Rigorous performance assessment using Confusion Matrices, Accuracy scores, and ROC analysis.

## 🛠️ Prerequisites & System Requirements
Ensure you have the following installed on your system:
*   **R**: Version 4.0.0 or higher recommended.
*   **RStudio** (Optional but recommended): For an integrated development environment.

### Required R Packages
The project relies on the following R libraries:
`plyr`, `rpart.plot`, `caret`, `gridExtra`, `tidyverse`, `rsample`, `e1071`, `GGally`, `data.table`, `readr`, `DT`, `ggplot2`, `dplyr`, `tidyr`, `corrplot`, `rms`, `MASS`, `ROCR`, `gplots`, `pROC`, `rpart`, `randomForest`, `ggpubr`.

## 🚀 Installation & Setup

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/yourusername/telecom-churn-prediction.git
    cd telecom-churn-prediction
    ```

2.  **Install Dependencies**
    We have provided a convenient script to install all necessary packages. Open R or RStudio and run:
    ```r
    source("install_dependencies.R")
    ```
    Alternatively, you can manually install packages via the console:
    ```r
    install.packages(c("tidyverse", "caret", "randomForest", "e1071", "rpart.plot", ...))
    ```

3.  **Prepare Data**
    Ensure the following CSV files are present in the project root directory:
    *   `churn_data.csv`
    *   `customer_data.csv`
    *   `internet_data.csv`

## 📂 Project Structure

```text
.
├── 📄 churn_data.csv           # Raw churn data
├── 📄 customer_data.csv        # Customer demographic data
├── 📄 internet_data.csv        # Internet service data
├── 📄 install_dependencies.R   # Script to install R libraries
├── 📄 README.md                # Project documentation
├── 📊 Telecom_Churn.R          # Main R analysis script
```

## 💻 Usage Instructions

1.  Open `Telecom_Churn.R` in RStudio.
2.  Set your working directory to the project folder (if not already set).
    ```r
    setwd("/path/to/telecom-churn-prediction")
    ```
3.  Run the script line-by-line or source the entire file to execute the analysis pipeline.
    *   The script will output various plots in the "Plots" pane.
    *   Model accuracy and confusion matrices will be printed to the console.

### Example Output
When running the **Random Forest** model section, you will see output similar to:

```text
Confusion Matrix and Statistics

          Reference
Prediction  No Yes
       No  1389 256
       Yes  157 298
                                          
               Accuracy : 0.8033          
                 95% CI : (0.7858, 0.82)
    No Information Rate : 0.7362          
    P-Value [Acc > NIR] : 1.354e-13       
                                          
                  Kappa : 0.4608 
```

## ⚠️ Common Errors & Troubleshooting

*   **File Not Found Error**:
    *   *Error*: `cannot open file 'churn_data.csv': No such file or directory`
    *   *Fix*: Ensure `setwd()` in line 2 of `Telecom_Churn.R` points to your actual project directory, or that your R session is running in the correct root folder.

*   **Package Missing**:
    *   *Error*: `there is no package called 'package_name'`
    *   *Fix*: Run `source("install_dependencies.R")` again to ensure all dependencies are installed.

## 🤝 Contribution
Contributions are welcome! If you'd like to improve the model accuracy or add new visualizations:
1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

## 📄 License
This project is open-source and available for educational purposes.