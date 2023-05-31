package com.laptrinhjavaweb.repository.custom.impl;


import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.custom.UserRepositoryCustom;
import com.laptrinhjavaweb.utils.ValidateUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class UserRepositoryCustomImpl implements UserRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<UserEntity> findByAssignmentBuilding_building(Long buildingId) {
        StringBuilder sql = new StringBuilder("SELECT * FROM user as u");
        sql = buildJoinQuery(buildingId, sql);
        sql.append(" where 1 = 1");
        sql = buildNormalQuery(buildingId, sql);
        sql.append(" group by u.id");
        sql.append(" ORDER BY u.fullname");
        Query query = entityManager.createNativeQuery(sql.toString(), UserEntity.class);
        return query.getResultList();
    }

    private StringBuilder buildNormalQuery(Long buildingId, StringBuilder sql) {
        if (ValidateUtils.isValid(buildingId)) {
            sql.append(" and ab.buildingid = " + buildingId);
        }
        return sql;
    }

    private StringBuilder buildJoinQuery(Long buildingId, StringBuilder sql) {
        if (ValidateUtils.isValid(buildingId)) {
            sql.append(" inner join assignmentbuilding as ab on u.id = ab.staffid");
        }
        return sql;
    }
}

