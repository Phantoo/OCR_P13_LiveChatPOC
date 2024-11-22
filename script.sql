CREATE TABLE adresses (
  id INTEGER PRIMARY KEY,
  streetAdress TEXT NOT NULL,
  cityName TEXT NOT NULL,
  stateProvincename TEXT NOT NULL,
  countryName TEXT NOT NULL,
  postalCode TEXT NOT NULL
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  mainAdressId INTEGER NOT NULL REFERENCES adresses(id),
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  birthDate DATE NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE tickets (
  id INTEGER PRIMARY KEY,
  userId INTEGER NOT NULL REFERENCES users(id),
  name TEXT NOT NULL,
  content TEXT NOT NULL,
  status TEXT NOT NULL
);

CREATE TABLE messages (
  id INTEGER PRIMARY KEY,
  ticketId INTEGER NOT NULL REFERENCES tickets(id),
  content TEXT NOT NULL
);

CREATE TABLE agencies (
  id INTEGER PRIMARY KEY,
  adressId INTEGER NOT NULL REFERENCES adresses(id),
  name TEXT NOT NULL
);

CREATE TABLE vehicles (
  id INTEGER PRIMARY KEY,
  acrissCode TEXT NOT NULL,
  brandName TEXT NOT NULL,
  modelName TEXT NOT NULL,
  horsepower INTEGER NOT NULL,
  pricePerDay INTEGER NOT NULL
);

CREATE TABLE rentals (
  id INTEGER PRIMARY KEY,
  agencyId INTEGER NOT NULL REFERENCES agencies(id),
  vehicleId INTEGER NOT NULL REFERENCES vehicles(id)
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  userId INTEGER NOT NULL REFERENCES users(id),
  rentalId INTEGER NOT NULL REFERENCES rentals(id),
  orderDate DATE NOT NULL,
  startCity TEXT NOT NULL,
  endCity TEXT NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  status TEXT NOT NULL,
  totalPrice INTEGER NOT NULL
);