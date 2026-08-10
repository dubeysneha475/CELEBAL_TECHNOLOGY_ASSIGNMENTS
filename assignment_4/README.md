# Azure Data Factory Pipeline using Azure Blob Storage

## Project Overview

This project demonstrates the implementation of an end-to-end data pipeline using Microsoft Azure services. The pipeline reads a CSV file from Azure Blob Storage, validates the file using the **Get Metadata** activity, and copies it to a destination location using the **Copy Data** activity in Azure Data Factory.

---

## Objective

- Understand Azure cloud concepts and Azure Data Factory.
- Create and configure Azure Storage Account and Blob Container.
- Build an end-to-end data pipeline.
- Validate file metadata before copying data.
- Execute and monitor the pipeline successfully.

---

## Azure Services Used

- Azure Resource Group
- Azure Storage Account
- Azure Blob Storage
- Azure Data Factory (ADF)
- Linked Service
- Source Dataset
- Destination Dataset
- Get Metadata Activity
- Copy Data Activity
- Azure IAM

---

## Project Architecture

```
Azure Blob Storage (Source)
          │
          ▼
   Get Metadata Activity
          │
          ▼
    Copy Data Activity
          │
          ▼
Azure Blob Storage (Destination)
```

---

## Implementation Steps

1. Created an Azure Resource Group.
2. Created an Azure Storage Account.
3. Created a Blob Container.
4. Uploaded the Superstore CSV dataset.
5. Created Azure Data Factory.
6. Configured the Blob Storage Linked Service.
7. Created Source and Destination Datasets.
8. Added the Get Metadata activity.
9. Added the Copy Data activity.
10. Executed the pipeline successfully.
11. Verified the output file in the destination container.
12. Assigned the Reader role to Azure Data Factory for storage access.

---

## Project Output

- Successfully connected Azure Blob Storage with Azure Data Factory.
- Retrieved file metadata using Get Metadata.
- Executed the pipeline successfully.
- Copied the CSV file to the destination folder.
- Verified the output file in Azure Blob Storage.


## Learning Outcomes

- Learned the basics of Azure Data Factory.
- Configured Linked Services and Datasets.
- Connected Azure Blob Storage with Azure Data Factory.
- Used the Get Metadata activity for file validation.
- Built and executed an end-to-end data pipeline.
- Understood Azure IAM role assignments.

---

## Author

**Sneha Dubey**  
B.Tech – Artificial Intelligence & Machine Learning  
DIT University

---

## Conclusion

This project successfully demonstrated the development of an end-to-end data pipeline using Azure Blob Storage and Azure Data Factory. The pipeline validated file metadata, copied the source CSV file to the destination location, and executed successfully. The project provided practical experience with Azure cloud services, data integration, pipeline orchestration, and access management.