/// File is generated from https://studio.fabbuilder.com - project

export default (app) => {
  app.post(
    `/tenant/:tenantId/project`,
    require('./projectCreate').default,
  );
  app.put(
    `/tenant/:tenantId/project/:id`,
    require('./projectUpdate').default,
  );
  app.post(
    `/tenant/:tenantId/project/import`,
    require('./projectImport').default,
  );
  app.delete(
    `/tenant/:tenantId/project`,
    require('./projectDestroy').default,
  );
  app.get(
    `/tenant/:tenantId/project/autocomplete`,
    require('./projectAutocomplete').default,
  );
  app.get(
    `/tenant/:tenantId/project/count`,
    require('./projectCount').default,
  );
  app.get(
    `/tenant/:tenantId/project`,
    require('./projectList').default,
  );
  app.get(
    `/tenant/:tenantId/project/:id`,
    require('./projectFind').default,
  );
};
/// File is generated from https://studio.fabbuilder.com - project
