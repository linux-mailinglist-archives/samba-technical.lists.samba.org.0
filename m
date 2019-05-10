Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A93196A6
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2019 04:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KKAZz/FXe4NaGekpmQpC/UXaKfQDKZSlRyoFbrwlhTo=; b=u5JScy+kpWQyjoO4MmBG4u22eS
	yfz0377JduFXzKK9MXz5NMnRh0/ypSqg0qOrF57q19Xzm/ZXKVz1+QhAD0ifyBll++WZo5Bw9bbiW
	FHF5fdpafdntVqYDkWQXhwr/n6QFsc7x9ZeTo5rG76e4/ge6kx2dpIeLqga+RZVddgzQ8JNACrKFd
	XgP4MtF9f2K2LMTn9zMcV/V1r1hDR/ExRO1IMVdVF/27Mi9opNEYN4ZcQPM9nNaYLdgxiKu9scznI
	7z7NrhUiE3sVO7UsKEkRaLwGRrmsIJuYsDReLHGKjFfVXRctkr57iYf+APud9+EievW0pBc0IfBQR
	FJ8p0Spw==;
Received: from localhost ([::1]:61904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOv9X-0037de-3Q; Fri, 10 May 2019 02:20:51 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:41422) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOv9S-0037dX-BL
 for samba-technical@lists.samba.org; Fri, 10 May 2019 02:20:49 +0000
Received: by mail-lj1-x229.google.com with SMTP id k8so3707685lja.8
 for <samba-technical@lists.samba.org>; Thu, 09 May 2019 19:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0N6qaRaWtrXh7hRUQaV+Yc7yZb47AFOmrsg1MZDqoNo=;
 b=FH+A8YMrLjJJzWyjBKhdDDNTY5PnXhoDNb8k69Yqr/OsxU9ELmak125fOsx9MZSNCb
 ECd3MV7RV748FGwEglzjnlUF+fg+UAlaepGTJD24bJA54wiOKr2EwG9Cqg7tjHwqEqh6
 MCDM8s3KyvO5RaMAmYEYeF67WU3nfW7Kam/Fgy/hvfK7C8OgeIsjmTZwLsaXI0tRZGEL
 lpTAlvgrKy32/rvnI6t9b1ZOyubbtEf3U9pecq/Gf6pC0ClLLMlw1piYJ0QseAD67p+U
 tpry5PD5VYFtIE1/H3u7m/dV2afl9dTQpdPP0hmbPmjV4mJERFNewYQc9fFerPTa46F+
 vPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0N6qaRaWtrXh7hRUQaV+Yc7yZb47AFOmrsg1MZDqoNo=;
 b=N9oQlPKNnp6zGkyqNMNJIk/OaUMyWo3q98CFrcaeAtcVNFr2cG3yrYHw9nxQpnPsKp
 5d1tshp2iTOC3W2tIJ39SdWap+Lgfy28EYTkgGZWvuij1DTN6zh2J9+a+HT+CmqB6Sqp
 CZnuoQe36PUE4DWy4DUCyuHQuFeekOuhsz5usoopdnjDMMsw3EPcjah1cIINQi2uf4Wj
 bV3LvYretz6zOO1K4OPDdXUqvhJ9iib9SxAEG+amRl0Qb3P6QItgxZqwcu7r45i6Ibpv
 I4ixAalfcjhbYPkK7iHSQ9eXwFZQ6OXgQuQ4wASQfa7/JMwrG6/PS1Z65JYtwWR4PnnO
 Tr9Q==
X-Gm-Message-State: APjAAAUzJY6w3E1oci9sDF/0l+Qq05tdK3J9/956q6BFcsxoEnDnSsGp
 N7Whj5If0li1ke13arUpvRbGkDw1nBt3rDQRoCk=
X-Google-Smtp-Source: APXvYqyFFCdTe9svGU4Lqaum+CV7xh9924jmERzj088MH3qyqfWUGEkm+/GGRbY2KkkCU0z7Qm+ojxyG82X1f93dD8c=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr1976266lji.107.1557454844415; 
 Thu, 09 May 2019 19:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190509131420.17d98c62@samba.org>
 <20190510075927.393c3c8d@martins.ozlabs.org>
In-Reply-To: <20190510075927.393c3c8d@martins.ozlabs.org>
Date: Fri, 10 May 2019 03:20:33 +0100
Message-ID: <CAELK94e59UCxZ6oM2ThwjJxX7NbpKE7AVuLWW1sXH53eMxoOsg@mail.gmail.com>
Subject: Re: GSoC 2019: welcome Mairo Rufus
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Cc: P Mairo via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks to y'all.

Le jeu. 9 mai 2019 =C3=A0 22:59, Martin Schwenke <martin@meltin.net> a =C3=
=A9crit :

> On Thu, 9 May 2019 13:14:20 +0200, David Disseldorp via samba-technical
> <samba-technical@lists.samba.org> wrote:
>
> > I'm very pleased to introduce Mairo Rufus, who joins us as a 2019
> > Google Summer of Code student. Mairo is assigned the task of
> > improving the smbcmp network capture diff utility[1], and will be
> > mentored by Aur=C3=A9lien.
> > Please make him feel welcome.
>
> Welcome Mairo!
>
> peace & happiness,
> martin
>


--=20
https://github.com/RMPR
