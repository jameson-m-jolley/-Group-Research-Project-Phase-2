-- schema_management.sql

-- Script to create and drop the database schema


DROP DATABASE IF EXISTS `your_social_network`;
CREATE DATABASE IF NOT EXISTS `your_social_network`;

-- Select the database to operate on
USE `your_social_network`;

-- Drop existing tables if they exist (for easy re-running within the selected database)
DROP TABLE IF EXISTS Friendships;
DROP TABLE IF EXISTS Users;

-- Create the Users table
CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL
    -- Add other user-related columns as needed, e.g.,
    -- email VARCHAR(255) UNIQUE,
    -- created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Friendships table to represent connections between users
CREATE TABLE Friendships (
    user_id INT,
    friend_id INT,
    PRIMARY KEY (user_id, friend_id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (friend_id) REFERENCES Users(id),
    -- Ensure that (friend_id, user_id) is also unique to represent an undirected friendship
    UNIQUE KEY unique_friendship (friend_id, user_id)
);

-- Insert some sample users (if not already present - though the previous script should handle this)
INSERT IGNORE INTO Users (username) VALUES
('alpha_one'), ('beta_two'), ('gamma_three'), ('delta_four'), ('epsilon_five'),
('zeta_six'), ('gamma_seven'), ('eta_eight'), ('theta_nine'), ('iota_ten'),
('kappa_twelve'), ('lambda_eleven'), ('mu_thirteen'), ('nu_fourteen'), ('omicron_fifteen'),
('pi_sixteen'), ('rho_nineteen'), ('sigma_eighteen'), ('tau_twentytwo'), ('upsilon_twentyfive'),
('phi_thirtyone'), ('chi_thirtythree'), ('psi_seventyeight'), ('omega_fiftyfive'), ('omega_twentyeight'),
('omega_thirtyeight'), ('upsilon_fortyfour'), ('chi_sixty_two'), ('psi_twentynine'), ('tau_twentyfour'),
('kappa_fortyone'), ('phi_thirtyfive'), ('sigma_twentyone');

-- Insert some sample friendships
INSERT IGNORE INTO Friendships (user_id, friend_id) VALUES
((SELECT id FROM Users WHERE username = 'alpha_one'), (SELECT id FROM Users WHERE username = 'gamma_seven')),
((SELECT id FROM Users WHERE username = 'alpha_one'), (SELECT id FROM Users WHERE username = 'kappa_twelve')),
((SELECT id FROM Users WHERE username = 'alpha_one'), (SELECT id FROM Users WHERE username = 'omega_fiftyfive')),
((SELECT id FROM Users WHERE username = 'beta_two'), (SELECT id FROM Users WHERE username = 'epsilon_five')),
((SELECT id FROM Users WHERE username = 'beta_two'), (SELECT id FROM Users WHERE username = 'sigma_eighteen')),
((SELECT id FROM Users WHERE username = 'gamma_three'), (SELECT id FROM Users WHERE username = 'alpha_one')),
((SELECT id FROM Users WHERE username = 'gamma_three'), (SELECT id FROM Users WHERE username = 'iota_ten')),
((SELECT id FROM Users WHERE username = 'gamma_three'), (SELECT id FROM Users WHERE username = 'tau_twentytwo')),
((SELECT id FROM Users WHERE username = 'gamma_three'), (SELECT id FROM Users WHERE username = 'psi_seventyeight')),
((SELECT id FROM Users WHERE username = 'epsilon_five'), (SELECT id FROM Users WHERE username = 'beta_two')),
((SELECT id FROM Users WHERE username = 'epsilon_five'), (SELECT id FROM Users WHERE username = 'theta_nine')),
((SELECT id FROM Users WHERE username = 'epsilon_five'), (SELECT id FROM Users WHERE username = 'phi_thirtyone')),
((SELECT id FROM Users WHERE username = 'zeta_six'), (SELECT id FROM Users WHERE username = 'omicron_fifteen')),
((SELECT id FROM Users WHERE username = 'gamma_seven'), (SELECT id FROM Users WHERE username = 'alpha_one')),
((SELECT id FROM Users WHERE username = 'gamma_seven'), (SELECT id FROM Users WHERE username = 'lambda_eleven')),
((SELECT id FROM Users WHERE username = 'gamma_seven'), (SELECT id FROM Users WHERE username = 'upsilon_fortyfour')),
((SELECT id FROM Users WHERE username = 'gamma_seven'), (SELECT id FROM Users WHERE username = 'chi_sixty_two')),
((SELECT id FROM Users WHERE username = 'theta_nine'), (SELECT id FROM Users WHERE username = 'epsilon_five')),
((SELECT id FROM Users WHERE username = 'theta_nine'), (SELECT id FROM Users WHERE username = 'rho_nineteen')),
((SELECT id FROM Users WHERE username = 'iota_ten'), (SELECT id FROM Users WHERE username = 'gamma_three')),
((SELECT id FROM Users WHERE username = 'iota_ten'), (SELECT id FROM Users WHERE username = 'pi_sixteen')),
((SELECT id FROM Users WHERE username = 'iota_ten'), (SELECT id FROM Users WHERE username = 'omega_twentyeight')),
((SELECT id FROM Users WHERE username = 'kappa_twelve'), (SELECT id FROM Users WHERE username = 'gamma_seven')),
((SELECT id FROM Users WHERE username = 'lambda_eleven'), (SELECT id FROM Users WHERE username = 'alpha_one')),
((SELECT id FROM Users WHERE username = 'lambda_eleven'), (SELECT id FROM Users WHERE username = 'upsilon_twentyfive')),
((SELECT id FROM Users WHERE username = 'nu_fourteen'), (SELECT id FROM Users WHERE username = 'sigma_twentyone')),
((SELECT id FROM Users WHERE username = 'nu_fourteen'), (SELECT id FROM Users WHERE username = 'chi_thirtythree')),
((SELECT id FROM Users WHERE username = 'omicron_fifteen'), (SELECT id FROM Users WHERE username = 'zeta_six')),
((SELECT id FROM Users WHERE username = 'omicron_fifteen'), (SELECT id FROM Users WHERE username = 'psi_twentynine')),
((SELECT id FROM Users WHERE username = 'pi_sixteen'), (SELECT id FROM Users WHERE username = 'iota_ten')),
((SELECT id FROM Users WHERE username = 'tau_twentytwo'), (SELECT id FROM Users WHERE username = 'tau_twentyfour')),
((SELECT id FROM Users WHERE username = 'tau_twentytwo'), (SELECT id FROM Users WHERE username = 'omega_thirtyeight')),
((SELECT id FROM Users WHERE username = 'upsilon_twentyfive'), (SELECT id FROM Users WHERE username = 'beta_two')),
((SELECT id FROM Users WHERE username = 'upsilon_twentyfive'), (SELECT id FROM Users WHERE username = 'phi_thirtyfive')),
((SELECT id FROM Users WHERE username = 'phi_thirtyone'), (SELECT id FROM Users WHERE username = 'theta_nine')),
((SELECT id FROM Users WHERE username = 'phi_thirtyone'), (SELECT id FROM Users WHERE username = 'kappa_fortyone')),
((SELECT id FROM Users WHERE username = 'chi_thirtythree'), (SELECT id FROM Users WHERE username = 'gamma_seven')),
((SELECT id FROM Users WHERE username = 'psi_seventyeight'), (SELECT id FROM Users WHERE username = 'alpha_one')),
((SELECT id FROM Users WHERE username = 'psi_seventyeight'), (SELECT id FROM Users WHERE username = 'upsilon_twentyfive')),
((SELECT id FROM Users WHERE username = 'omega_fiftyfive'), (SELECT id FROM Users WHERE username = 'sigma_twentyone')),
((SELECT id FROM Users WHERE username = 'omega_fiftyfive'), (SELECT id FROM Users WHERE username = 'chi_thirtythree')),
((SELECT id FROM Users WHERE username = 'omega_twentyeight'), (SELECT id FROM Users WHERE username = 'zeta_six')),
((SELECT id FROM Users WHERE username = 'omega_twentyeight'), (SELECT id FROM Users WHERE username = 'psi_twentynine')),
((SELECT id FROM Users WHERE username = 'upsilon_fortyfour'), (SELECT id FROM Users WHERE username = 'iota_ten')),
((SELECT id FROM Users WHERE username = 'chi_sixty_two'), (SELECT id FROM Users WHERE username = 'tau_twentyfour')),
((SELECT id FROM Users WHERE username = 'chi_sixty_two'), (SELECT id FROM Users WHERE username = 'omega_thirtyeight')),
((SELECT id FROM Users WHERE username = 'psi_twentynine'), (SELECT id FROM Users WHERE username = 'beta_two')),
((SELECT id FROM Users WHERE username = 'psi_twentynine'), (SELECT id FROM Users WHERE username = 'phi_thirtyfive')),
((SELECT id FROM Users WHERE username = 'tau_twentyfour'), (SELECT id FROM Users WHERE username = 'theta_nine')),
((SELECT id FROM Users WHERE username = 'tau_twentyfour'), (SELECT id FROM Users WHERE username = 'kappa_fortyone')),
((SELECT id FROM Users WHERE username = 'kappa_twelve'), (SELECT id FROM Users WHERE username = 'gamma_seven')),
((SELECT id FROM Users WHERE username = 'lambda_eleven'), (SELECT id FROM Users WHERE username = 'alpha_one')),
((SELECT id FROM Users WHERE username = 'lambda_eleven'), (SELECT id FROM Users WHERE username = 'upsilon_twentyfive')),
((SELECT id FROM Users WHERE username = 'sigma_twentyone'), (SELECT id FROM Users WHERE username = 'gamma_seven')),
((SELECT id FROM Users WHERE username = 'chi_thirtythree'), (SELECT id FROM Users WHERE username = 'gamma_seven')),
((SELECT id FROM Users WHERE username = 'zeta_six'), (SELECT id FROM Users WHERE username = 'psi_twentynine')),
((SELECT id FROM Users WHERE username = 'iota_ten'), (SELECT id FROM Users WHERE username = 'gamma_seven')),
((SELECT id FROM Users WHERE username = 'tau_twentyfour'), (SELECT id FROM Users WHERE username = 'omega_thirtyeight')),
((SELECT id FROM Users WHERE username = 'beta_two'), (SELECT id FROM Users WHERE username = 'phi_thirtyfive')),
((SELECT id FROM Users WHERE username = 'theta_nine'), (SELECT id FROM Users WHERE username = 'kappa_fortyone'));

