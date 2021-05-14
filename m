Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49698380DB9
	for <lists+samba-technical@lfdr.de>; Fri, 14 May 2021 18:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hbs58K5TlV2bJvEoYy+ewLKsVKD8mWsVRSkrb6/1M38=; b=PsCGeTXld6wEIXyzQh/XGe+tqU
	PPwBZ9DcoNolFDCLEtP741KwCDn992LedUOhTlcWch1gfw5TW58e11+3DzBQT6WbDxOYSlEzsaa9t
	GgY1u0brYlzWiCSIajOneO9U6XHYLrUgDcZdaKAnak8w/Dd0Ir2cKC8r2Y6dRxijg0GXmfIIgGXuF
	D+mmFb6NxYP9ctyxd/GfdhaCHsg2yVgZZ9ovbOr5ht5iBwcgZjGVe1EUrE3Da4GfN3jdi1dDv+aMt
	9L0Ii9ECvAMwtfNNxDCgwjm3UhyZ3dGWMbal3Ai+6t8i+AvtHXLaUEi7cDkyExPUPHdEer+QdOeQv
	AwWsI/0A==;
Received: from ip6-localhost ([::1]:40098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lhaGN-000I46-Lh; Fri, 14 May 2021 16:02:07 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:44735) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lhaGH-000I3x-CU
 for samba-technical@lists.samba.org; Fri, 14 May 2021 16:02:03 +0000
Received: by mail-lj1-x233.google.com with SMTP id s25so13765651ljo.11
 for <samba-technical@lists.samba.org>; Fri, 14 May 2021 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hbs58K5TlV2bJvEoYy+ewLKsVKD8mWsVRSkrb6/1M38=;
 b=aWERtuBkNybSMk+QQY4cJ521GkTSpqS+FEMVRqjP4xHxSm0FHJcHPlsDD2wVkwOuZN
 Dbz29Dd6wbD5VElVLOFCSBMnLBIF2//VJjmI25M+DHPp/ooQjvhBOx6n50Nhm3aJIDC7
 gnOpzHv49ogsB7yJIR9N99BnCH/Dw/9oZi6LWF5eS/Dud1iiYz4/Xg1xcKZuB9pOYnNl
 nSgJgJC4vdzVvSEwk0lHDNh6OzXAS2X4vz/70ZPzpXY3+DUyo5fTuE7X+g8HnecDo2WZ
 XknrVjlSLtUwuL9huGcyaP8/i5LracWWNp09klBi93SNmVsuZ/f3x3tWlLkIuJQ63Onx
 /tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hbs58K5TlV2bJvEoYy+ewLKsVKD8mWsVRSkrb6/1M38=;
 b=DdWFLcNHKicary10rQmQ/4gie8HX7SYIzzBHJ3brfBXroCabv/U7IFLKZYmzdWGAbn
 5jTd10CxdnzmnsjnWrTC3zr7OF5HutTzAcl9Mmz7wSrW1Y95y/cN5Soc1Y8aDPIPTyGz
 lepxlfASWaRyMoQ6vebrqctDmYr7DNipBvFeeXam5yKn7dr1QBb10iZZleIyvb+6I7sj
 b5agQnEQ/EN6dI6WLNOp8Dip1jomL5DXQvZx3SPysz8Fe6nKDv8d1O4vh0UZsZLeQeuV
 9ui9HkVUbjKBazk49t4TMSgtmxlH61OUDTG7TqXaOPBMR+2sVWndKEagv04jSooC3IwJ
 3uVA==
X-Gm-Message-State: AOAM5333xlYp/U7KBYlfxoqjiFBjL8wsz8WAdN94i3sH6V559hCEiqA0
 feBXN+AjArKt/CcSeEGIIVkzLvsUH34V+1OZUCw=
X-Google-Smtp-Source: ABdhPJz9fhj9VklicGlUHwFGpHf0bgXbKi6WLqBEDvp90FsUA5MYMjRvqyHQnaRP5IpjwVvTl8/OCcpHf0lpYkFSFkk=
X-Received: by 2002:a2e:bc1e:: with SMTP id b30mr4380301ljf.6.1621008120227;
 Fri, 14 May 2021 09:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210509233327.22241-1-wenhui@gwmail.gwu.edu>
 <20210513165516.17723-1-wenhui@gwmail.gwu.edu>
 <87sg2pshr4.fsf@suse.com>
In-Reply-To: <87sg2pshr4.fsf@suse.com>
Date: Fri, 14 May 2021 11:01:49 -0500
Message-ID: <CAH2r5mtYy9jT80mJNBXnsXwOVRLaTADdLibpTyP7NANMXEtepw@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove deadstore in cifs_close_all_deferred_files()
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, wenhuizhang <wenhui@gwmail.gwu.edu>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, May 14, 2021 at 6:01 AM Aur=C3=A9lien Aptel via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
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
>


--=20
Thanks,

Steve

