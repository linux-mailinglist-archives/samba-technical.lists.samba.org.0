Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5B79E948
	for <lists+samba-technical@lfdr.de>; Wed, 13 Sep 2023 15:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=S4ja49zLLX3s+631iV2RYu3JZOmzENJRvJh0tjnpALY=; b=aX9kJr4aSRClQ2rJHMouKhA2Wd
	8iRXBxG85nHY+26+N9aG27VsaqkbGhLaPY4C7s+Tc3hOoZP7UiDhiAchtMsB38PMSgxPOHJoDIbHm
	E5afDxpbOdE5QVeq08ZsKyuwhrQYB4PN3IRlpMTSKn7vOzIX9yqx8LfaUkRMEIWyiQxLQ/aQz29/e
	iz99QVsOjqGxX7XjIVpuwtBEI5t9NwRgBBnH3L80sLK7Abfh8nwk+wzu0uLrEhxClphKzJV9cQGx0
	lzSYPV61pDdIvMHI/6XoHu52dhABg+1jo1E06kQq7oJYeW8d4rQ49LeSUVsovRSX4V/222Tz9KyWd
	fzfeVqPw==;
Received: from ip6-localhost ([::1]:35316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qgPuD-003vsi-6b; Wed, 13 Sep 2023 13:27:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:57814) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qgPu3-003vsL-1e
 for samba-technical@lists.samba.org; Wed, 13 Sep 2023 13:27:41 +0000
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31dca134c83so6887468f8f.3
 for <samba-technical@lists.samba.org>; Wed, 13 Sep 2023 06:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694611654; x=1695216454; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4ja49zLLX3s+631iV2RYu3JZOmzENJRvJh0tjnpALY=;
 b=GqxgwrFDTXCkWLI85o4z6JPhkdmJhj7ZrZ110GSi5tNSjv0xSED/CGeogQh8eEhTFd
 6Sh0/oeMXe+sGNP+q0enKMy2m9CR7ab/F0skX7KVMdl15c9WVGBjCxZoWfyb+UUZH1Z6
 gmk0ZtRpSWWgr67qhhRfnPDyDzqyfzRzvtjjnmkpOXmhrJVHwD4cOR1n1a0ZntW/pZgX
 vIbMVhf/IUYV2F6YXVwbWKCwnVRN83frG+jTLEjBXBydRRe7Z8gnl1WV9LZnWMWF/KSl
 V768KxiIa2Cp7qmKp5HAVXV+Kux3n5l9pwZRruA7GzvNNLTtfx7ZUF2sOwo2I3bd5QDv
 RGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694611654; x=1695216454;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4ja49zLLX3s+631iV2RYu3JZOmzENJRvJh0tjnpALY=;
 b=ILXajxuHiIRKwE9I9DN9SvDqITm8SLA2+eTJzID+DDd5Hwca+FEdyKrbyU1AI6xJ30
 tPK/ETBecOu4adwTZKJYw/MWc0bMVIt5FZXkL/vz7u6XuWxia9dmYpEX/6m0m8WjRuAi
 f/vm4MFv7LqHUzl1orLfEwnL1ILtMWxtIXXbHw648Lm7sA3aCHs6p5sru10bVA2MPKxj
 gWfbJFJ8sqlm8DbKDnxG0n3WCL3uQ0Ny5A9ag4ScjrRPFwdmc1btcLnM3cyEt4jPoZHe
 Wa0rzcCALGLW2uP5nxLwzjMqxSCfBpegRrwrtxEtp+35bF7HCtj36cTpWu9rHgstbrOv
 vdiQ==
X-Gm-Message-State: AOJu0Yy54p0cusEi0u2wTODrLKSGonE7xGRoJ8dsgMFQQRnpZ+qilVdy
 OJP5cUC0a3WEMLOQol8PNNZuOhU0Vk7MaMRqAysesI1zHb4=
X-Google-Smtp-Source: AGHT+IG7QVbVDwtjuvvf9VXtVE9d0cAPUx9hTZOIYffl0MX6lwQD0GpK0XmOUZ5DyhblFUOPjGyLiPfoZgjai8kVbYQ=
X-Received: by 2002:a5d:55c1:0:b0:31d:d3db:4566 with SMTP id
 i1-20020a5d55c1000000b0031dd3db4566mr2188501wrw.4.1694611653597; Wed, 13 Sep
 2023 06:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAN25MDZ=Ue+OjgKDXeG9RZW2oWAaM65d_Vd=Q0gr_wazamUpCA@mail.gmail.com>
 <6d090bff41dad278b6b0a1f45f8ad7aa889c98a0.camel@samba.org>
 <CAN25MDZ6eufPc30FbH7i1GA6wSWMc0xTovn0a+NTUGF+0gwxmQ@mail.gmail.com>
In-Reply-To: <CAN25MDZ6eufPc30FbH7i1GA6wSWMc0xTovn0a+NTUGF+0gwxmQ@mail.gmail.com>
Date: Wed, 13 Sep 2023 14:27:21 +0100
Message-ID: <CAN25MDaSVOzSNZZZh8MxFdn928=TaSaDWuBR73=tXo5oR7NJaA@mail.gmail.com>
Subject: Re: [Samba] winbindd with LDAPS
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
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
From: "jose.celestino--- via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "jose.celestino@gmail.com" <jose.celestino@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Andrew and all,

We managed to delay the change to LDAPS but it seems inevitable, and
we're being pressured to make the change.

What is the proper way to discuss the possibility of developing what
we need to make it work?

We currently have no internal resources to do it, but are willing to
sponsor the needed work.

On Fri, Apr 21, 2023 at 10:03=E2=80=AFAM jose.celestino@gmail.com
<jose.celestino@gmail.com> wrote:
>
> Hi Andrew,
>
> I'm assuming that simply hacking the Samba code to connect to LDAPS
> instead of LDAP wouldn't work (other workarounds we tried: connecting
> to a local endpoint and stunnel it to the remote LDAP, for instance).
> There should be TLS channel-binding also on the LDAP connection?
>
> Anyway, are you, or anyone on the Samba team, willing to develop the
> needed LDAPS support?
>
> Can I pass your contact to the project admins to discuss that?
>
> Thank you.
>
> Best regards,
> Jos=C3=A9 Celestino
>
> On Wed, Mar 8, 2023 at 6:49=E2=80=AFPM Andrew Bartlett <abartlet@samba.or=
g> wrote:
> >
> > On Wed, 2023-03-08 at 12:58 +0000, jose.celestino--- via samba wrote:
> > > Hi,
> > >
> > > We have a samba installation (4.17.5) where a winbindd is part of an
> > > AD domain and used to authenticate radius (radiator) logins.
> > >
> > > The thing is, the AD administration is closing port 386 on the
> > > password server and only allowing requests on 636 (ldaps).
> > >
> > > I don't seem to be able to change the winbindd to use the ldaps port.
> > > Tried
> > >
> > > ldap ssl =3D start tls
> > > ldap ssl ads =3D yes
> > > tls enabled =3D yes
> > >
> > > but both the net join and the ntlm_auth go to port 386 and will cease
> > > to work as soon as that is disabled.
> >
> > This won't work, for the cases were LDAP is used.  This is typically
> > for idmap_ad operations and similar.  Samba uses, just as windows
> > clients do, a Kerberos secured connection on port 389, when it contacts
> > the AD DC.
> >
> > In the past efforts were made to allow connections wrapped with TLS
> > safely, but this was abandoned.
> >
> > There are a number of issues, in particular the need to implement
> > 'channel bindings', to tie our inner Kerberos authentication to the
> > outer TLS tunnel.
> >
> > If this is absolutely critical, then a development effort could be
> > started to finish that work.
> >
> > The removal is here:
> > https://bugzilla.samba.org/show_bug.cgi?id=3D14462
> >
> > Sorry,
> >
> > Andrew Bartlett
> >
> >
> > --
> > Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> > Samba Team Member (since 2001) https://samba.org
> > Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
> >
> > Samba Development and Support, Catalyst.Net Limited
> >
> > Catalyst.Net Ltd - a Catalyst IT group company - Expert Open Source
> > Solutions
> >
> >

