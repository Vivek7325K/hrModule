import ButtonIcon from 'src/view/shared/ButtonIcon';
import { useForm, FormProvider } from 'react-hook-form';
import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { i18n } from 'src/i18n';
import actions from 'src/modules/department/list/departmentListActions';
import selectors from 'src/modules/department/list/departmentListSelectors';
import FilterWrapper from 'src/view/shared/styles/FilterWrapper';
import * as yup from 'yup';
import yupFilterSchemas from 'src/modules/shared/yup/yupFilterSchemas';
import { yupResolver } from '@hookform/resolvers/yup';
import FilterPreview from 'src/view/shared/filter/FilterPreview';
import filterRenders from 'src/modules/shared/filter/filterRenders';
import InputFormItem from 'src/view/shared/form/items/InputFormItem';
import SelectFormItem from 'src/view/shared/form/items/SelectFormItem';
import departmentEnumerators from 'src/modules/department/departmentEnumerators';
import DatePickerRangeFormItem from 'src/view/shared/form/items/DatePickerRangeFormItem';
import RadioFormItem from 'src/view/shared/form/items/RadioFormItem';
import SwitchFormItem from 'src/view/shared/form/items/SwitchFormItem';
import InputRangeFormItem from 'src/view/shared/form/items/InputRangeFormItem';
import InputNumberRangeFormItem from 'src/view/shared/form/items/InputNumberRangeFormItem';

import EmployeeAutocompleteFormItem from 'src/view/employee/autocomplete/EmployeeAutocompleteFormItem';

const schema = yup.object().shape({
  department: yupFilterSchemas.stringArray(
    i18n('entities.department.fields.department'),
  ),
  employee: yupFilterSchemas.relationToOne(
    i18n('entities.department.fields.employee'),
  ),
});

const emptyValues = {
  department: [],
  employee: null,
};

const previewRenders = {
  department: {
    label: i18n('entities.department.fields.department'),
    render: filterRenders.enumeratorMultiple(
      'entities.department.enumerators.department',
    ),
  },
  employee: {
    label: i18n('entities.department.fields.employee'),
    render: filterRenders.relationToOne(),
  },
};

const DepartmentListFilter = (props) => {
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
                  <SelectFormItem
                    name="department"
                    label={i18n(
                      'entities.department.fields.department',
                    )}
                    options={departmentEnumerators.department.map(
                      (value) => ({
                        value,
                        label: i18n(
                          `entities.department.enumerators.department.${value}`,
                        ),
                      }),
                    )}
                    mode="multiple"
                  />
                </div>
                <div className="col-lg-6 col-12">
                  <EmployeeAutocompleteFormItem
                    name="employee"
                    label={i18n(
                      'entities.department.fields.employee',
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

export default DepartmentListFilter;
