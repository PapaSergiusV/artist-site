import React from "react";
import CSSModules from "react-css-modules";
import PropTypes from "prop-types";
import { FaInstagram, FaPhone, FaEnvelope } from "react-icons/fa";
import Routes from "../../../libs/routes";

import styles from "./Footer.module.scss";

const Footer = ({ contacts: { instagram, phone, email }, user, logo }) => {
  const signOut = () => {
    fetch(Routes.signout_path())
      .then(response => response.ok && window.location.reload());
  };

  return (
    <div styleName="wrapper">
      <div styleName="gold">{logo}</div>
      {
        instagram &&
        <div styleName="address-point">
          <FaInstagram />
          <a href={instagram.address}>
            {instagram.login}
          </a>
        </div>
      }
      {
        phone &&
        <div styleName="address-point">
          <FaPhone />
          <span>{phone.address}</span>
        </div>
      }
      {
        email &&
        <div styleName="address-point">
          <FaEnvelope />
          <span>{email.address}</span>
        </div>
      }
      {
        user ?
          <>
            <div styleName="address-point gray">
              <p onClick={signOut}>Sign Out</p>
            </div>
            <div styleName="address-point gray">
              <a href={Routes.admin_path()}>Admin</a>
            </div>
          </> :
          <div styleName="address-point gray">
            <a href={Routes.signin_path()}>Sign In</a>
          </div>

      }

    </div>
  );
};

const Contact = PropTypes.shape({
  address: PropTypes.string.isRequired,
  login: PropTypes.string
});

Footer.propTypes = {
  contacts: PropTypes.shape({
    instagram: Contact,
    phone: Contact,
    email: Contact
  }).isRequired,
  user: PropTypes.object
};

export default CSSModules(Footer, styles, { allowMultiple: true });
