import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useMatch } from 'react-router-dom';
import { i18n } from 'src/i18n';
import actions from 'src/modules/employee/view/employeeViewActions';
import selectors from 'src/modules/employee/view/employeeViewSelectors';
import EmployeeView from 'src/view/employee/view/EmployeeView';
import EmployeeViewToolbar from 'src/view/employee/view/EmployeeViewToolbar';
import ContentWrapper from 'src/view/layout/styles/ContentWrapper';
import Breadcrumb from 'src/view/shared/Breadcrumb';
import PageTitle from 'src/view/shared/styles/PageTitle';

const EmployeePage = (props) => {
  const dispatch = useDispatch();
  const match = useMatch();

  const loading = useSelector(selectors.selectLoading);
  const record = useSelector(selectors.selectRecord);

  useEffect(() => {
    dispatch(actions.doFind(match.params.id));
  }, [dispatch, match.params.id]);

  return (
    <>
      <Breadcrumb
        items={[
          [i18n('dashboard.menu'), '/'],
          [i18n('entities.employee.menu'), '/employee'],
          [i18n('entities.employee.view.title')],
        ]}
      />

      <ContentWrapper>
        <PageTitle>
          {i18n('entities.employee.view.title')}
        </PageTitle>

        <EmployeeViewToolbar match={match} />

        <EmployeeView loading={loading} record={record} />
      </ContentWrapper>
    </>
  );
};

export default EmployeePage;
