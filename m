Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F25FC24476E
	for <lists+samba-technical@lfdr.de>; Fri, 14 Aug 2020 11:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=qa+ZVFLJ18lRPlulkGcrCNzMd+/TRB2dMmZN3NxOOH8=; b=uVVYgfhpdjJk2ke+z62wXgLZLT
	Uv//UeV7J+3jKR+/HKN9q3eixA8jrjsuKEtHbDbVB8Q6hbBNw4Uac5mmxve3I2GLWDPDxN7F+80/C
	SUQ4keDsFUVUl/QaWK8wD2zjQ3lf2eZKTI8DGv4y1hy2E4bTyq90Kct2GU3LOhOtv/p+1gTu/4chI
	/a4quUMVW0mycJN9zHUdB3izsP8YSmiVbpl3uRzH7XUZA10z4dPab467dca7HDK528cNXbssMN6Pg
	WXnl+peTnHowuquUJG21O9A4b4HHeW9lNtgkMuXcErOqm6Wlkx0rlCVTVrbc5DlbYxl9KZez7y94j
	xW/ZQg7Q==;
Received: from localhost ([::1]:20358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k6WOJ-00Dfqx-Qr; Fri, 14 Aug 2020 09:52:51 +0000
Received: from mx2.suse.de ([195.135.220.15]:46144) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k6WOE-00Dfqq-NU
 for samba-technical@lists.samba.org; Fri, 14 Aug 2020 09:52:48 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFDE8ACB0;
 Fri, 14 Aug 2020 09:53:06 +0000 (UTC)
To: Shyam Prasad N <nspmangalore@gmail.com>, CIFS
 <linux-cifs@vger.kernel.org>, samba-technical@lists.samba.org, Pavel
 Shilovsky <piastryyy@gmail.com>, Steve French <smfrench@gmail.com>,
 sribhat.msa@outlook.com
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
In-Reply-To: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
Date: Fri, 14 Aug 2020 11:52:42 +0200
Message-ID: <87pn7t4kr9.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Shyam,

Shyam Prasad N <nspmangalore@gmail.com> writes:
> Currently, for sec=3Dkrb5, mount.cifs assumes that the kerberos TGT is
> already downloaded and stored in krb5 cred cache file. If an AD user
> is logged in through ssh or su, those utilities authenticate with PAM
> (winbind or sssd), and winbind/sssd can be configured to perform
> krbtgt house-keeping (like refreshing the tickets). However, if the AD
> user is not logged in, and the local root user wants to mount the
> share using the credentials for an AD user, he/she will need to resort
> to manual kinit, and this does not go through winbind/sssd.

That is correct, I think. Note that using when login in the system PAM
also sets up KRB5CCNAME variable that points to the credential cache
(e.g. "FILE:/tmp/krb5cc_0") and is then inherited in all processes in
the session.

> Attached patch will introduce PAM authentication in mount.cifs. If
> sec=3Dkrb5 is specified, mount.cifs will attempt to authenticate with
> PAM as the username mentioned in mount options. If the authentication
> fails, we fall back to the old behavior and proceed with the mount
> nevertheless.

Shouldn't we do it the other way around? i.e. try to use any existing
credential cache, and if that fails auth again with PAM. I think we
might end up overwriting an existing cache or logging in twice
otherwise.

> @linux-cifs: Please review the overall flow, and let me know if there
> are any issues/suggestions. The feature is enabled by default in a
> configure parameter (krb5pam), and can be disabled. Do we also need a
> new mount option to trigger this new behavior? (try-pam-auth?)

> @samba-technical: Please review the overall flow of PAM
> authentication. Currently, I'm mainly doing pam_authenticate and
> pam_setcreds. Is there any added benefit opening and closing session?
> Is it possible to call pam_open_session from mount.cifs, and then call
> pam_close_session in another binary (umount.cifs)?

I am not 100% sure about this but I think the session should be opened
in the context of the parent shell process to be able to be persistent,
otherwise the session will close when mount.cifs exits. Maybe there is a
way to pin the session on a different processes... But most likely there
is an existing session opened by PAM when the user initially logged in
the system (regardless of the PAM backend/params).

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

