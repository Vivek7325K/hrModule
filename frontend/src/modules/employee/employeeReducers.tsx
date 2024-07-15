import list from 'src/modules/employee/list/employeeListReducers';
import form from 'src/modules/employee/form/employeeFormReducers';
import view from 'src/modules/employee/view/employeeViewReducers';
import destroy from 'src/modules/employee/destroy/employeeDestroyReducers';
import importerReducer from 'src/modules/employee/importer/employeeImporterReducers';
import { combineReducers } from 'redux';

export default combineReducers({
  list,
  form,
  view,
  destroy,
  importer: importerReducer,
});
