package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.custom.CustomerRepositoryCustom;
import com.laptrinhjavaweb.utils.ValidateUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<CustomerEntity> findAll(CustomerSearchBuilder builder, Long staffId) {
        StringBuilder sql = new StringBuilder(
                "select * from customer as c");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildSpecialQueryBuilder(builder, joinQuery, whereQuery, staffId);
        buildNormalQueryBuilder(builder, whereQuery);
        sql.append(joinQuery).append(" where 1 = 1 ").append(whereQuery).append(" group by c.id");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    private void buildNormalQueryBuilder(CustomerSearchBuilder builder, StringBuilder whereQuery) {
        Field[] fields = CustomerSearchBuilder.class.getDeclaredFields();
        try {
            for (Field field : fields) {
                field.setAccessible(true);
                String fileName = field.getName();
                if (!fileName.equals("staffId")) {
                    Object objectValue = field.get(builder);
                    if (ValidateUtils.isValid(objectValue)) {
                        if (objectValue instanceof String) {
                            whereQuery.append(" and c." + fileName.toLowerCase() + " like '%" + objectValue + "%'");
                        } else if (objectValue instanceof Integer) {
                            whereQuery.append(" and c." + fileName.toLowerCase() + " = " + objectValue + "");
                        }
                    }
                }
            }
        } catch (IllegalAccessException e) {
            System.out.println(e.getMessage());
        }
    }

    private void buildSpecialQueryBuilder(CustomerSearchBuilder builder, StringBuilder joinQuery, StringBuilder whereQuery, Long staff) {
        Long staffId = builder.getStaffId();

        if (staff != null) {
            joinQuery.append(" inner join assignmentcustomer as ac on ac.customerid = c.id"
                    + " inner join user as us on ac.staffid  = us.id");
            whereQuery.append("and us.id = " + staff);
        }

        if (ValidateUtils.isValid(staffId)) {
            joinQuery.append(" inner join assignmentcustomer as ac on ac.customerid = c.id"
                    + " inner join user as us on ac.staffid  = us.id");
            whereQuery.append("and us.id = " + staffId);
        }
    }
}
