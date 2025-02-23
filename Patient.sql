INSERT INTO patient_details (patient_name, dob) VALUES ('RACY', 'Not Readable');
INSERT INTO treatment_details (patient_id, date, injection, exercise_therapy) VALUES (LAST_INSERT_ID(), 'NA', 'NO', 'NO');
INSERT INTO difficulty_ratings (patient_id, activity_name, difficulty_rating) VALUES (LAST_INSERT_ID(), 'Bending or Stooping', 5);
INSERT INTO difficulty_ratings (patient_id, activity_name, difficulty_rating) VALUES (LAST_INSERT_ID(), 'Putting on shoes', 5);
INSERT INTO difficulty_ratings (patient_id, activity_name, difficulty_rating) VALUES (LAST_INSERT_ID(), 'Sleeping', Unmarked);
INSERT INTO difficulty_ratings (patient_id, activity_name, difficulty_rating) VALUES (LAST_INSERT_ID(), 'Standing for an hour', 3);
INSERT INTO difficulty_ratings (patient_id, activity_name, difficulty_rating) VALUES (LAST_INSERT_ID(), 'Walking through a store', Unmarked);
INSERT INTO difficulty_ratings (patient_id, activity_name, difficulty_rating) VALUES (LAST_INSERT_ID(), 'Yard work', 3);
INSERT INTO difficulty_ratings (patient_id, activity_name, difficulty_rating) VALUES (LAST_INSERT_ID(), 'Picking up items off the floor', 1);
INSERT INTO pain_symptoms (patient_id, pain, numbness, tingling, burning, tightness) VALUES (LAST_INSERT_ID(), 0, 0, 0, 0, 0);
INSERT INTO medical_assistant_inputs (patient_id, blood_pressure, hr, weight, height, spo2, temperature, blood_glucose, respirations) VALUES (LAST_INSERT_ID(), 'NA', '_', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA');
