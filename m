Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B94EB7F0
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 03:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KwbEEBF5iK5kDHVotDsDTAo7lxXJnLQW2lUufquYotI=; b=v1RXn8sffb183Ly4YyjSCZy3Nm
	9v6qul4Y6a2KOW3/xoblZlZKKDxEtRIEmFSL7HgXOMsQ6tDxiotCsUroOaLyWmPxRBpaWWT79Akav
	KuSZgCHa+IOQSGGXkxp8kRZ2bY86rFzFW9kr9iXtqVNSyGpoKgG7uaECgjh4pPpJKvqSxPa54r0P/
	2bf18YzGHE+81+s/0dzKzW0o/Y9yP7zGdQ8r758pJu7VyD9/vE/ij75di+k5cpw1+TWXPQrXVv6cO
	q+D82Q9nkcdgmkQtpxzPEa3fJAeOqNk+KRyUTtUvBNAPEFWPtphlzR92Y4ujLmfjxErUvHDKbJ1Am
	uapAn/EA==;
Received: from ip6-localhost ([::1]:28258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZNPp-006bLX-VM; Wed, 30 Mar 2022 01:46:30 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:39716) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZNPl-006bLO-DR
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 01:46:27 +0000
Received: by mail-oi1-x229.google.com with SMTP id j83so20769174oih.6
 for <samba-technical@lists.samba.org>; Tue, 29 Mar 2022 18:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CVla5oKV+fWtA2u9YZ00/xBODsH0wIe+0m3qPxCOMFE=;
 b=YeKlbhKoSrVPMcfplRnQe9ClAoXKioB6Dwt7rPGvDz+x9sLkAqXzWdidgnfnVOwYGQ
 b3AuUsCDeToWLRN8AhUZliUc8kOtkqFmNJ9UbMAVi0uPxxytOWc/OWKmvwrT7X70OL6c
 j8V3QDjYmsuDafu7LQJt76qj4p9fVv8hUACt/ERWE1zQAmaiJTyetiPO3Ir8h2sGV8Cl
 6bxQaepzQXDe780tZQyeO5WUpdGD15Jgz3semOWHritkXy8w5hpKe1xYyvI1bWzvlCrg
 wdhWSKG871BmDbpMf4uUbgddgL9o8qG2440f7Ck02oKW0TOkVjiZUaXcYjYIVcczJdKu
 BMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CVla5oKV+fWtA2u9YZ00/xBODsH0wIe+0m3qPxCOMFE=;
 b=6wKbPiOcHOPsXcZFE7hslusrghwlhXnvvRAihhMz+Zyutl9uqSPYgSERbOpCKRUO+l
 /DqXal693M0P8p0sxZfpNQ1povvIeJxNTbyHuDimeo+2bFDkxU05WrURd/fQpLfei5y2
 9iEgZ1I4W15QWljuPp8RBus/BHt6RO0i4WMXW00Z/XOx1TZmFeT41a1aYC/xXyWzHG2w
 T6PbVmj3ATsN0kO14OYycMDbnTgawM+HBDXR0sK83gmdPH0KsxTsw84omYQxRDSPSPs1
 yiZ/0LWJn+euirLFBWFdkKBx5Vz946Z0D1hD70+UVGbPi/itYHPa5eXdAtJ1o6ksY6NK
 7H3w==
X-Gm-Message-State: AOAM532WaAj3FQMC1eFANxmXrS4sXuY1+tX8w1ndgGiwPkQti34uBv+J
 SwvY1iK/RQSKd9JtFegI4Hu0DkVzwLhRxbchwpb9Ay7CdR0=
X-Google-Smtp-Source: ABdhPJy/DzmhUVBgm0j0pUnc5bnK8eaBDqX18mbsy00h/1xayaAB0NCaKCLQwp6OZCSK9DPmdLqMbDR5TkTT8mXNmQU=
X-Received: by 2002:a54:488a:0:b0:2ec:f48f:8eea with SMTP id
 r10-20020a54488a000000b002ecf48f8eeamr848575oic.166.1648604783330; Tue, 29
 Mar 2022 18:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAM61p33mA2Oc7v_+iQj8-uuowyJJh2WTfbLGWQHUxiZdAmbLcg@mail.gmail.com>
 <6b999085-4639-ec62-0026-e99d26c5d6f6@samba.org>
In-Reply-To: <6b999085-4639-ec62-0026-e99d26c5d6f6@samba.org>
Date: Wed, 30 Mar 2022 07:16:11 +0530
Message-ID: <CAM61p315WDPO0ZKzw2s4z7VPyJw5fV+9pgsesTmLjgo1uBT3tA@mail.gmail.com>
Subject: Re: Regarding Mac os behaviour in samba domain
To: dmulder@samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Prince Chaudhary via samba-technical <samba-technical@lists.samba.org>
Reply-To: Prince Chaudhary <chaudharyprince64@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,
Thanks for your reply, i have checked this issue on apple forums but there
is no exact solution on it.


Btw thanks


On Wed, Mar 30, 2022, 12:32 AM David Mulder via samba-technical <
samba-technical@lists.samba.org> wrote:

> On 3/27/22 10:36 AM, Prince Chaudhary via samba-technical <
> samba-technical@lists.samba.org> wrote:
> > Hello team,
> >   I am writing this mail after spending two three months on understanding
> > samba and implementing on mixed os environment (window,mac,linux).
> >
> > Samba domain works fine in case of linux and windows system,
> > But in case of mac when i am joining a mac machine to samba domain it
> join
> > properly and shows all domain users as well, all ok, but when i restart
> my
> > machine "other users" option which allow domain users to login won't
> appear.
> > I have to relogin in local user and then i have to logout then other user
> > options appear and then i am able to login with domain users.
> >
> > Can you help me with this?,
> > Why this is happening and what should i do? To make it happen all i want
> > that other users option on login screen of mac os machine should always
> be
> > there whenever i restart my machine
> >
>
> It sounds like the MacOS client is having a problem. You should contact
> Apple Support.
>
>
