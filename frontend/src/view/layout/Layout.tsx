import React from 'react';
import Header from 'src/view/layout/Header';
import Menu from 'src/view/layout/Menu';
import { useMatch } from 'react-router-dom';
import LayoutWrapper from 'src/view/layout/styles/LayoutWrapper';

function Layout(props) {
  const match = useMatch();

  return (
    <LayoutWrapper>
      <Menu url={match.url} />
      <div className="main">
        <Header />
        <div className="content">{props.children}</div>
      </div>
    </LayoutWrapper>
  );
}

export default Layout;
