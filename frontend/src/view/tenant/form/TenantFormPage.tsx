import React, { useState, useEffect } from 'react';
import ContentWrapper from 'src/view/layout/styles/ContentWrapper';
import PageTitle from 'src/view/shared/styles/PageTitle';
import Breadcrumb from 'src/view/shared/Breadcrumb';
import TenantForm from 'src/view/tenant/form/TenantForm';
import { i18n } from 'src/i18n';
import { getHistory } from 'src/modules/store';
import actions from 'src/modules/tenant/form/tenantFormActions';
import selectors from 'src/modules/tenant/form/tenantFormSelectors';
import { useSelector, useDispatch } from 'react-redux';
import { useMatch } from 'react-router-dom';
import Spinner from 'src/view/shared/Spinner';

function TenantFormPage() {
  const dispatch = useDispatch();
  const [dispatched, setDispatched] = useState(false);
  const match = useMatch();

  const initLoading = useSelector(
    selectors.selectInitLoading,
  );
  const saveLoading = useSelector(
    selectors.selectSaveLoading,
  );
  const record = useSelector(selectors.selectRecord);

  const isEditing = Boolean(match.params.id);

  useEffect(() => {
    dispatch(actions.doInit(match.params.id));
    setDispatched(true);
  }, [dispatch, match.params.id]);

  const doSubmit = (id, data) => {
    if (isEditing) {
      dispatch(actions.doUpdate(id, data));
    } else {
      dispatch(actions.doCreate(data));
    }
  };

  const title = isEditing
    ? i18n('tenant.edit.title')
    : i18n('tenant.new.title');

  return (
    <>
      <Breadcrumb
        items={[[i18n('tenant.menu'), '/tenant'], [title]]}
      />

      <ContentWrapper>
        <PageTitle>{title}</PageTitle>

        {initLoading && <Spinner />}

        {dispatched && !initLoading && (
          <TenantForm
            saveLoading={saveLoading}
            record={record}
            isEditing={isEditing}
            onSubmit={doSubmit}
            onCancel={() => getHistory().push('/tenant')}
          />
        )}
      </ContentWrapper>
    </>
  );
}

export default TenantFormPage;
