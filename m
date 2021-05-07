Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6D375F16
	for <lists+samba-technical@lfdr.de>; Fri,  7 May 2021 05:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HBFqpGmN1W6Fp7mBmdC2+sAFz0IgPW30ceYSM4x3edw=; b=1C4GogUGlOeqPxZOzxDE8rdbQB
	rslvguI5cSS3kFtAUKgNtewePyZRdeeNvkU2EENCjhYbNX9wwEi2frgYjUlfWDip8aQcwtSWogdTG
	5G3+HVSnN3AbZL8eAsTRu9G7v21cnWvuzYSPqUbLO0FrAA6dtSjglvIF0tdGjPrLfwotS8UayfX5c
	+RNRnhagpmv9ZSAypWOimloXtE0A3wwMBmtx/zkamsr4I7jz3W6KiUHwaE85ivl5V7PN4dDRtfNUY
	aPF01kOOyRavZi2QlQVhfIGfvlBTCsOrJ29TkrGGQ7vFClQ0Ez9DYVX9TXMqyBADnqCKxZ2E2PzDw
	ZWzgjvDA==;
Received: from ip6-localhost ([::1]:61288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ler0d-00G82g-Ab; Fri, 07 May 2021 03:18:35 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:37683) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ler0V-00G82W-Fm
 for samba-technical@lists.samba.org; Fri, 07 May 2021 03:18:31 +0000
Received: by mail-lj1-x235.google.com with SMTP id b7so9750573ljr.4
 for <samba-technical@lists.samba.org>; Thu, 06 May 2021 20:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HBFqpGmN1W6Fp7mBmdC2+sAFz0IgPW30ceYSM4x3edw=;
 b=njSY7s5NHX8EU6p5FOeiI6mtitoISrjBjZLqzqu34hX6PdoeBshIM+1qQ7xQtnc5np
 da/vZqZk+Yyt7m/peYU8v3ZdqcxeqeA7dLoppKPcUEPT7IT9yCUSq5KZ/dei3oMEBpVc
 D96R/gYgEwXIo6aG93xP5B9QhcBcYn76HjP/DGb5vvjqWm7F7cVZ28MBD+CSRbVkHWfe
 CdFfcJMv3VJ8UKWZSCqjE5vq7v4KuH9OAS7vE/Qk4q0SGY04EylSYyVJQeks2C+yrQS2
 QahzVZnYgYvxUeJRqgWZ2PfqrMAapuwZVzWDJsSC9gedEE5oDK3Mb2sTo1AtbvCbEm2o
 JwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HBFqpGmN1W6Fp7mBmdC2+sAFz0IgPW30ceYSM4x3edw=;
 b=pTgshGIbCgSuEPWcH9cS47thEexrPUlS6pt0jXg1CUwX+CUqch8p/8IAS9crwK0JRx
 1ZxV7aUVX0AFwCTrQ6kEQkTkWsLAIc6E6YvwILhvqKT11Y8/OjANBqbH98oAMNBjU9ov
 VnnOobjbWhWZGcgObSrIHVPwhpPfCsKQEQUz+D6Fj+gtqKcfJ9CA7N5fKrH2DmFKnSP5
 r1RMxfhWcHIsIiK0OYaeTa+E8EKzKnX5y3BwI8HUbHmvBJ3oeJDF24Ygs62/GLMhrPhz
 9JHotUkLESMZQ7jqVh4pfaUkIlQVg2/qpq3Kza+g1DnG3GQX0ExFEm0WsFra5iVf+/pu
 wqFQ==
X-Gm-Message-State: AOAM5324ehabuwn5KYDF9YJD3fEUt8oScRV5YCgixC2DVl3M6Nob1SmG
 6aRZcLs4hGW0Y1L8aoOyGY1B5aO23Hkm+JMszL8=
X-Google-Smtp-Source: ABdhPJwixbAdTagtoBim3U1oMZHnZLodOTtM6lK3KmFF13x3WmPYM7/HCaBkQVhf9gOXVbswbNBkstMtCiAwRYYx6jo=
X-Received: by 2002:a2e:7f03:: with SMTP id a3mr5899001ljd.406.1620357504718; 
 Thu, 06 May 2021 20:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org>
In-Reply-To: <c2b84e56-87c6-469d-c272-02731cb0937c@samba.org>
Date: Thu, 6 May 2021 22:18:13 -0500
Message-ID: <CAH2r5msBg3g4w0L6ngAqf9XKe3jFFFjDdE5hKH2_MgyUgNZnNA@mail.gmail.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
To: Stefan Metzmacher <metze@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 6, 2021 at 7:17 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> Hi Steve,
>
> > +/*
> > + * Dump full key (32 byte encrypt/decrypt keys instead of 16 bytes)
> > + * is needed if GCM256 (stronger encryption) negotiated
> > + */
> > +struct smb3_full_key_debug_info {
> > + __u64 Suid;
> > + __u16 cipher_type;
> > + __u8 auth_key[16]; /* SMB2_NTLMV2_SESSKEY_SIZE */
>
> Why this? With kerberos the authentication key can be 32 bytes too.
>
> Why are you exporting it at all?

I don't remember the original reason for why it was thought wireshark
could use this.

Aurelien,
Do you remember the context/reasons for each of the exported fields?

-- 
Thanks,

Steve

