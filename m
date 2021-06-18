Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EE83AC5E0
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jun 2021 10:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+RHQanO8XxRUQvDL5OhIFpFoMI5OC3nucAzf/oFMzh0=; b=i1AkWNFCIqU5NK8L4mYvzKYb0E
	a+jojdPar1NWCAN3m8m7TmYVjrlhrxdaueY6L0fFI5dGQVJAcvzNsYukrng5McjKtjOW0Rpv1YkXA
	LH0F1ekLS2WHFNmjiNQ+yjw4lZyfXAkypz+SOko4JFI+0fl3uaQ2mJsYKqCDqkBdKuyeiAnZMY8hh
	IvrfAua4VSorg6b7HF+iaM2QQuQGGIj0ALVCSEDCCwZwOikndaYTl29Sie/7QPq4LSzj4thThYBZd
	/FEefVl4oqLUxphVDd8NkGqM0anWvhJOir3IKvOTfrXg2yJ20mFm1B/HWfcFn15+jpeQ/QbYW5Ao0
	lESx6F4w==;
Received: from ip6-localhost ([::1]:45680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lu9jP-006km9-JT; Fri, 18 Jun 2021 08:20:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51175) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lu9jK-006km0-SM
 for samba-technical@lists.samba.org; Fri, 18 Jun 2021 08:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624004395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Ycm48i0QDdQUex/mwDZbOjl/l2ewbfl51kJ/eoB5PI=;
 b=i4INhimwSZ0Jyq83siemQpZE5hE6egsYMiG1Q0zpy5oUd3IUIqx1FmmbaeBfdHWBgtaE+p
 VHY2fiJerMJPBOpatG7zH5kWBBMWykPM8J6mrbQggExzZvrdbQ36CS31Vg2UCrFyYoeyib
 NsIVF+mMdyITOPnft5QV3N3JrAaIcqk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624004395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Ycm48i0QDdQUex/mwDZbOjl/l2ewbfl51kJ/eoB5PI=;
 b=i4INhimwSZ0Jyq83siemQpZE5hE6egsYMiG1Q0zpy5oUd3IUIqx1FmmbaeBfdHWBgtaE+p
 VHY2fiJerMJPBOpatG7zH5kWBBMWykPM8J6mrbQggExzZvrdbQ36CS31Vg2UCrFyYoeyib
 NsIVF+mMdyITOPnft5QV3N3JrAaIcqk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-Sp43ce1-PsOt9DUTRW1yrg-1; Fri, 18 Jun 2021 04:04:15 -0400
X-MC-Unique: Sp43ce1-PsOt9DUTRW1yrg-1
Received: by mail-pj1-f71.google.com with SMTP id
 j8-20020a17090a8408b02901651fe80217so6010530pjn.1
 for <samba-technical@lists.samba.org>; Fri, 18 Jun 2021 01:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Ycm48i0QDdQUex/mwDZbOjl/l2ewbfl51kJ/eoB5PI=;
 b=bGjB/CmuxJWicmGnl4La8jhFo+ywn+pIRZaUD3SQ5lNZ5zJipHuAQHezdNO0VaVV3G
 7eOQixSwcJng2XFP2GKuWyRGnAr3sLANLOzVzTzBtNY6PhlTzi+48H8dMysJZExTd+B7
 Xio8KBcKNJtKPmN2rChifoBDrW0A/tHroLvKq9qkqPFEuoGOgCXHMzgkv4904ETU8n6I
 SIEWPs6wkHOptrx9iqqo+b9fNoNY5436KXo57gYwJTyejdaEF8/5vkZfYXjM0q4aJd2H
 rKDNW3UrehV2S+IJcg3eQrRA43uHveeHRfMnBWVpw5gGl1b8+dgexLuvddhW1PUf7b1m
 JWfg==
X-Gm-Message-State: AOAM532o+rECedw0y64cOyNriDv1q5VZ5owgo5rbBeJ/AOMLITBTywwP
 HVQpgpxwYOrh17S8px2oq8uWPJHnor5+v4vxC+o/jC50aQtwX1ViDGQVB5BcOkiYUPMHev5cmmR
 /gvgjIN8MqjQ1wn5oogKVQPhXGZnlF83V7TnFBTrks/0U
X-Received: by 2002:a17:90b:108f:: with SMTP id
 gj15mr10142988pjb.124.1624003454441; 
 Fri, 18 Jun 2021 01:04:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykGWcI6Nx+g1x+Vl78/qcNRT0sFBALj3j+UurLXqUC4oKHb3f4wjNhd7j7PG6hnWwodQ+A4I8lg17RMp6KHzo=
X-Received: by 2002:a17:90b:108f:: with SMTP id
 gj15mr10142958pjb.124.1624003454085; 
 Fri, 18 Jun 2021 01:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcb10vV+557J6mTRRw+tjTh8x34b0tud-7V2GYkzCTOMgquxw@mail.gmail.com>
 <20210616195129.GA669059@jeremy-acer>
In-Reply-To: <20210616195129.GA669059@jeremy-acer>
Date: Fri, 18 Jun 2021 10:04:03 +0200
Message-ID: <CAEcb10tbH=eH-pwg6dRadrzHUczxwDMuj2hokBs6u4+YfJG6bw@mail.gmail.com>
Subject: Re: duplicit LDAP calls
To: Jeremy Allison <jra@samba.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Here is a commit (it is part of MR 1999) that avoids duplicit LDAP searches=
:

https://gitlab.com/samba-team/samba/-/merge_requests/1999/diffs?commit_id=
=3D9e8a41a07dfdbb05f854f54fd6cd49022031cd3a

Before the fix 'net ads changetrsutpw' issued 35 identical LDAP calls
within ads_keytab_create_default(). It was processing only the default
SPNs, with additional SPNs there would be even more calls. After the fix
there is only one LDAP call.

Cheers,
Pavel







On Wed, Jun 16, 2021 at 9:51 PM Jeremy Allison <jra@samba.org> wrote:

> On Wed, Jun 16, 2021 at 10:49:18AM +0200, Pavel Filipensky via
> samba-technical wrote:
> >Hi,
> >
> >during my my learning/observation of how machine account password is
> >changed via net ads changetrsutpw I have noticed that two same LDAP call=
s
> >are done in ads_keytab_add_entry() in source3/libads/kerberos_keytab.c  =
:
> >
> >391 =E7=8E=AF=E8=B4=A9=E8=B4=A9=E8=B4=A9my_fqdn =3D ads_get_dnshostname(=
ads, tmpctx, lp_netbios_name());
> >
> >...
> >400 =E7=8E=AF=E8=B4=A9=E8=B4=A9=E8=B4=A9if (!ads_has_samaccountname(ads,=
 tmpctx, lp_netbios_name())) {
> >
> >
> >Both ads_get_dnshostname() and ads_has_samaccountname() call
> >ads_find_machine_acct() and trigger exactly same LDAP search and get the
> >same response. I guess there are more places where an unnecessary networ=
k
> >call is done, but at least for this case it is easy to refactor the code
> to
> >avoid it. Does  it makes sense to gain performance for possibly less
> >structured code?
>
> Depends on the code changes, but yes, that does seem
> a useful fix !
>
> Thanks !
>
>
