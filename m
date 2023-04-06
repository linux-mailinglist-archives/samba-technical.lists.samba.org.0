Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 867516DA002
	for <lists+samba-technical@lfdr.de>; Thu,  6 Apr 2023 20:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+v8TvavxDbX9fWI/W0PYQhtQ0lJjBm1BFz3M6bjs3kc=; b=jr1HOVT2zTwUoo9MVA+VQKBsRy
	zf34XOdD1gaJ5+B67gD+6GjqQ1q4nEfw+0LIq6vX3S7pOS6cFQvsAUicgR/g9VCv/0u3ymefbvJew
	c3EJlci+kh/Uq74JqebfF3BQ9DntTUWkFVaO3sgEViDkGqm4cffxki05WFpQuail20x20/9O5uVKA
	AFdKtAqAzbenWySuFRNMNTVDfAg7VTK88ICOnOoeiCe+itq8U4hMhoJRz1GXDCmIbqgOLtgI8sOL2
	pNesEGC8zFqhrNW6fK9RP7SGgKEeSZpDBNdyDv7HNPRoJP96wQHL4dbGihZbLYoVM4+o7cf1ywt/A
	8nHZXpQg==;
Received: from ip6-localhost ([::1]:32042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pkUVk-009hxY-8f; Thu, 06 Apr 2023 18:39:04 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36385) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pkUVX-009hxM-Ux
 for samba-technical@lists.samba.org; Thu, 06 Apr 2023 18:39:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id jw24so3626178ejc.3
 for <samba-technical@lists.samba.org>; Thu, 06 Apr 2023 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680806329; x=1683398329;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+v8TvavxDbX9fWI/W0PYQhtQ0lJjBm1BFz3M6bjs3kc=;
 b=jTR3qDK5itl1Y8iiMQEes2HByZ3L/eo1mXgycBqoKuxtlSJFpz+56o92rc56KPXDmw
 Q9f+afIiY8NDqVEL512py1vyE8EaZw04KUjcQ1mv1EwNimAoWbMldC8XZfuIYllGE6VE
 X3fvOQAGMgqHNieSBe6aXRBa7pkOslMRHSF60IWCLRw5DYIcdVjC+Xxrx37ELvUFNpMI
 nBMZQDrDgnYQoB8NbPgUKGE9Xa6hEAH6uMvYmbrVasBAE+B4vmCtTO++1+wCfmYXZizj
 T7GXtzT2hyPdMxf0N7yRaG1NZm3E2jIDt6fIrt1N3NF3mYwSa4gHLaMXkvRLHPc/j6WB
 m5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680806329; x=1683398329;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+v8TvavxDbX9fWI/W0PYQhtQ0lJjBm1BFz3M6bjs3kc=;
 b=tenq4+ievkv+goFN4/UyqYA7i3A6RKG6YwsiWnGF6V0fFJSqI7yuBnFN2HQ1eA+tuJ
 IhyMa8jtD2xpos5p8V46ygPvpewxMYEeius2TZXVNaARLBO/+P9yW7+iyQFik7eWpVb8
 3BBVrLGu/Z5eCuFVfYTEdxT1CG0QogE4b0xO+iqlPP7TE64nb6saWzh7D9x3aGLzeeFH
 lOi09DEBmCY9mD7j7nPhs8h+2GGItHRkPkX+/G9m+9uc5+bRR241TQt1ofjGiYqn6X5x
 neVYjJZdt6HRagdmSB9yHv9P2akUYZDjf8G/uAuubb7HkqwMJdfVtYiDGyrn8fHQNGPy
 8eqw==
X-Gm-Message-State: AAQBX9cXhRlIKN27au+gNOFo+lb/+rJyjFs75Qtf51L4fy/8plqo2iNI
 eRhikZzDF2WW4TY3OkExWomvG093qS05M9li9WU=
X-Google-Smtp-Source: AKy350avMeFjCw2VOBggdvF1Xxr9xGc0lAu1U8B90WIPALPzIhQaFWyasQ0xv9SMDSpR5iA3gqp2q+iAKsR19SG+2Pk=
X-Received: by 2002:a17:907:6d0e:b0:8b1:38d6:9853 with SMTP id
 sa14-20020a1709076d0e00b008b138d69853mr3759879ejc.2.1680806328835; Thu, 06
 Apr 2023 11:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <6cf163fe-a974-68ab-0edc-11ebc54314ef@redhat.com>
 <7c7f01ba-66d0-c33b-21a5-800666bd97a1@talpey.com>
In-Reply-To: <7c7f01ba-66d0-c33b-21a5-800666bd97a1@talpey.com>
Date: Fri, 7 Apr 2023 04:38:36 +1000
Message-ID: <CAN05THSQgfmL9LfifEw4rxwcyfBUWoZ4pY3RWMWWYmGGq3+N8g@mail.gmail.com>
Subject: Re: [PATCH] cifs: reinstate original behavior again for
 forceuid/forcegid
To: Tom Talpey <tom@talpey.com>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com, pc@cjr.nz,
 samba-technical@lists.samba.org, Takayuki Nagata <tnagata@redhat.com>,
 lsahlber@redhat.com, sfrench@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yeah, an oversight.
Acked-by me

On Fri, 7 Apr 2023 at 00:32, Tom Talpey via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 4/6/2023 8:02 AM, Takayuki Nagata wrote:
> > forceuid/forcegid should be enabled by default when uid=/gid= options are
> > specified, but commit 24e0a1eff9e2 ("cifs: switch to new mount api")
> > changed the behavior. This patch reinstates original behavior to overriding
> > uid/gid with specified uid/gid.
> >
> > Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
>
> This looks correct, but I'd love to hear Ronnie's call. Looking at
> that commit, was it simply an oversight to set override_{uid,gid}?
> It kind of looks that way, but...
>
> Tom.
>
> > Signed-off-by: Takayuki Nagata <tnagata@redhat.com>
> > ---
> >   fs/cifs/fs_context.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> > index ace11a1a7c8a..6f7c5ca3764f 100644
> > --- a/fs/cifs/fs_context.c
> > +++ b/fs/cifs/fs_context.c
> > @@ -972,6 +972,7 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
> >                       goto cifs_parse_mount_err;
> >               ctx->linux_uid = uid;
> >               ctx->uid_specified = true;
> > +             ctx->override_uid = 1;
> >               break;
> >       case Opt_cruid:
> >               uid = make_kuid(current_user_ns(), result.uint_32);
> > @@ -1000,6 +1001,7 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
> >                       goto cifs_parse_mount_err;
> >               ctx->linux_gid = gid;
> >               ctx->gid_specified = true;
> > +             ctx->override_gid = 1;
> >               break;
> >       case Opt_port:
> >               ctx->port = result.uint_32;
>

