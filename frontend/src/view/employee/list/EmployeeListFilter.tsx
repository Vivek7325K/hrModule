import ButtonIcon from 'src/view/shared/ButtonIcon';
import { useForm, FormProvider } from 'react-hook-form';
import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { i18n } from 'src/i18n';
import actions from 'src/modules/employee/list/employeeListActions';
import selectors from 'src/modules/employee/list/employeeListSelectors';
import FilterWrapper from 'src/view/shared/styles/FilterWrapper';
import * as yup from 'yup';
import yupFilterSchemas from 'src/modules/shared/yup/yupFilterSchemas';
import { yupResolver } from '@hookform/resolvers/yup';
import FilterPreview from 'src/view/shared/filter/FilterPreview';
import filterRenders from 'src/modules/shared/filter/filterRenders';
import InputFormItem from 'src/view/shared/form/items/InputFormItem';
import SelectFormItem from 'src/view/shared/form/items/SelectFormItem';
import employeeEnumerators from 'src/modules/employee/employeeEnumerators';
import DatePickerRangeFormItem from 'src/view/shared/form/items/DatePickerRangeFormItem';
import RadioFormItem from 'src/view/shared/form/items/RadioFormItem';
import SwitchFormItem from 'src/view/shared/form/items/SwitchFormItem';
import InputRangeFormItem from 'src/view/shared/form/items/InputRangeFormItem';
import InputNumberRangeFormItem from 'src/view/shared/form/items/InputNumberRangeFormItem';

const schema = yup.object().shape({
  firstName: yupFilterSchemas.string(
    i18n('entities.employee.fields.firstName'),
  ),
  lastName: yupFilterSchemas.string(
    i18n('entities.employee.fields.lastName'),
  ),
  title: yupFilterSchemas.string(
    i18n('entities.employee.fields.title'),
  ),
  email: yupFilterSchemas.string(
    i18n('entities.employee.fields.email'),
  ),
  phoneNumberRange: yupFilterSchemas.integerRange(
    i18n('entities.employee.fields.phoneNumberRange'),
  ),
});

const emptyValues = {
  firstName: null,
  lastName: null,
  title: null,
  email: null,
  phoneNumberRange: [],
};

const previewRenders = {
  firstName: {
    label: i18n('entities.employee.fields.firstName'),
    render: filterRenders.generic(),
  },
  lastName: {
    label: i18n('entities.employee.fields.lastName'),
    render: filterRenders.generic(),
  },
  title: {
    label: i18n('entities.employee.fields.title'),
    render: filterRenders.generic(),
  },
  email: {
    label: i18n('entities.employee.fields.email'),
    render: filterRenders.generic(),
  },
  phoneNumberRange: {
    label: i18n(
      'entities.employee.fields.phoneNumberRange',
    ),
    render: filterRenders.range(),
  },
};

const EmployeeListFilter = (props) => {
  const dispatch = useDispatch();
  const rawFilter = useSelector(selectors.selectRawFilter);
  const [expanded, setExpanded] = useState(false);

  const [initialValues] = useState(() => {
    return {
      ...emptyValues,
      ...rawFilter,
    };
  });

  const form = useForm({
    resolver: yupResolver(schema),
    defaultValues: initialValues,
    mode: 'all',
  });

  useEffect(() => {
    dispatch(
      actions.doFetch(
        schema.cast(initialValues),
        rawFilter,
      ),
    );
    // eslint-disable-next-line
  }, [dispatch]);

  const onSubmit = (values) => {
    const rawValues = form.getValues();
    dispatch(actions.doFetch(values, rawValues));
    setExpanded(false);
  };

  const onReset = () => {
    Object.keys(emptyValues).forEach((key) => {
      form.setValue(key, emptyValues[key]);
    });
    dispatch(actions.doReset());
    setExpanded(false);
  };

  const onRemove = (key) => {
    form.setValue(key, emptyValues[key]);
    return form.handleSubmit(onSubmit)();
  };

  return (
    <FilterWrapper>
      <FilterPreview
        onClick={() => {
          setExpanded(!expanded);
        }}
        renders={previewRenders}
        values={rawFilter}
        expanded={expanded}
        onRemove={onRemove}
      />
      <div className="container">
        <div
          className={`collapse ${expanded ? 'show' : ''}`}
        >
          <FormProvider {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)}>
              <div className="row">
                <div className="col-lg-6 col-12">
                  <InputFormItem
                    name="firstName"
                    label={i18n(
                      'entities.employee.fields.firstName',
                    )}
                  />
                </div>
                <div className="col-lg-6 col-12">
                  <InputFormItem
                    name="lastName"
                    label={i18n(
                      'entities.employee.fields.lastName',
                    )}
                  />
                </div>
                <div className="col-lg-6 col-12">
                  <InputFormItem
                    name="title"
                    label={i18n(
                      'entities.employee.fields.title',
                    )}
                  />
                </div>
                <div className="col-lg-6 col-12">
                  <InputFormItem
                    name="email"
                    label={i18n(
                      'entities.employee.fields.email',
                    )}
                  />
                </div>
                <div className="col-lg-6 col-12">
                  <InputNumberRangeFormItem
                    name="phoneNumberRange"
                    label={i18n(
                      'entities.employee.fields.phoneNumberRange',
                    )}
                  />
                </div>
              </div>
              <div className="row">
                <div className="col-12 filter-buttons">
                  <button
                    className="btn btn-primary"
                    type="submit"
                    disabled={props.loading}
                  >
                    <ButtonIcon
                      loading={props.loading}
                      iconClass="fas fa-search"
                    />{' '}
                    {i18n('common.search')}
                  </button>
                  <button
                    className="btn btn-light"
                    type="button"
                    onClick={onReset}
                    disabled={props.loading}
                  >
                    <ButtonIcon
                      loading={props.loading}
                      iconClass="fas fa-undo"
                    />{' '}
                    {i18n('common.reset')}
                  </button>
                </div>
              </div>
            </form>
          </FormProvider>
        </div>
      </div>
    </FilterWrapper>
  );
};

export default EmployeeListFilter;
