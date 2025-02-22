/// File is generated from https://studio.fabbuilder.com - department

export default (app) => {
  app.post(
    `/tenant/:tenantId/department`,
    require('./departmentCreate').default,
  );
  app.put(
    `/tenant/:tenantId/department/:id`,
    require('./departmentUpdate').default,
  );
  app.post(
    `/tenant/:tenantId/department/import`,
    require('./departmentImport').default,
  );
  app.delete(
    `/tenant/:tenantId/department`,
    require('./departmentDestroy').default,
  );
  app.get(
    `/tenant/:tenantId/department/autocomplete`,
    require('./departmentAutocomplete').default,
  );
  app.get(
    `/tenant/:tenantId/department/count`,
    require('./departmentCount').default,
  );
  app.get(
    `/tenant/:tenantId/department`,
    require('./departmentList').default,
  );
  app.get(
    `/tenant/:tenantId/department/:id`,
    require('./departmentFind').default,
  );
};
/// File is generated from https://studio.fabbuilder.com - department
