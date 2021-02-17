/*
https://lms.upskilled.edu.au/blocks/configurable_reports/editcomp.php?id=296
*/
SELECT CONCAT( '<a target="_new" href="%%WWWROOT%%/course/view.php', char(63), 'id=', c.id, '">', c.shortname, '</a>' ) Course,
	cm.id Module_ID, REPLACE(l.intro, '<', '>') Label

FROM prefix_label l
JOIN prefix_course_modules cm ON cm.instance = l.id AND cm.course = l.course
-- Everything not archived
JOIN prefix_course c ON c.id = cm.course AND c.category NOT IN (50, 55, 236, 51, 257)

WHERE l.intro REGEXP '<script [a-zA-Z0-9\-_=".:/]{0,}.js"[a-zA-Z0-9\-_=".:/ ]{0,}><\/script>'