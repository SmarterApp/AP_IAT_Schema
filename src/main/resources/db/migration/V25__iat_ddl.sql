-- Updating user emails to always be lowercase
update tims_user set email = LOWER(email);