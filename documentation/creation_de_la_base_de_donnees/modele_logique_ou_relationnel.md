Ce modèle est issu de la transcription sour forme relationnelle du modèle conceptuel

<br/>

person(pk_person, name, gender, notes)

appellation(pk_appellation, pk_person, name, language. sources, notes)

birth(pk_birth, date, sources, fk_person, fk_place, notes)

death(pk_death, date, sources, fk_person, fk_place, notes)

publication(pk_publication, title, date, type, fk_person)

pursuit(pk_pursuit, fk_person, fk_organisation, fk_occupation, fk_publication, fk_place, begin date, end date, label)

pursuit_tag_(pk_pursuittag, fk_pursuit, fk_tag)

membership(pk_membership, fk_person, fk_organisation, fk_membership, date_begin, date_end, sources)

membership_type(pk_membershiptype, name, definition)

tag(pk_tag, name, definition, date_begin, date_end, fk_specializetag)

person-tag(pk_tags, fk_person, fk_tag, notes)

organisation(pk_organisation, name, fk_geographicalplace, date-creation, date_end, notes)

organisation_tag(pk_organisationtag, fk_organisation, fk_tag)

occupation(pk_occupation, name, definition, fk_specializes)

specializes_occupation(pk_specializes_occupation, fk_parent_occupation, fk_child_occupation, notes)

geographical_place(pk_geographicalplace, name, fk_geographical_place_type, longitude, latitude, notes)

geographical_place_type(pk_geographical_place_type, name, definition, fk_parent_geographical_place_type, notes) 