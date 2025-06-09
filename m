Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61915AD2864
	for <lists+samba-technical@lfdr.de>; Mon,  9 Jun 2025 23:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=J4DkXTYwW5Ep8DUHJ5uF89cdrUl3k3cbZQbOzQO0YiM=; b=xszN0I5UQrOw1gGJt0vLsnPzeN
	S0s4vYFVENjy4onxmUTjGS5mDc/E3Mg28uO8VoU6YOpRXIwXSe8YWf4n7yB/Hzx8hNO0aC9fc35r6
	vg2lE+FnoyiKPGdymsw7e8jyFftxLIF7uSfhB2OjsHymf6vAHMik4IObW5k18+AfOffwJf6TlDW+I
	w8imc4lYuZlg0j7UzMqo7lu0Us9AcAG/ta7lWWIxZ5kP7gRxXezuzLAu3a+mjFoSzWFMD9D6v/Gms
	E/VwEZA7hZ2NZQcEBw1y/qb3wmdYlDu/PXcXMnTIgQXMT/mcOb/fSGo9PLSVCuczEeOLHKsqVInO5
	uboJDU9w==;
Received: from ip6-localhost ([::1]:60330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uOjd2-006uSQ-73; Mon, 09 Jun 2025 21:02:00 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:55665) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uOjcy-006uSJ-9m
 for samba-technical@lists.samba.org; Mon, 09 Jun 2025 21:01:58 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-32aabfd3813so38937061fa.3
 for <samba-technical@lists.samba.org>; Mon, 09 Jun 2025 14:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749502915; x=1750107715; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4DkXTYwW5Ep8DUHJ5uF89cdrUl3k3cbZQbOzQO0YiM=;
 b=FA0Vbz3G75XoOXsIwVReQYnBPTE65YvzCleCjI4l8eCELeyap1SVkS671yDYkv7JcI
 NSVzrIdAaO4IwT36DAYSQ+v2NbAeBej8qcuusgSe5p0TU6eOoSZGC7XIS2EiAzYgipuo
 r6PQbz0J6CBfu1lFHZyEkzjt9c6AOrXHjZ7w7Hnr9SN7lsuAeK/tzHMwOXC21DzvVNXH
 QsrrjMc+5yWxPjW/LJPlmOSj9CXGkyc/dR8Ln9nk1KRPYp6oqZyajQDYEKd2MxOuKeWg
 11UOzEpUA9lo58Te24JTEjQcLwO2rP8ftJIJ/WZ2WcFmOe7njkMnXt24nmx0M71vmt2M
 F8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749502915; x=1750107715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4DkXTYwW5Ep8DUHJ5uF89cdrUl3k3cbZQbOzQO0YiM=;
 b=AaGf7zdT2Lker3ko5fQb98EX3vJ5oq6axyM1eR+MLnpvNaKZniRuItfUDzsZU6+3Ie
 iIov2MW5ktNm6y+LERwx9B+i0zDjnaYMwcFtQ9Q/ryJP8MQ50NmAyMx2cld51WH8//uK
 /mHL2Z/8w5CpHPv5ok5GBuuA0aaYa/69CQXwuxwGZlRNeraae/5Gwp+RPIkn1EjbB/ib
 YOjY5rTXSKLBw4f2oWr/6g+jP9j1UewEK5dSXMUSjvaFNcXIDvO9SDdL7ODgCkIn9M5z
 9d0EDvZoWYyh9N2HlR/BoBTWvnE76zu8hlAjv91jMx4vyZPIOFNWeEcGgP/dFH8qTpg1
 ufoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVenMQixoUEnm62dPCiI2BkmmIxyx8iB7cAiBFk/hauEuymmnR9gQKgSbbOwUXyJcUi8DvwcB8zTSs4Yo3hCco=@lists.samba.org
X-Gm-Message-State: AOJu0YzIrwaKLSQy0RQof/WS8ip6s8vfSNUA1Xn8EwNnaPCijI2Ejj4I
 2esrpyZvzgxoj2sVPxXOrpVDAn3b9lpJJfAw+zp4d70GBJxGQdYbJszh2oAGTPMC9ztBE7uTeAC
 /c6HNwI9InPLQK39wI5N7wcmAY8UIr5w=
X-Gm-Gg: ASbGncvx1lD4npdhw0eskayGIUbV/mh/wCQjFqMVr/y8mquyclnoR+pN4f7HoWaPdNm
 ll/20hccpOMc3FaMUrsaw2oXfqJGG8cSz77utG081R00tOlZpqSBwHeNyftNlLAihUyMob3agWN
 w5HmH01WeB+1ViyhAjwgkYPd3LY4DNQGSpBJThv1WUrAsqmEF3aKisIFay6oIERV8TL4uU5GiK/
 ls9wBNbBYotw1Hp
X-Google-Smtp-Source: AGHT+IHsCNHegqYNX+NPCF7HkCmAPSw+rq6dTGq/CFkeKLnS5BehJ6U+698wb4S2U1xIj2rKm2kqH5fsLFXEE+/PhoM=
X-Received: by 2002:a05:651c:108:b0:32a:66f7:8a15 with SMTP id
 38308e7fff4ca-32adfed5cd4mr27233801fa.39.1749502914351; Mon, 09 Jun 2025
 14:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250608185900.439023-1-pkerling@rx2.rx-server.de>
 <CAKYAXd-SjnnTtYp2NNvRuMWp39-MhcPa-+8xVCYKxDpGHLGsCQ@mail.gmail.com>
In-Reply-To: <CAKYAXd-SjnnTtYp2NNvRuMWp39-MhcPa-+8xVCYKxDpGHLGsCQ@mail.gmail.com>
Date: Mon, 9 Jun 2025 16:01:42 -0500
X-Gm-Features: AX0GCFu2a_Ne83XmZE7MAd372CX3Rsa0q3FW0YPqFq5S-WkG8GWgwsyOi4GGSgo
Message-ID: <CAH2r5mv+3xhiD+CdKOdnSNSz_TuR4i=9s0rViHm_ObhxDyd50w@mail.gmail.com>
Subject: Re: [PATCH] smb: client: disable path remapping with POSIX extensions
To: Namjae Jeon <linkinjeon@kernel.org>
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
Cc: Philipp Kerling <pkerling@casix.org>, linux-cifs@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending additional
testing and review

On Mon, Jun 9, 2025 at 12:51=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Mon, Jun 9, 2025 at 3:59=E2=80=AFAM Philipp Kerling <pkerling@casix.or=
g> wrote:
> >
> > If SMB 3.1.1 POSIX Extensions are available and negotiated, the client
> > should be able to use all characters and not remap anything. Currently,=
 the
> > user has to explicitly request this behavior by specifying the "nomappo=
six"
> > mount option.
> >
> > Link: https://lore.kernel.org/4195bb677b33d680e77549890a4f4dd3b474ceaf.=
camel@rx2.rx-server.de
> > Signed-off-by: Philipp Kerling <pkerling@casix.org>
> Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
>
> Thanks.



--=20
Thanks,

Steve

