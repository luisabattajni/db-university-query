-- esercizio 15 dicembre 


-- * Selezionare tutti gli studenti nati nel 1990 
SELECT * FROM students WHERE YEAR(date_of_birth) = 1990;

-- * Selezionare tutti i corsi che valgono più di 10 crediti
SELECT * FROM courses WHERE cfu > 10;

-- * Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM students WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

-- * Selezionare tutti i corsi di laurea magistrale
-- quindi deg level magistrale
SELECT * FROM `degrees` WHERE `level` = 'magistrale';

-- * Da quanti dipartimenti è composta l’università?
SELECT COUNT(*) as numero_dipartimenti FROM departments;

-- * Quanti sono gli insegnanti che non hanno un numero di telefono?
SELECT COUNT(*) as numero_insegnanti_senza_telefono FROM teachers WHERE phone IS NULL;

-- * Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) as year_of_enrolment, COUNT(id) as numero_studenti 
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY year_of_enrolment;


-- 8. * Calcolare la media dei voti di ogni appello d’esame
SELECT e.id , AVG(vote) as media_voti
FROM exams e
INNER JOIN exam_student es ON e.id = es.exam_id
GROUP BY e.id;


-- 9. * Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT d2.name, COUNT(d.id) as numero_corsidilaurea
FROM `degrees` d 
INNER JOIN departments d2 ON d.department_id = d2.id
GROUP BY d2.id;

-- 10. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * 
FROM students 
INNER JOIN `degrees` d ON students.degree_id = d.id
WHERE d.name = 'Corso di Laurea in Economia';

-- 11. * Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `degrees` d
INNER JOIN departments d2 ON d.department_id = d2.id
WHERE d.`level` = 'magistrale' AND d2.name = 'Dipartimento di Neuroscienze';

-- 12. * Selezionare tutti i corsi in cui insegna Fulvio Amato
SELECT *
FROM courses c 
INNER JOIN course_teacher ct ON c.id = ct.course_id 
INNER JOIN teachers t ON t.id = ct.teacher_id 
WHERE t.name = 'Fulvio' AND t.surname = 'Amato';

-- 13. * Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono 
-- iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT *
FROM students s 
INNER JOIN `degrees` d ON d.id = s.degree_id 
INNER JOIN departments d2 ON d2.id = d.department_id 
ORDER BY s.surname, s.name;

