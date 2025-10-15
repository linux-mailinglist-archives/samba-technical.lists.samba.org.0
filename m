Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74708BE003A
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 20:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nqA7k4UVVoz1WmvKpqEl1VWC0k/EIByv+fhLJjtIG9s=; b=4OpzvizIJAwkd7UbM8SHRuwNFc
	psUN5JfE0aVkdOimyUdpe/v6/7FkBfsJA64k60NYIlIQwfh6pNSOivj4t9SDWe4DQ5QHBaEReAaD4
	qdk1ZecuQufmuZVfG49YEmU8F772fihLC06d5cqRfn3RFiYrBsvhd87pcb2t3PAvaWHwg/eoeX6aQ
	OlAr9e2jD3ttnrJgDXgzvWQrBlipdXvZda7dd6vozGP8Z5IulWSXKjqbieW9ABhRezsC2m5r2MCGD
	T1o+3i1gqFcMnWcwCMDIHK9RH1hZGJwrgVFoSHyhyqWwNse4zUfTTwSmAvDqgpZjGCARZ0uGVZNzR
	BU3uH4fQ==;
Received: from ip6-localhost ([::1]:43446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v95xh-007sV5-AL; Wed, 15 Oct 2025 18:10:57 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:53484) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v95xc-007sUy-K2
 for samba-technical@lists.samba.org; Wed, 15 Oct 2025 18:10:55 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-78e4056623fso93144326d6.2
 for <samba-technical@lists.samba.org>; Wed, 15 Oct 2025 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760551850; x=1761156650; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqA7k4UVVoz1WmvKpqEl1VWC0k/EIByv+fhLJjtIG9s=;
 b=C3+iMwMLM8uOZSLNpLy9w2POfbpuAeI76d15ZSMnrFoNsQv8xSKIvjUYmMWiQQ+goU
 lHd38FGqNoQAUpo6PMRfh3N+NBOmJX8SsoAyzWpevXQQ9l6TRDI6gpuit0fkYBL99vvn
 Fiv5cjooOAlIG6S84Q8AZAvbFNOR6pXEOo29Y0uJCHs//ZX+0uYgHWLgdXrrn0w5Pp1B
 G6g3zSFh/mXjECnSq0AXVSwVDiVPwTFOtau5lmpkLejOzwYpmIxNUCYOssHlGCNbkEHV
 eLspVt7ZLzVb8bXFVoZVWIIyNN5CztUoFMggJE8PE2F01eSLWIIYlpjw4ZPgRAvIspjy
 0U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760551850; x=1761156650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqA7k4UVVoz1WmvKpqEl1VWC0k/EIByv+fhLJjtIG9s=;
 b=xMppe49L8kDCm3nIyJmkDrZr0LanWHkRAXf9HxwOoNMr5HZSuniTcIwGtCrkMJ5sKb
 bipUgp1RKc/F+9pzGhaj0Jsssw6zwFA3TjSLblDbZ1rEvikbjbwm84JipVw+yp33NMBP
 JxKPoJ8m+GGeWol4YDa7xgBdE4qolYO6oHCy84ncw+SG4rNRQriW3hlfiJbD74o6mu4R
 A7Ca/WG4/HZHrCe3f+DECG93vssuw2q5fbXLKFe5VBU7hvSYfl9BZ0gOd8XpZ8c3DQVw
 U1IxmK4Pju8rEqqC3uWf/k4KqQuAmZqcNdkRq0vo3jYoLvYngIJlqOzPCJEqHjSLVaDj
 uI2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKNpdQHTQ4/5U++HAoyjxhLr9tVF12f9GNobUv6vHsOflH/wsViHk0ifq5KpA6DUB0xXFerW4U9cGuEgAeJtA=@lists.samba.org
X-Gm-Message-State: AOJu0YwU8zAXzc+2pmJ3j0E0qA5qlZxQnGqFVOhJs5HTDPzwHI/cSYx1
 cPvqFx3a8r9MtNFe3/nwWnAg0uKA+V4cAMAjz8iODOjitcQG8t8X5oucp3L/HSQ6h/v7fi2DAqx
 UhVMCBOBfcUwumfkxpDUGasPipFZ2Q+c=
X-Gm-Gg: ASbGncvnPXtcI5y8Z6tW4wmB3O2Z6yOma0iViGH7uU7vSUHydkieDpvxGoN1ZJiRpWt
 kBxDDAtoq+T88nvA5FXaDri7e+TesfWdVt5LqXmdN+INFW1gIT9aB2D9u+eDtpg4T0l9Jo0H/Ac
 bkndmIxX2PMVEXEFfCjWY2YongizoPXv4HjKaBIILaM7+Im3jtpP2oH1Odw0pRvMqWTh5oRzh8f
 rVYXuHuBqE2Btx8M/IfJnO2UYOeK88mAkmDOSMseU5ThjavJizQJ6aCJmgv4Tvy3Dhns6LRBIxp
 E9tQjeHJ+HRJ2QQ08ltHKg6b+tyvFTpx+KluyjeqkDMOuMs8YlJwBKcBe5CYTY9FTMUxIJSzfuH
 4G5QzE9LFYDxNRGUtmkxNRsaY8E6r5g+zRJCNwe3C
X-Google-Smtp-Source: AGHT+IHninkPESQS8dHVL1fQL53uOsfSc1mur/cEdxDh3bmiIBfWuhMXmHWs7FOB1Mg5kel/vGkCWetRJzQIDq/GUh0=
X-Received: by 2002:ad4:5945:0:b0:78e:c8a6:e891 with SMTP id
 6a1803df08f44-87b2103f5c0mr366857086d6.24.1760551850329; Wed, 15 Oct 2025
 11:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <aOzRF9JB9VkBKapw@osx.local>
 <6599bf31-1099-426d-a8e5-902c3d98e032@web.de>
 <aO/DLq/OtAjvkgcY@chcpu18> <6eeec2b6-ef28-4280-a854-cc22d2df55ed@web.de>
In-Reply-To: <6eeec2b6-ef28-4280-a854-cc22d2df55ed@web.de>
Date: Wed, 15 Oct 2025 13:10:38 -0500
X-Gm-Features: AS18NWBfaSIxv2RDHlnpAQo8uwRpyrQ2N8ndjpwz_0K_rEufX1VnmPESyUOVHfY
Message-ID: <CAH2r5mvg2Ask8SXOQArDLnKOjHHSPKGwuHkYp9NuuzEqYcZNEQ@mail.gmail.com>
Subject: Re: [PATCH] smb: Fix refcount leak for cifs_sb_tlink
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Tom Talpey <tom@talpey.com>, Shuhao Fu <sfual@cse.ust.hk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I agree that "callsites" is incorrect, it should be "calls" e.g. but
the others are very minor and I think the existing wording is fine for
the others

On Wed, Oct 15, 2025 at 11:25=E2=80=AFAM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> > Fix three refcount inconsistency issues related to `cifs_sb_tlink`.
>
> I suggest to omit this introduction.
>
>
> > Comments for `cifs_sb_tlink` state that `cifs_put_tlink()` needs to be
>
>                              ()?
>
>
> > called after successful calls to `cifs_sb_tlink`. Three callsites fail
>
>                                                           call sites?
>
>
> > to update refcount accordingly, leading to possible resource leaks.
>
> * Do we prefer the term =E2=80=9Creference count=E2=80=9D?
>
> * Is the word =E2=80=9Cpossible=E2=80=9D really relevant here?
>   (Would you find corresponding case distinctions more helpful?)
>
> * How do you think about to increase the application of scope-based resou=
rce management?
>
>
> Regards,
> Markus



--=20
Thanks,

Steve

