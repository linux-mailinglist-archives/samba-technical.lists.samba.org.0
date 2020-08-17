Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87369245E43
	for <lists+samba-technical@lfdr.de>; Mon, 17 Aug 2020 09:44:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nZ291D7493G0232HhioCAtFEX4/fiTTc6k8SEOXrzEo=; b=3PQYAi7OT0obTiaCkQ9U98UQTt
	Y2PMP6OBHGKo0uDJfuTnGxtmfeiNcF/oqtqXdjAfVODsssn497Uukhd79NSpxqda6bzPg2D6tru0M
	5kSYQRhqLrlqRVyNYIH3MEhXnCKkSfgDEbgKfI+tS0RaJurmIXOyDlPAufi5GaA8KLM/LCH+jm4wu
	Db3NQjth03Am4S7n53JRGzo0K9sdb+Hk8T5WK/0KB77mrt0tI1GW4WK9b0vYXBuB9vc6f81kks75S
	KxIJb0DAaktU9aINPqQQxuKyFoE4fkUu9yq62MDlLj2z+YvTyxnQbPxIZ+EioZzDPpDe6sgJOUz9L
	KEDKi3Pg==;
Received: from localhost ([::1]:63936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k7Znb-00Dzk6-7Q; Mon, 17 Aug 2020 07:43:19 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k7ZnR-00Dzjz-Bl
 for samba-technical@lists.samba.org; Mon, 17 Aug 2020 07:43:12 +0000
Received: by mail-yb1-xb35.google.com with SMTP id u6so3087348ybf.1
 for <samba-technical@lists.samba.org>; Mon, 17 Aug 2020 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USACV5aOJgK3vUZeLWzoWzApWxAVDdij2alJ3bVZx8Q=;
 b=Egd5U6p2REAozV4OH6kRgYNeyDN1NAQXkzzk2rioksaqeuxW6qHa8p496jwUo5Id9i
 Gans0O8wlf07ALFxM8KyZkX8hn6D1pINKnIC6sZhWn3yWK8S4iU6BH8/nujaRlFWpaYT
 FDiuWCpltpIHeESzDCWh23B6nHhN+Jj+ZrwOCz7FJ80Sj7QyJYOkssaICygU7i52QSzO
 LErt3pO+ZFHAo1CMtQ2PYcO3qmcwtc2ny9XKmljpr5T/5e7UWq/zJY+yBXI8/dTxc7AK
 D1uxTbe/J38MBnFcNvRZ35ZhSGP5IxnB/DHV2v8eVx4rhvDNH2ULM8pGds5XBVUNBpgW
 w7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USACV5aOJgK3vUZeLWzoWzApWxAVDdij2alJ3bVZx8Q=;
 b=fmaOkaT1U24nbCu9gpZpo9AuEd7BN3c42YsiCVlh7fqoCcXAgQS/N8G69Q7uc7Og9V
 OPoDkq1ERf7YpLN2LDQSZkB1ZSBxev89c+eyzIXZx4S4eAkfZ3E+taSdoqEVkpaMLKAA
 xn7kegk++qv/wiB/+5aBO0REAom1wXW9WgLnFUwXy2RyBVTybM1dWHUBh9AijcOwLTgy
 aB7Dfpp/Iz8OV5g87wSxRkdMKqfCK5rINx+pfhkj3kmMT5l3uQSgYtWZY+GSYg4t4ZIW
 7BIMYXEiSnbS3O/Wj8f8UpUe5w+dQUn+0PUqXg9DUUujw6yHhXbDjklxH8/3bvkVzUP2
 Jd3Q==
X-Gm-Message-State: AOAM5316CY1+KD9Gvw9pl/Ys3CYMiPKf7fEQ6TO/X8Ynj6YT4Q/eEbhM
 npi3OfO27c002EewulZAEGnNNa+jP/TtRJC/KfE=
X-Google-Smtp-Source: ABdhPJySht5L9s6DHwwBNj9miFp1nevxD+ffbdFSbJ9XbQQFuz2ijbm9E88U6vm7B9HIue0fpwfNjZms6rdKtcIpFqs=
X-Received: by 2002:a5b:308:: with SMTP id j8mr17666312ybp.185.1597650187385; 
 Mon, 17 Aug 2020 00:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
In-Reply-To: <87pn7t4kr9.fsf@suse.com>
Date: Mon, 17 Aug 2020 13:12:59 +0530
Message-ID: <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Aur=C3=A9lien,

Thanks for the review. Please read my replies inline....

On Fri, Aug 14, 2020, 15:22 Aur=C3=A9lien Aptel <aaptel@suse.com> wrote:

> Hi Shyam,
>
> Shyam Prasad N <nspmangalore@gmail.com> writes:
> > Currently, for sec=3Dkrb5, mount.cifs assumes that the kerberos TGT is
> > already downloaded and stored in krb5 cred cache file. If an AD user
> > is logged in through ssh or su, those utilities authenticate with PAM
> > (winbind or sssd), and winbind/sssd can be configured to perform
> > krbtgt house-keeping (like refreshing the tickets). However, if the AD
> > user is not logged in, and the local root user wants to mount the
> > share using the credentials for an AD user, he/she will need to resort
> > to manual kinit, and this does not go through winbind/sssd.
>
> That is correct, I think. Note that using when login in the system PAM
> also sets up KRB5CCNAME variable that points to the credential cache
> (e.g. "FILE:/tmp/krb5cc_0") and is then inherited in all processes in
> the session.
>
Agreed. But since we're not dealing with krb5cc file directly in
mount.cifs, I don't see it influencing this change. However, I will test it
out too.

>
> > Attached patch will introduce PAM authentication in mount.cifs. If
> > sec=3Dkrb5 is specified, mount.cifs will attempt to authenticate with
> > PAM as the username mentioned in mount options. If the authentication
> > fails, we fall back to the old behavior and proceed with the mount
> > nevertheless.
>
> Shouldn't we do it the other way around? i.e. try to use any existing
> credential cache, and if that fails auth again with PAM. I think we
> might end up overwriting an existing cache or logging in twice
> otherwise.
>
That does make sense. I was thinking of including a mount option to enable
this path. But let me explore the retry-on-failure path as well.

>
> > @linux-cifs: Please review the overall flow, and let me know if there
> > are any issues/suggestions. The feature is enabled by default in a
> > configure parameter (krb5pam), and can be disabled. Do we also need a
> > new mount option to trigger this new behavior? (try-pam-auth?)
>
> > @samba-technical: Please review the overall flow of PAM
> > authentication. Currently, I'm mainly doing pam_authenticate and
> > pam_setcreds. Is there any added benefit opening and closing session?
> > Is it possible to call pam_open_session from mount.cifs, and then call
> > pam_close_session in another binary (umount.cifs)?
>
> I am not 100% sure about this but I think the session should be opened
> in the context of the parent shell process to be able to be persistent,
> otherwise the session will close when mount.cifs exits. Maybe there is a
> way to pin the session on a different processes... But most likely there
> is an existing session opened by PAM when the user initially logged in
> the system (regardless of the PAM backend/params).
>
Yeah. I didn't get the complete picture on session maintenance after
reading the pam application developer's guide.
Was hoping that somebody on samba-technical would have some idea about this=
.

>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>
