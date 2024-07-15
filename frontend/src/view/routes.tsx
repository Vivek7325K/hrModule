import Permissions from 'src/security/permissions';
import config from 'src/config';

const permissions = Permissions.values;

const privateRoutes = [
  {
    path: '/',
    loader: () =>
      import('src/view/dashboard/DashboardPage'),
    permissionRequired: null,
    exact: true,
  },

  {
    path: '/profile',
    loader: () => import('src/view/auth/ProfileFormPage'),
    permissionRequired: null,
    exact: true,
  },

  {
    path: '/password-change',
    loader: () =>
      import('src/view/auth/PasswordChangeFormPage'),
    permissionRequired: null,
    exact: true,
  },

  {
    path: '/tenant',
    loader: () =>
      import('src/view/tenant/list/TenantListPage'),
    permissionRequired: null,
    exact: true,
  },
  {
    path: '/tenant/new',
    loader: () =>
      import('src/view/tenant/form/TenantFormPage'),
    permissionRequired: null,
    exact: true,
  },
  {
    path: '/tenant/:id/edit',
    loader: () =>
      import('src/view/tenant/form/TenantFormPage'),
    permissionRequired: null,
    exact: true,
  },

  config.isPlanEnabled && {
    path: '/plan',
    loader: () => import('src/view/plan/PlanPage'),
    permissionRequired: permissions.planRead,
    exact: true,
  },

  {
    path: '/user',
    loader: () => import('src/view/user/list/UserPage'),
    permissionRequired: permissions.userRead,
    exact: true,
  },

  {
    path: '/user/new',
    loader: () => import('src/view/user/new/UserNewPage'),
    permissionRequired: permissions.userCreate,
    exact: true,
  },

  {
    path: '/user/importer',
    loader: () =>
      import('src/view/user/importer/UserImporterPage'),
    permissionRequired: permissions.userImport,
    exact: true,
  },
  {
    path: '/user/:id/edit',
    loader: () => import('src/view/user/edit/UserEditPage'),
    permissionRequired: permissions.userEdit,
    exact: true,
  },
  {
    path: '/user/:id',
    loader: () => import('src/view/user/view/UserViewPage'),
    permissionRequired: permissions.userRead,
    exact: true,
  },

  {
    path: '/audit-logs',
    loader: () => import('src/view/auditLog/AuditLogPage'),
    permissionRequired: permissions.auditLogRead,
  },

  {
    path: '/settings',
    loader: () =>
      import('src/view/settings/SettingsFormPage'),
    permissionRequired: permissions.settingsEdit,
  },
  {
    path: '/employee',
    loader: () =>
      import('src/view/employee/list/EmployeeListPage'),
    permissionRequired: permissions.employeeRead,
    exact: true,
  },
  {
    path: '/employee/new',
    loader: () =>
      import('src/view/employee/form/EmployeeFormPage'),
    permissionRequired: permissions.employeeCreate,
    exact: true,
  },
  {
    path: '/employee/importer',
    loader: () =>
      import(
        'src/view/employee/importer/EmployeeImporterPage'
      ),
    permissionRequired: permissions.employeeImport,
    exact: true,
  },
  {
    path: '/employee/:id/edit',
    loader: () =>
      import('src/view/employee/form/EmployeeFormPage'),
    permissionRequired: permissions.employeeEdit,
    exact: true,
  },
  {
    path: '/employee/:id',
    loader: () =>
      import('src/view/employee/view/EmployeeViewPage'),
    permissionRequired: permissions.employeeRead,
    exact: true,
  },
  {
    path: '/department',
    loader: () =>
      import('src/view/department/list/DepartmentListPage'),
    permissionRequired: permissions.departmentRead,
    exact: true,
  },
  {
    path: '/department/new',
    loader: () =>
      import('src/view/department/form/DepartmentFormPage'),
    permissionRequired: permissions.departmentCreate,
    exact: true,
  },
  {
    path: '/department/importer',
    loader: () =>
      import(
        'src/view/department/importer/DepartmentImporterPage'
      ),
    permissionRequired: permissions.departmentImport,
    exact: true,
  },
  {
    path: '/department/:id/edit',
    loader: () =>
      import('src/view/department/form/DepartmentFormPage'),
    permissionRequired: permissions.departmentEdit,
    exact: true,
  },
  {
    path: '/department/:id',
    loader: () =>
      import('src/view/department/view/DepartmentViewPage'),
    permissionRequired: permissions.departmentRead,
    exact: true,
  },
  {
    path: '/project',
    loader: () =>
      import('src/view/project/list/ProjectListPage'),
    permissionRequired: permissions.projectRead,
    exact: true,
  },
  {
    path: '/project/new',
    loader: () =>
      import('src/view/project/form/ProjectFormPage'),
    permissionRequired: permissions.projectCreate,
    exact: true,
  },
  {
    path: '/project/importer',
    loader: () =>
      import(
        'src/view/project/importer/ProjectImporterPage'
      ),
    permissionRequired: permissions.projectImport,
    exact: true,
  },
  {
    path: '/project/:id/edit',
    loader: () =>
      import('src/view/project/form/ProjectFormPage'),
    permissionRequired: permissions.projectEdit,
    exact: true,
  },
  {
    path: '/project/:id',
    loader: () =>
      import('src/view/project/view/ProjectViewPage'),
    permissionRequired: permissions.projectRead,
    exact: true,
  },
].filter(Boolean);

const publicRoutes = [
  {
    path: '/auth/signin',
    loader: () => import('src/view/auth/SigninPage'),
  },
  {
    path: '/auth/signup',
    loader: () => import('src/view/auth/SignupPage'),
  },
  {
    path: '/auth/forgot-password',
    loader: () =>
      import('src/view/auth/ForgotPasswordPage'),
  },
].filter(Boolean);

const emptyTenantRoutes = [
  {
    path: '/auth/tenant',
    loader: () => import('src/view/auth/TenantPage'),
  },
].filter(Boolean);

const emptyPermissionsRoutes = [
  {
    path: '/auth/empty-permissions',
    loader: () =>
      import('src/view/auth/EmptyPermissionsPage'),
  },
].filter(Boolean);

const emailUnverifiedRoutes = [
  {
    path: '/auth/email-unverified',
    loader: () =>
      import('src/view/auth/EmailUnverifiedPage'),
  },
].filter(Boolean);

const simpleRoutes = [
  {
    path: '/auth/password-reset',
    loader: () => import('src/view/auth/PasswordResetPage'),
  },
  {
    path: '/auth/invitation',
    loader: () => import('src/view/auth/InvitationPage'),
  },
  {
    path: '/auth/verify-email',
    loader: () => import('src/view/auth/VerifyEmailPage'),
  },
  {
    path: '/403',
    loader: () =>
      import('src/view/shared/errors/Error403Page'),
  },
  {
    path: '/500',
    loader: () =>
      import('src/view/shared/errors/Error500Page'),
  },
  {
    path: '**',
    loader: () =>
      import('src/view/shared/errors/Error404Page'),
  },
].filter(Boolean);

export default {
  privateRoutes,
  publicRoutes,
  emptyTenantRoutes,
  emptyPermissionsRoutes,
  emailUnverifiedRoutes,
  simpleRoutes,
};
