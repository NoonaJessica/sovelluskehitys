CREATE USER 'myusername'@'localhost' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON `MediaSharingApp`.* TO 'mediashare'@'localhost';
FLUSH PRIVILEGES;

