

- user(id,login,first_name,last_name,email,password,salt,is_active,#role_id)
- password_reset(id,email,token)
- role(id,name)

- media(id,path,extension,#user_id)

- article(id,title,content,date_ccreation,is_active,#author_id,#media_header) # media_header == id_media 
- course(id,name)
- article_media(id,#media_id,#article_id)
- cours(id,name)

- article_course(id,#article_id,course_id)

- comment(id,content, date_creation,is_active,#user_id,#article_id)

- log(id,date_modif,#user_id,#article_id)
- message(id,subject,content,date_send,date_receive,is_read,#user_sender_id, #user_receiver_id)
- 