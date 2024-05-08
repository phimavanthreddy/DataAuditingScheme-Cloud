## Data Auditing Scheme for Cloud Storage: Secure and Efficient

### 1. Problem Definition

Cloud computing offers a distributed architecture utilizing virtualized computing resources, providing users control over resource allocation and release. However, storing data in third-party cloud systems poses risks to data confidentiality. While encryption ensures security, it limits data usability. Moreover, conducting audits by either the user or the cloud server is impractical due to various constraints. Therefore, there is a need for a data auditing system allowing an auditing authority to examine data without compromising confidentiality.

### 2. Limitations of Existing System

1. **Delegated Verifiability**: Users should delegate data auditing to a third party without compromising data confidentiality.
2. **Storage Authenticity**: Users should verify data correctness on cloud servers.
3. **Privacy Preserving**: Auditors should not recover audited data blocks, ensuring privacy.
4. **Batch Verification**: Auditors should conduct multiple data checks efficiently without overburdening the cloud server.

### 3. Proposed System

To address existing limitations, a robust public auditing protocol is proposed. Using a Third-Party Auditor (TPA), the system verifies cloud data correctness regularly or on demand while preventing data leakage. It ensures data integrity and secrecy throughout the auditing process.

### 4. Contributions

- **Collaboration with Prof. Dr. Suresh Rao Anamthathmakula**: Worked at TKR Center for Research and Development Center to model an efficient and safe technique for data integrity verification.
- **Performance Comparison**: Our strategy outperformed Wang et al. (2013) and Zhang and Dong (2016) in terms of overall computing efficiency while requiring less computational overhead.
- **Security Assurance**: The approach assures data integrity while also protecting against forging and replacement attacks without sacrificing the secrecy of stored data.
