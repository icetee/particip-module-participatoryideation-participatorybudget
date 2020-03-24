INSERT INTO `workflow_icon` (`id_icon`, `name`, `mime_type`, `file_value`, `width`, `height`) VALUES
	(150, 'Submit', 'image/png', _binary 0x89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF61000000097048597300000B1300000B1301009A9C18000000206348524D00007A25000080830000F9FF000080E9000075300000EA6000003A980000176F925FC546000001164944415478DA9C934D4A034110855F2603110F6036B9823B25242EDCE424EA46D4E4200AE6062168A2E8050405DD45702D08AE0C48F408597D2E7C2163A7A717167C50D4CFEB99EE2A010A6803FBF64FF9B52F6008EC84F58A08748147FB9BC021700E4C2D3602AA31813BE0C87E25225C751EE001C8438163603768CA8BA7992D8BDC2E04DA402F72A2804B13C67B16690A38009E4A04DE4D2C3705AE55925CF06262B93EF09D491A4B6A6A6935496BF62B468ED50A75AF923632AD5A47D287A486A44FD370ACB3521DF9B43AF00CCC81373377AC1EFE42D925AE03139636712CBCC42B01AD9267CC817B93A79E31354831B6DD7CF39F513E498D726A99FA8565BA00B2D436B6803DFB676E9A01038FFD9FFA9F01008D9FDCF3A220D51A0000000049454E44AE426082, -1, -1),
	(151, 'Revert', 'image/png', _binary 0x89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF61000000097048597300000B1300000B1301009A9C18000000206348524D00007A25000080830000F9FF000080E9000075300000EA6000003A980000176F925FC5460000013F4944415478DA9C933B2F44511485BF7944A340432344AD9478563A4A85440822A122FC14CD144A24930889521453E30F101DA6201AA26144E253D8378E61103B59B9E79EBDEE3A67DFBD366A8F3AAD12185137D51B3FE246DD8A1C2950D782D4AE6EC4BAAAAEAB4BEA62AC2F2357560BA9C0ACFAA29EA84FEA42FD2981BCBA1C2215B598094C26571D6BF0718ABEE0EE6602F389C0633CA77E11590DDE404EED04468117A01968020E810BA08DF7B8E76B5C01C73F9D32AE3E07C6BFC9AFABB745A003B88B1B64D1021C00A5783F005A8187847306B4E78173609AFF865A534B0D4AA805C61A959053778021A0FB1BFDDF7EE211EA60B464F50F1EA86F637FB6B1171B7DFF311261CB4A245652AF272844EE9395736A56531ED80666802AB00F9C0239A0179800BA80323007BC665DA8C7708C6E3ACED731E2C3F5FCB701005DC166BCA12F6C470000000049454E44AE426082, -1, -1),
	(152, 'Validate', 'image/png', _binary 0x89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF61000000097048597300000B1300000B1301009A9C18000000206348524D00007A25000080830000F9FF000080E9000075300000EA6000003A980000176F925FC546000001124944415478DA8C93AD4E834110454F6A70581E81A02886869657E015302D0928C28B20C011306DF853A0010F2D96F00C686805EA2098AF6C37DFB66C32C9E6EEBD772633B3A864D151EFD5897F67125827E7E7E2AB107CAA7DF520A21F98EA4DC96014846E4D5555748333CC0D6EE3617D8EB88A665A09EAC63F32A3B6D4E5B8F742D3447D8A26CD136F87E034C126EA23F170BEC0E023785B0976A1DAE0F7BC523E67C00A70083C27F808A051233802DE81256015D88B042775EE95C166827D036BC01BF010D84E8DB605506AE26EB285A5E94C9B588DB19711F6D5E38278668CC452184BB26891AA84D7F92A0F0B95D4657E297DA6CB207CA983E4330D029B662E19A0B6D53B759C34721C583BE7FF0C008195BA0E9223ED610000000049454E44AE426082, -1, -1);

INSERT INTO workflow_state VALUES (150, 'ExportedToBudget', 'Exported as project in participatorybudget plugin', 100, 0, 0, NULL, 10);

INSERT INTO workflow_action (id_action, name, description, id_workflow, id_state_before, id_state_after, id_icon, is_automatic, is_mass_action, display_order, is_automatic_reflexive_action) VALUES
	(100, 'Submit', 'Used when a draft proposal is definitely submitted. ', 100, 100, 101, 152, 0, 0, 1, 0),
	(101, 'Reinit', 'Return to draft state. ', 100, 101, 100, 151, 0, 0, 1, 0),
	(150, 'ExportToBudget', 'Export proposal to participatorybudget plugin as new project.', 100, 101, 150, 150, 0, 0, 10, 0),
	(151, 'Reinit', 'Return to draft state. ', 100, 150, 100, 151, 0, 0, 1, 0);

INSERT INTO workflow_task (id_task, task_type_key, id_action, display_order) VALUES 
	(150, 'exportToBudgetTask', 150, 1),
	(151, 'reinitProposalTask', 151, 1),
	(152, 'reinitProposalTask', 101, 1);
