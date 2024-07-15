import importerActions from 'src/modules/shared/importer/importerActions';
import selectors from 'src/modules/employee/importer/employeeImporterSelectors';
import EmployeeService from 'src/modules/employee/employeeService';
import fields from 'src/modules/employee/importer/employeeImporterFields';
import { i18n } from 'src/i18n';

const employeeImporterActions = importerActions(
  'EMPLOYEE_IMPORTER',
  selectors,
  EmployeeService.import,
  fields,
  i18n('entities.employee.importer.fileName'),
);

export default employeeImporterActions;
