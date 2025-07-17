import React from "react";

import { Layout } from "@client/components/Layout";
import { templates } from "@reactivated";

export function Template(props: templates.TempAppIndex) {
  return (
    <Layout title={props.title}>
      <h1>{props.title}</h1>
      <p>{props.message}</p>
    </Layout>
  );
}
