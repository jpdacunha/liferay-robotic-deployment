DO $$
BEGIN
  IF NOT EXISTS (
    SELECT FROM pg_database WHERE datname = 'rdlportal'
  ) THEN
    EXECUTE 'CREATE DATABASE rdlportal';
  END IF;
END $$;
