Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD9E6DF64A
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 14:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rw7qiyONt2/EFiAYttM8tn89lYCt1rajlRLCDOK5Xcs=; b=D0uQnLn+lTHzqRsnHgZpMil5Co
	1Xfu2IXi1jVsScIEz7gaFiDUB8DJ2E/T1FD+y4qIrsufyxP1ryerO4LWwV+TriY1FxPLR2tGf9K2A
	nnBgr4dZ1+rG5gzAag37H7dbxS+njjxgCLMghzpxDKk9dsUwU+CC12W5+l3AIsU1skcPYulO8TMf7
	4aRs+jsxapyE0A5jWjxzb9jz0zcJdDR4Cro+eHSqLxcJLbyoJNMc4OuVmxVASquLe9BDl0ksPbp3s
	5qa+Yw+XrX+UHhsJYt+wkZObJmkgUDRoHOnIjrpl5ulwU5+wfivtr3r6WTVVhU/qgs7aYw3AXlHKQ
	+Ypei6Kw==;
Received: from ip6-localhost ([::1]:42544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pma3i-000l8f-Bs; Wed, 12 Apr 2023 12:58:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44853) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pma3c-000l8W-1j
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 12:58:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id la3so11121612plb.11
 for <samba-technical@lists.samba.org>; Wed, 12 Apr 2023 05:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1681304317; x=1683896317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rw7qiyONt2/EFiAYttM8tn89lYCt1rajlRLCDOK5Xcs=;
 b=KyM2ZApyOCRrowb03QKAL8Fd+Zy/B/ZhDd8zHk4nhakrJNsoXt/t862PON03sIHyBx
 OspRkmesToPBLE4NyGT+ttLm8gN+FYhvmwKJF5zdKylxfnjVv6mPDV1FP7t2gRhe88Yu
 J87RZGBnV0vz0XEPeDlD8EYlM+hiQvZN1SU1IbxYadNUvPeBQV6DtPmOQyP5pBuZSu3w
 m4TchayDn0buXK9WTfXz3WQ7NkEwo7KQ4/+mipeE45MfQqHbn6oDXynINKpQBUpFq6zK
 rfNqj1OimfADI7sz1BG00P1/QqeWcAjijhCXBeTqTFA7vbcUoNlXgMQ7cBuLZXXbnGJt
 R0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681304317; x=1683896317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rw7qiyONt2/EFiAYttM8tn89lYCt1rajlRLCDOK5Xcs=;
 b=1VdlBEjF9meVwNOKeIswjjE8HbYyKdzSZci7Pez8oFIfzutJ9AGA53o3YdoTUR/TFF
 K6ROzgBb59Bp1UYkss3nzWmLivz0J0cHHGrKqUgOeCAW938EHjLpkNI4DMR2D53c5zQo
 EOYGC/RnpZCeSxaJhEwsaa9ySnJ9I/3Z0r8+nG/Aj3HcKTI18OOgpxHhdRfR9iEbKi7C
 4Pj9S00XUEECRLjyxdXFN2YskW8y+j93Xi5gfdk8oWbbXSYHORo5+LLOSTSY54BYoEgS
 q/R6TS8Y8OvouUqRmcq+DomFc3+85rm+Vupn41ldroUlPzjz6zhRIVYbrlvCIVie2uRF
 sg2w==
X-Gm-Message-State: AAQBX9cWF4tpgpowDT/WWn6Fds/3JfphV+IIKZBTHuVI3XhzETN4JEOu
 7r2aqbcPAZ1tP1VqN3/czIsTeCblxmdHASivh5xSpQTEdTDjbTr23ZM=
X-Google-Smtp-Source: AKy350ZMPVSXtPpsRGbMiEMvOK7wIGSwIPvvnyxXwjKgExsTSILgXXOSLoNUOMAn+dzAAOLNWUERLtOrkBmnp3FEvZs=
X-Received: by 2002:a17:903:41d0:b0:1a2:6138:c32e with SMTP id
 u16-20020a17090341d000b001a26138c32emr20083449ple.18.1681304317186; Wed, 12
 Apr 2023 05:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
 <19d97578-4936-6197-871a-5996f32cfd54@samba.org>
 <d1cc4ccf-a8a0-0ef5-e418-1e406490fa80@comind.io>
 <0ca6506a-af76-a2ec-626a-5ee11ef7952e@samba.org>
 <04c86436-6665-354f-84b5-479613a81545@comind.io>
 <93859d7c-eaf9-0a93-a236-53a172381782@samba.org>
In-Reply-To: <93859d7c-eaf9-0a93-a236-53a172381782@samba.org>
Date: Wed, 12 Apr 2023 07:58:26 -0500
Message-ID: <CAB5c7xoHu91S2W6Ux=RfrhJRJ-_FWgPmgPJM7KzwCvuNypYTMQ@mail.gmail.com>
Subject: Re: How to test samba LDAP parameters with openldap tools,
 eg ldapsearch?
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Apr 12, 2023 at 7:51=E2=80=AFAM Rowland Penny via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
>
> On 12/04/2023 13:37, Jan Andersen wrote:
> > Hi Rowland,
> >
> > I noticed something odd about the logs: it seems smbd generates one bot=
h
> > for the workstation's name and one for its IP address - I didn't attach
> > the latter, so here it is. It seems to have more detail.
> >
> > Jan
> >
> > On 12/04/2023 12:06, Rowland Penny via samba-technical wrote:
> >>
> >>
> >> On 12/04/2023 11:39, Jan Andersen wrote:
> >>> Hi Rowland,
> >>>
> >>> Thank you for replying. I wiped the existing logs, changed the smbd
> >>> service to include '-d 10' and restarted, so I would have logs
> >>> without too much noise - please find them attached along with smb.con=
f
> >>>
> >>>
> >>
> >> You appear to be running Samba as a standalone server with an ldap
> >> backend, are you aware that such a setup is two parameters away from
> >> being a PDC ? If you comment out 'server role =3D standalone server' a=
nd
> >> add 'domain logons =3D yes', it becomes a PDC and a PDC (from 4.8.0)
> >> requires winbind to be running.
> >>
> >> Rowland
> >>
> >>
>
> Before Samba 4.8.0 , smbd could directly connect to the domain
> controller, from 4.8.0 smbd now needs to go via winbind.
> Now I know that you are not strictly running a PDC, but what you are
> running is the next thing to it, so I presume that you need to run
> winbind, you do not need to configure anything, just run winbind.
>
> Whatever happens, you should be aware that Samba is working to remove
> SMBv1 and things like PDC's with it.
>
> One thing I did notice from that last log, you are not using SMBv1, try
> adding these lines to the smb.conf:
>
> server min protocol =3D NT1
> client min protocol =3D NT1
>
> Rowland
>

It's probably also worth noting that doing this requires your LDAP
schema to contain all the fields you need to generate a valid passbd
entry for users. Do note that using this schema requires storing an
MD4 of your users passwords _and_ having those accessible to the file
server (hence discussion of this being a de-facto PDC). My general
feeling is that this goes beyond my risk tolerance for a production /
business environment.

Andrew

