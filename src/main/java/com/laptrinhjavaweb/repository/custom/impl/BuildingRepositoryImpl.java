package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.utils.ValidateUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<BuildingEntity> findAll(Map<String, Object> validParams, List<String> types) {
        StringBuilder sql = new StringBuilder(
                "select * from building as b");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildSpecialQuery(validParams, joinQuery, whereQuery, types);
        buildNormalQuery(validParams, whereQuery);
        sql.append(joinQuery).append(" where 1 = 1 ").append(whereQuery).append(" group by b.id");
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    private void buildSpecialQuery(Map<String, Object> validParams, StringBuilder joinQuery, StringBuilder whereQuery,
                                   List<String> types) {
        Integer rentAreaFrom = (Integer) validParams.getOrDefault("areaRentFrom", null);
        Integer rentAreaTo = (Integer) validParams.getOrDefault("areaRentTo", null);
        Integer rentpriceFrom = (Integer) validParams.getOrDefault("costRentFrom", null);
        Integer rentpriceTo = (Integer) validParams.getOrDefault("costRentTo", null);
        String assigmentName = (String) validParams.getOrDefault("userName", null);

        if (ValidateUtils.isValid(rentAreaFrom) || ValidateUtils.isValid(rentAreaTo)) {
            joinQuery.append(" inner join rentarea ra e on b.id = ra.buildingid ");
            if (ValidateUtils.isValid(rentAreaFrom)) {
                whereQuery.append(" and ra.value >= " + rentAreaFrom);
            }
            if (ValidateUtils.isValid(rentAreaTo)) {
                whereQuery.append(" and ra.value <= " + rentAreaTo);
            }
        }

        if (ValidateUtils.isValid(rentpriceFrom) || ValidateUtils.isValid(rentpriceTo)) {
            if (ValidateUtils.isValid(rentpriceFrom)) {
                whereQuery.append(" and b.rentprice >= " + rentpriceFrom);
            }
            if (ValidateUtils.isValid(rentpriceTo)) {
                whereQuery.append(" and b.rentprice <= " + rentpriceTo);
            }
        }

        if (ValidateUtils.isValid(assigmentName)) {
            joinQuery.append(" inner join assignmentbuilding as ab on ab.buildingid = b.id"
                    + " inner join user as us on ab.staffid  = us.id");
            whereQuery.append("and us.username like '%" + assigmentName + "%'");
        }
    }

    private void buildNormalQuery(Map<String, Object> validParams, StringBuilder whereQuery) {
        for (Map.Entry<String, Object> entry : validParams.entrySet()) {
            String key = entry.getKey();
            if (!key.startsWith("costRent") && !key.startsWith("areaRent") && !key.equals("username")) {
                Object value = entry.getValue();
                if (value instanceof String) {
                    whereQuery.append(" and b." + key.toLowerCase() + " like '%" + value + "%'");
                } else if (value instanceof Integer) {
                    whereQuery.append(" and b." + key.toLowerCase() + " = " + value + "");
                }
            }
        }
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder builder, Long staffId) {
        StringBuilder sql = new StringBuilder(
                "select * from building as b");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildSpecialQueryBuilder(builder, joinQuery, whereQuery, staffId);
        buildNormalQueryBuilder(builder, whereQuery);
        sql.append(joinQuery).append(" where 1 = 1 ").append(whereQuery).append(" group by b.id");
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }


    private void buildSpecialQueryBuilder(BuildingSearchBuilder builder, StringBuilder joinQuery, StringBuilder whereQuery, Long staffId) {
        Integer rentAreaFrom = builder.getAreaRentFrom();
        Integer rentAreaTo = builder.getAreaRentTo();
        Integer rentpriceFrom = builder.getCostRentFrom();
        Integer rentpriceTo = builder.getCostRentTo();
        Long assigmentName = builder.getStaffId();
        List<String> types = builder.getType();

        if (staffId != null) {
            joinQuery.append(" inner join assignmentbuilding as ab on ab.buildingid = b.id"
                    + " inner join user as us on ab.staffid  = us.id");
            whereQuery.append("and us.id = " + staffId);
        }

        if (ValidateUtils.isValid(rentAreaFrom) || ValidateUtils.isValid(rentAreaTo)) {
            joinQuery.append(" inner join rentarea as ra on b.id = ra.buildingid ");
            if (ValidateUtils.isValid(rentAreaFrom)) {
                whereQuery.append(" and ra.value >= " + rentAreaFrom);
            }
            if (ValidateUtils.isValid(rentAreaTo)) {
                whereQuery.append(" and ra.value <= " + rentAreaTo);
            }
        }

        if (ValidateUtils.isValid(rentpriceFrom) || ValidateUtils.isValid(rentpriceTo)) {
            if (ValidateUtils.isValid(rentpriceFrom)) {
                whereQuery.append(" and b.rentprice >= " + rentpriceFrom);
            }
            if (ValidateUtils.isValid(rentpriceTo)) {
                whereQuery.append(" and b.rentprice <= " + rentpriceTo);
            }
        }

        if (ValidateUtils.isValid(assigmentName)) {
            joinQuery.append(" inner join assignmentbuilding as ab on ab.buildingid = b.id"
                    + " inner join user as us on ab.staffid  = us.id");
            whereQuery.append("and us.id = " + assigmentName);
        }

        if (ValidateUtils.isValid(types) && types.size() > 0) {
            whereQuery.append(" and (");
            String sqlType = types.stream().map(item -> " b.type like '%" + item + "%'")
                    .collect(Collectors.joining(" or "));
            whereQuery.append(sqlType);
            whereQuery.append(")");
        }
    }

    private void buildNormalQueryBuilder(BuildingSearchBuilder builder, StringBuilder whereQuery) {
        Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
        try {
            for (Field field : fields) {
                field.setAccessible(true);
                String fileName = field.getName();
                if (!fileName.startsWith("costRent") && !fileName.startsWith("areaRent") && !fileName.equals("staffId")
                        && !fileName.equals("type")) {
                    Object objectValue = field.get(builder);
                    if (ValidateUtils.isValid(objectValue)) {
                        if (objectValue instanceof String) {
                            whereQuery.append(" and b." + fileName.toLowerCase() + " like '%" + objectValue + "%'");
                        } else if (objectValue instanceof Integer) {
                            whereQuery.append(" and b." + fileName.toLowerCase() + " = " + objectValue + "");
                        }
                    }
                }
            }
        } catch (IllegalAccessException e) {
            System.out.println(e.getMessage());
        }
    }
}
