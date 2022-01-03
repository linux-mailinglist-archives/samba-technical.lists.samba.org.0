Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F260E4836CD
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jan 2022 19:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WQM6NkYf8w5RZh5by65LWjSlOEwA6UQEhcnv6PETkkc=; b=0Hl8lVujonQw4G5bztIYcTvo+G
	BMmBpUM2oiDavOccy3KkfUWcwZC4b1hoy6hVzOqfq9Y1p85rCq5pcv0ZwCZEeh0a+Mn07pjFiHKkn
	1MKztiNl/Amb/ZNQwdCQO40PZuAoB3m8QgWLKH/QGD0jgCoPFFqRZ1v2YLXuoFBkGsy4yGn8MYAfh
	zbQQalqG1g7Jt01fCjBSW6CR3tMeA7ste1Z36x1b7/IFrLoeAREVreF89hxWHT7BJrMJGoixLn9Pj
	+6nnMw2xU3CDbZKIqfY++/w7LpQJV1r2VUzzuOOAB4/p54vzsYSaed0/1xHIqCoVqyZVHKHRArH8b
	B2hPXP7g==;
Received: from ip6-localhost ([::1]:41462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n4S1P-004ZXT-SW; Mon, 03 Jan 2022 18:25:27 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:39892) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n4S1C-004ZXK-Sl
 for samba-technical@lists.samba.org; Mon, 03 Jan 2022 18:25:19 +0000
Received: by mail-io1-xd36.google.com with SMTP id y11so36031935iod.6
 for <samba-technical@lists.samba.org>; Mon, 03 Jan 2022 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WQM6NkYf8w5RZh5by65LWjSlOEwA6UQEhcnv6PETkkc=;
 b=Fp/wj7Nv4OzciEZYV4nC0uZNBQGGmAzEa4VMsxWHkzF3Va/Jr3DMDsk6MitMU32s25
 KphHPYDeZyXVJEnBbKVEHEcPzJObUEEVY8rx9RYpufKKQ7CFr6qN/li8BC8IIrgZffCn
 Kce5TWEBp1wUavxGd2M2f7QWSPQVVMMfKh8CYXMICXWhZPsdszZhWavqVjWXTc66uKDz
 aeKBFArSgys9FeQirLEcpfba+oVk0TmiByblHQ3lEk9iDSExkaHF31F5PbLp5xNiUagP
 JwYSXMbf7Wp6SxcSkN2c92+eeHRX6UbGV6HPLwlOqGY8TpjwNN8LvGSQgv5nmN5NbIPp
 PY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WQM6NkYf8w5RZh5by65LWjSlOEwA6UQEhcnv6PETkkc=;
 b=GjXOPJULap2Yd99xaYSK5zkivnsU01TCywWGAkY0vbSPYxgFIMIEZNeqld8jusnqu8
 nLwEHTWbFWxWDbuoeSIip5HAOsl2FzBvQzcK/bFys04Wt0d304v1jaVJSy6oODOgXu1R
 g69/J5FnWVPMEnN1EBOR4rsmA0o6brzThdUiekioQxAnJGOwMn/XVTWMlhPnrZcuKZ2H
 RwZ53/Cn0/Di7QoINX5XVar+l4IqNgF+IvHvCjANtwh3uOh9x7cOB0q5XPh73KNXfQN/
 YVPj8xakFDSQwLsLgHvGFl2h78HMsFFylcA/bp2bva23PYEfa6DRvs+IeWTPrcNrEqyx
 E4mA==
X-Gm-Message-State: AOAM533YiusvVNWReaj/1X51nRXnr5ZIh3cYba6U/pQwNP8s3d/dbokQ
 hrGuiX6rIEYIL6QN9dhHDbH1qCrWzs8DGQ5STcM=
X-Google-Smtp-Source: ABdhPJz0ndd6Shfi2XVeS2RyUMvvp881O4TZ1OmoiL8HVf/SRr5TD97rwrLb3f1K/sLVTyaM4MYRW5RdpeBu91RbgFI=
X-Received: by 2002:a05:6638:160c:: with SMTP id
 x12mr22541684jas.1.1641234312246; 
 Mon, 03 Jan 2022 10:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20220103145025.3867146-1-amir73il@gmail.com>
 <69FC68E2-31C6-493A-BC60-ED1DF5860FC2@amazon.com>
In-Reply-To: <69FC68E2-31C6-493A-BC60-ED1DF5860FC2@amazon.com>
Date: Mon, 3 Jan 2022 20:25:01 +0200
Message-ID: <CAOQ4uxjY3b5_1WCL3hpy27h3VkGfH1+6BTKF35aXexjuFvE+cA@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix set of group SID via NTSD xattrs
To: "Protopopov, Boris" <pboris@amazon.com>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Pavel Shilovsky <pshilovsky@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jan 3, 2022 at 6:56 PM Protopopov, Boris <pboris@amazon.com> wrote:
>
> Hello, Amir,
>
> It has been a while, but I recall that from my reading of the MS docs, th=
e notion of "owner" was supposed to include both user and the primary group=
 SIDs, which is why the comments in the code did not call out groups explic=
itly.
> I also recall that during development, I tested with CIFS_ACL_GROUP flag =
against Windows 2012 and 2019 servers, and did not see a difference. I did =
not test against Samba, which clearly, showed an issue discussed below.

Interesting.
I admit that the language of the docs is ambiguous:
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/ee9614=
c4-be54-4a3c-98f1-769a7032a0e4
"...flags indicating what security attributes MUST be applied".
So attributes whose flag is not set (e.g. group SID) MAY be applied or
MUST NOT be applied?
Perhaps samba would want to be as relaxed as Windows about the ACL_GROUP fl=
ag.

In any case, I don't see a reason not to set the flag when the group
SID information
is present.

Thanks,
Amir.

>
> Boris.
>
> =EF=BB=BFOn 1/3/22, 9:51 AM, "Amir Goldstein" <amir73il@gmail.com> wrote:
>
>     CAUTION: This email originated from outside of the organization. Do n=
ot click links or open attachments unless you can confirm the sender and kn=
ow the content is safe.
>
>
>
>     'setcifsacl -g <SID>' silently fails to set the group SID on server.
>
>     Actually, the bug existed since commit 438471b67963 ("CIFS: Add suppo=
rt
>     for setting owner info, dos attributes, and create time"), but this f=
ix
>     will not apply cleanly to kernel versions <=3D v5.10.
>
>     Fixes: a9352ee926eb ("SMB3: Add support for getting and setting SACLs=
")
>     Signed-off-by: Amir Goldstein <amir73il@gmail.com>
>     ---
>
>     Boris,
>
>     I am a little confused from the comments in the code an emails.
>     In this thread [1] you wrote that you tested "setting/getting the own=
er,
>     DACL, and SACL...".
>
>     Does it mean that you did not test setting group SID?
>
>     It is also confusing that comments in the code says /* owner plus DAC=
L */
>     and /* owner/DACL/SACL */.
>     Does it mean that setting group SID is not supposed to be supported?
>     Or was this just an oversight?
>
>     Anyway, with this patch, setcifsacl -g <SID> works as expected,
>     at least when the server is samba.
>
>     Thanks,
>     Amir.
>
>
>     [1] https://lore.kernel.org/linux-cifs/CAHhKpQ7PwgDysS3nUAA0ALLdMZqnz=
G6q6wL1tmn3aqOPwZbyyg@mail.gmail.com/
>
>      fs/cifs/xattr.c | 2 ++
>      1 file changed, 2 insertions(+)
>
>     diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
>     index 7d8b72d67c80..9d486fbbfbbd 100644
>     --- a/fs/cifs/xattr.c
>     +++ b/fs/cifs/xattr.c
>     @@ -175,11 +175,13 @@ static int cifs_xattr_set(const struct xattr_ha=
ndler *handler,
>                                     switch (handler->flags) {
>                                     case XATTR_CIFS_NTSD_FULL:
>                                             aclflags =3D (CIFS_ACL_OWNER =
|
>     +                                                   CIFS_ACL_GROUP |
>                                                         CIFS_ACL_DACL |
>                                                         CIFS_ACL_SACL);
>                                             break;
>                                     case XATTR_CIFS_NTSD:
>                                             aclflags =3D (CIFS_ACL_OWNER =
|
>     +                                                   CIFS_ACL_GROUP |
>                                                         CIFS_ACL_DACL);
>                                             break;
>                                     case XATTR_CIFS_ACL:
>     --
>     2.25.1
>
>

