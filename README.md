# Ordira

Ordira adalah sebuah proyek (nama sementara) yang terdiri dari
**frontend**, **backend API**, dan **database** yang berjalan
menggunakan Docker. Proyek ini dikembangkan dalam repository
`rikiulirniam/Ordira` dan dirancang sebagai sistem modular yang mudah
dijalankan dan dikembangkan.

## 📌 Ringkasan

Ordira merupakan aplikasi berbasis web yang dibangun menggunakan
arsitektur tiga layanan:\
- **Ordira-Client** --- frontend (React)
- **Ordira-API** --- backend (Node.js / Express / Prisma)
- **db-ordira** --- database PostgreSQL

Tujuan proyek: - Menyediakan struktur proyek yang rapi untuk
pengembangan aplikasi modern. - Menggunakan Docker sebagai fondasi
deployment agar mudah dibangun di berbagai lingkungan.

## 🚀 Fitur

-   Frontend terpisah dengan build sendiri.
-   Backend modular dengan Prisma ORM.
-   Integrasi database PostgreSQL melalui Docker.
-   Environment multilayer: frontend, backend, dan root environment.
-   Orkestrasi service menggunakan Docker Compose.

## 🛠️ Tumpukan Teknologi

-   **Frontend:** React (Ordira-Client)
-   **Backend:** Node.js, Express, Prisma ORM (Ordira-API)
-   **Database:** PostgreSQL 17
-   **Containerization:** Docker & Docker Compose
-   **Version Control:** Git & GitHub

## 📂 Struktur Proyek

    Ordira/
    ├── Ordira-Client/              # Frontend React
    ├── Ordira-API/                 # Backend Node.js / Express / Prisma
    ├── db/                         # SQL init files untuk Postgres
    ├── docker-compose.yml
    └── README.md

## ⚙️ Instalasi & Menjalankan Proyek

### 1️⃣ Clone Repository

``` bash
git clone https://github.com/rikiulirniam/Ordira.git
cd Ordira

# Cloning Repository Frontend
git clone https://github.com/Maulanaputra07/Ordira-Client.git

# Cloning Repository Backend
git clone https://github.com/rikiulirniam/Ordira-API.git
```

### 2️⃣ Konfigurasi Environment

Pastikan file `.env` tersedia di masing-masing folder.


#### 📌 Root .env (untuk database)

    DB_USER=postgres
    DB_PASS=yourpassword
    DB_NAME=ordira

### 3️⃣ Menjalankan Menggunakan Docker Compose

Jalankan semua service:

``` bash
docker compose up --build -d
```
```
Service yang berjalan:

  Service         Port Lokal    Deskripsi
  --------------- ------------- -------------
  ordira-client   7000 → 80     Frontend
  ordira-api      7001 → 3000   Backend API
  db-ordira       Internal      PostgreSQL
```
Cek container:

``` bash
docker ps
```

Stop:

``` bash
docker compose down
```

## 🗄️ Database Initialization
Folder `db/` berisi file `init.sql` yang akan otomatis dijalankan oleh
PostgreSQL saat container pertama kali dibuat.

### Isi file : 
```sql
CREATE ROLE your_username WITH LOGIN PASSWORD 'your_password';
CREATE DATABASE db_ordira OWNER your_username;
GRANT ALL PRIVILEGES ON DATABASE db_ordira TO your_username;
```

- Membuat user baru (`your_username`)
- Membuat database baru (`db_ordira`)
- Memberikan semua privileges ke user tersebut


## 🐳 Detail Service Docker Compose

### **ordira-client**

-   Build dari `Ordira-Client`
-   Menggunakan environment `Ordira-Client/.env`
-   Port publik: **7000**

### **ordira-api**

-   Build dari `Ordira-API`
-   Menggunakan environment `Ordira-API/.env`
-   Port publik: **7001**

### **db-ordira**

-   Image: `postgres:17.2`
-   Environment dari root `.env`
-   Volume: `ordira-storage`
-   Auto-load file SQL dari folder `db/`

## ▶️ Contoh Penggunaan API
```bash
# Request
curl -X POST http://localhost:7001/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'

# Response
{
    "status": "success",
    "message": "Logged in",
    "data": {
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9....
```
## 🧪 Testing

### Backend

``` bash
cd Ordira-API
npm test
```

### Frontend

``` bash
cd Ordira-Client
npm lint
```

## 🤝 Kontribusi

1.  Fork repository
2.  Buat branch baru

``` bash
git checkout -b feat/nama-fitur
```

3.  Commit perubahan

``` bash
git commit -m "feat: menambahkan fitur X"
```

4.  Push

``` bash
git push origin feat/nama-fitur
```

5.  Buat Pull Request ke GitHub

## 📄 Lisensi

Proyek ini menggunakan lisensi **MIT License**.

## 📬 Kontak

Maintainer: **rikiulirniam**