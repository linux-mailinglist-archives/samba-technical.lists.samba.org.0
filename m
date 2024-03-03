Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7886F396
	for <lists+samba-technical@lfdr.de>; Sun,  3 Mar 2024 05:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=S83Y/Z49tWzSv3SWWAwGxbY0GdjBtQrQUEvvX7O1oeQ=; b=1uiasG0ut3ili3BlR301WJ/gzv
	s9ly2xcryLl6EMwLK8o95yBgNW8SWWzSdOfba0M0ZlLmrpLxxLhSCIFKawLdlkEpsP+o6rVXHkrGN
	3phEndCvgxI8/mOs7c970Hl7p05buO88ShsyBHT40/Mm5aD5YMHXs3/4Qf22VJ+zNoyKjsj0vrmcx
	6ryw5DApobGw7GA85xsIIFuSueTFv9EqAO0MdunLjCxdep3kR97Hg9lLsE22U0oSVlUrZjQfbSWz0
	2NBC0omf9Wavm+pVKNAHkzoBIXl7ESrrEYqvonMWWn7Dne2FIQ4xl4HqLo+ZgILzce0rQzxG4D4FX
	z1el0BBg==;
Received: from ip6-localhost ([::1]:52736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rgd5V-00BhPJ-7h; Sun, 03 Mar 2024 04:04:33 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:48165) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rgd5R-00BhPC-3U
 for samba-technical@lists.samba.org; Sun, 03 Mar 2024 04:04:31 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5a1206ba5cbso351702eaf.0
 for <samba-technical@lists.samba.org>; Sat, 02 Mar 2024 20:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709438661; x=1710043461; darn=lists.samba.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9OzXRyqRi7NVLaSNNC9y8FcVqBhesEAlH4lSDFGUWGA=;
 b=XSCvEnDMZB9XsiaGT9hOvGYqjpxYB4n/VF8WVdKXYu7MVt1USM3Yxd3Ofd0hREHJh3
 iroHHHD2nPhpy2ppjZWIkNw8wxhNnViN3n6UJz3m+iOa3iTHTmqgQJy8LfYADEHlshu8
 lPNhvxfMV17QA4zK8mh/n4MbDnZcTcuK7eMuD88J24xQWr2Wwr7Kg7h+u+HhdiKSYH1t
 eV8YoDKxwLn14OUIUbzjDgJLe63fWIwVUMHpMQN4sdokHG155KpuVr95oGMm7ACEY839
 kI8+xW9UKi+JRpoi2bORrUjSjOX1Arz+Xj0a3/gRbB9PReB2hrLKFBIgvNbsE2wqMI0C
 c0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709438661; x=1710043461;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9OzXRyqRi7NVLaSNNC9y8FcVqBhesEAlH4lSDFGUWGA=;
 b=WLNKANLq2xDEtCy849vEsPVgFD4bW/WT2PKPluRDfH7lP0xlw5sFY7U34tBkw281N2
 bBDLec0jUK3kgWArQlH4hmkKj9EsElph0nXHbqVulzz3JGRAg8hbpNZ2L+hXFRBYOxz/
 wodqZx58MSHKHgSOTqSdMvaaWMlAsftP4MPDNrrt6QBoSdNpcI+NXSMdblcaejR4GLlC
 uV2OACJX+uORiyfE5vlvPIJvVDDohi/FIEO0BVq6XgjPec9BioB/0MqC34AQN8e0lB0E
 FK+ZuSc/pPITySOzALNWLJlbNH/3U+Uwo2VFcKbE3Drl+I21nf1cb24pqLZi9uv8aRlR
 dujw==
X-Gm-Message-State: AOJu0YxLFg4jzWMNsJ7dSpf2xISxZn6849bUdmHurHwA66SYUyhvDdqb
 rcaW+GDfadzUwAXr1pfRTK7eyXYlFSgEIsCQe+7GMLuFC+PrIUXLTjXjbv+097+dKf0EkQJgs42
 Zs+YCJ7rIgS6Letraz7f7FQQs3LH9iZSU
X-Google-Smtp-Source: AGHT+IGnTtUXgziNgEwV52qOvLtt7y+m2jrkQ2I3l1T/ZIvGPPKXiiipLFRdlcwFV4lUfCla9eb+F4/j4ffUNQoPE9k=
X-Received: by 2002:a05:6358:8a0:b0:17b:6453:d696 with SMTP id
 m32-20020a05635808a000b0017b6453d696mr5981160rwj.0.1709438660663; Sat, 02 Mar
 2024 20:04:20 -0800 (PST)
MIME-Version: 1.0
References: <CACyXjPzVO5hDs8mXUWppErO6H+Gi4DbmO9tU+uz+rAdvJLkwHg@mail.gmail.com>
In-Reply-To: <CACyXjPzVO5hDs8mXUWppErO6H+Gi4DbmO9tU+uz+rAdvJLkwHg@mail.gmail.com>
Date: Sat, 2 Mar 2024 20:01:01 -0800
Message-ID: <CACyXjPz0A3A9Ec7NoqGeRNRS8VtE_FDwk0g=xtfKXoY5qQwNjA@mail.gmail.com>
Subject: Re: A QUERY_INFO FILE_STREAM_INFORMATION on Samba behaves differently
 than Windows when the buffer is not big enough.
To: samba-technical <samba-technical@lists.samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Mar 2, 2024 at 7:21=E2=80=AFPM Richard Sharpe <realrichardsharpe@gm=
ail.com>
wrote:

> Hi folks,
>
> I am using Samba to test some stuff where we are using QUERY_INFO
> FILE_STREAM_INFO and I notice that Samba behaves differently to Windows
> around STATUS_BUFFER_OVERFLOW.
>
> When Windows returns STATUS_BUFFER_OVERFLOW for a QUERY_INFO
> FILE_STREAM_INFO it returns as many items as will fit in the space you sa=
y
> is in your buffer.
>

OK, upon further testing this comment is wrong. Windows also returns
nothing.


> Samba returns nothing.
>
> I checked the code in master and it looks the same as earlier versions.
>
> It looks like instead of returning STATUS_BUFFER_OVERFLOW, we should set
> an error variable and break from the loop in marshall_stream_info.
>
> Finally, the whole API around stream info is retarded anyway since you
> have no way to know how many streams there are and now much space you nee=
d
> to allow. (However, that is not Samba's fault.)
>
> --
> Regards,
> Richard Sharpe
> (=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
>


--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
