include_recipe 'pris::default'

pris_requisition 'foojdbc'

pris_source 'foobar' do
  requisition_name 'foojdbc'
  type 'jdbc'
  params(
    'source.driver' => 'org.postgresql.Driver',
    'source.url' => 'jdbc:postgresql://localhost:5432/opennms',
    'source.user' => 'opennms',
    'source.password' => 'opennms',
    'source.selectStatement' => 'SELECT node.foreignId AS Foreign_Id, node.nodelabel AS Node_Label, ipinterface.ipaddr AS IP_Address, ipinterface.issnmpprimary AS MgmtType, ipinterface.ipstatus AS InterfaceStatus, assets.description AS Asset_Description, assets.city AS Asset_City, assets.state AS Asset_State, service.servicename AS Svc, categories.categoryname AS Cat FROM node LEFT OUTER JOIN ipInterface ON node.nodeId=ipInterface.nodeId LEFT OUTER JOIN ifServices ON ipInterface.id=ifServices.ipinterfaceid LEFT OUTER JOIN service ON ifServices.serviceId=service.serviceId LEFT OUTER JOIN category_node ON node.nodeId=category_node.nodeId LEFT OUTER JOIN categories ON category_node.categoryId=categories.categoryId LEFT OUTER JOIN assets ON node.nodeId=assets.nodeId;'
  )
end

pris_mapper 'foobar' do
  requisition_name 'foojdbc'
  type 'echo'
end
