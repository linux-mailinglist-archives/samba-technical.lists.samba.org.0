Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B9120475
	for <lists+samba-technical@lfdr.de>; Mon, 16 Dec 2019 12:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Ad/oPGa41hnO3rcxRbkXmhtCvl5sF1EQg2UXJJhFlN4=; b=gzzlso4eV1WejRAtIM2zFGUZHk
	CSzJB2HOLISfBvb2T5zYLhZKVrLOMuXFduL/nQh2qAarYhF1tum+uAnuLtEaKjFLrjTwjaIijlQZS
	zqdB/IsMXURAKQzn+TLUxHMHz5gb2PW6sfOk3CgbexxQH116eGakokce7fGBHZOT1pH6KODqnp0UZ
	IM0ow2yLGZs9zX1nQ17zU3zbdZSJRl7mNYyD9xyuL5mIpxDzYiwKbgUZzt0XdCX4HsBF21zL/7J+/
	byuGkMcssvJfEdDvJ7g2ycke2GVYzEzHXLj/bdK9gtErLzd4QDALTkfE8hitwF9IQ99v57WbQY7EW
	IU9Kt+Sg==;
Received: from localhost ([::1]:60836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1igoxc-007ObK-V2; Mon, 16 Dec 2019 11:54:49 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:38442) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igoxY-007ObD-7m
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 11:54:46 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1577102086.45035@VC9tjINt/pAERD6X3TbqJg
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: CD6AB11EFA1.AC99F
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id CD6AB11EFA1
 for <samba-technical@lists.samba.org>; Mon, 16 Dec 2019 12:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1576497284;
 bh=5koKWDgzKPmC0yQkVsefhlrpVXENJcU02oNUFZSIgq4=;
 h=Subject:From:To:Date:From;
 b=guCuyIj+9hUv2NInUlPP1xlXp493rtkgMpwsZoczeBSdUleYdaTwLS2pmQL8ma2bb
 TabBpDeGPOocEl9mdDzKftFxgPTiM+egyV43tc5ynxM9BVvia9XABSbdvAIbuE2/2S
 vtlh+u/5x0jphdCo/B9Nbi49mo25ShFGwUTusGDk1cwLL92x+B2JUT9lUFAIZGEsg0
 CuvT+B66S3Qqw6t19GJy8tzGbE+5NQPJMbsvjJ6ti/cGvKjn6qt8VaAPkmRrUHv/9a
 oV460Q8ND95Xglh+vcp8wGyrjIEEFaBPliyUGhZkJbJXCYbtzK7onNHoOXFvCz+2ia
 eruVsHLACR23g==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 1FA543AF8C
 for <samba-technical@lists.samba.org>; Mon, 16 Dec 2019 12:54:37 +0100 (CET)
Subject: Spelling/typos. 
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Mon, 16 Dec 2019 12:54:37 +0100
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdW0B5bM5tszEa2JTtiVyuDtPd1n8Q==
Message-Id: <vmime.5df7707d.74d7.61e0656b532253cd@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Guys,=20=0D=0A=A0=0D=0AIm currently working on fixing spelling errors=
 found by debian Lintian.=20=0D=0AOne im fixing now is :=20=0D=0A=A0=0D=0A=
usr/lib/x86_64-linux-gnu/samba/vfs/fruit.so:ressource:resource=0D=0A=A0=0D=
=0ANow im grepping on the type "ressource" but that also showed me this :=
=A0=20=0D=0A=A0=0D=0Alibrpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0 uint=
32 ressource_id;=0D=0Alibrpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0 uin=
t32 ressource_id;=0D=0Asource3/modules/vfs_fruit.c:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "ressource", fruit=
_rsrc, FRUIT_RSRC_ADFILE);=0D=0Asource3/rpcclient/cmd_spoolss.c:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info2.ressource_id=A0=A0=A0=A0=A0 =3D=
 0;=0D=0Asource3/rpcclient/cmd_spoolss.c:=A0=A0=A0=A0=A0=A0=A0 printf("\t=
ressource_id: 0x%08x\n", r->ressource_id);=0D=0Asource3/locale/pam_winbin=
d/da.po:msgstr "Dom=E6ne-controller kan ikke n=E5s, bruger cachede akkred=
itiver i stedet. Netv=E6rksressourcer kan v=E6re utilg=E6ngelige"=0D=0Aso=
urce3/locale/pam_winbind/fr.po:msgstr "Le contr=F4leur de domaine est inj=
oignable. Les donn=E9s d'identification en cache seront utilis=E9es. Cert=
aines ressources r=E9seaux seront indisponibles."=0D=0A=0D=0A=A0=0D=0Amy =
question,=A0 things like :=A0 uint32 ressource_id;=20=0D=0A=A0=0D=0Argrep=
 ressource_id *=0D=0A=0D=0Alibrpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0=
 uint32 ressource_id;=0D=0Alibrpc/idl/spoolss.idl:=A0=A0=A0=A0=A0=A0=A0=A0=
 uint32 ressource_id;=0D=0Asource3/rpcclient/cmd_spoolss.c:=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info2.ressource_id=A0=A0=A0=A0=A0 =3D 0;=0D=
=0Asource3/rpcclient/cmd_spoolss.c:=A0=A0=A0=A0=A0=A0=A0 printf("\tressou=
rce_id: 0x%08x\n", r->ressource_id);=0D=0A=0D=0AShould i fix these also=3F=
 to resource_id =3F=20=0D=0A=A0=0D=0AAnd, can put these type fixes in one=
 patch=3F=20=0D=0AI'm=A0tekstbook following the git steps, because i need=
 to=A0learn to work=A0more git.=0D=0A=A0=0D=0A=A0=0D=0A=A0=0D=0AGreetz,=0D=
=0A=A0=0D=0ALouis=0D=0A=A0=0D=0A=0D=0A=0D=0A
