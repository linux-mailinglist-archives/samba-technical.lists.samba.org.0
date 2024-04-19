Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8B8AB433
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 19:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4UiNPWmq48O2Kml3xW7QBDJLvWZhd9YbWz5yZZm0oYA=; b=w4ehD+Pu9PB6WgldXE+GVhyT3E
	j1Hvq8CJ3yTTA3GdaHzSROCyzpkvOR7NBaXSxkOUF5aInqF/awduK3ehZQsozmsto7O5jMEJhG4ta
	mhUikJAM3G+9/tfH0E7FOj32R697E9R5q1VD02u7iLSuse69nHI2Cy+GJPf3NF7MLrR06/blHvMxK
	ARPWsa9kxezzb4LQoVQBIjlFT32zjz7S06s68m/+XtizwvfV3O074IsJYswAx1Fx6U+Sksr484CWh
	SKVh5H/uIPz3M6Qs/ldGmsLBBjKonFSr1F0PxrAzfIxPbVP5wOqabJpxzHOXgX8F9/tEnJR5o2BL6
	uDTMNawQ==;
Received: from ip6-localhost ([::1]:62012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxrmf-005DK4-1f; Fri, 19 Apr 2024 17:12:21 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:57731) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrma-005DJx-0D
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 17:12:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-516d3a470d5so2857787e87.3
 for <samba-technical@lists.samba.org>; Fri, 19 Apr 2024 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713546735; x=1714151535; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UiNPWmq48O2Kml3xW7QBDJLvWZhd9YbWz5yZZm0oYA=;
 b=eVKni9J6b0YL/NzSz+OGWswAMUKrm7GXW5BHDywFj+jdGzdJEJYNV0TVwgdNZZks3W
 fPl7hdMP7uzz2elh4yyq39Q4LizYlaApktBTR6M22rPb2VzUir4XHD9eDG9iaXYBpnhk
 iiT0riRrVlCahZndMrFrqSQC0S5TpuI30KstQkK+xCQbkf8AqHRc28pi1u6IuJNQeuCp
 cPA+EDsfnu/+kCuxPDewHJsr8BdP5ffuC/mKDToWLjdrjJm4UuiFCiqWlAZ2FxE/PG+N
 RuxxoWdMgOtQH+gzMUi/fttdWakz6n9gIUqhkRt2L8PkrsBIaT6KjGYSH54PyrFpPbjf
 IMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713546735; x=1714151535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UiNPWmq48O2Kml3xW7QBDJLvWZhd9YbWz5yZZm0oYA=;
 b=KervVrghAksEA37YIYn2+GBZIeJNTkzK721WseA4YaydqRc0Fua73TJ12SaMbVWqR2
 OL0JsHpIodcOCjHRqjfWAQRW8o1MHmMsUl/hQn+/+SVG6vCmyUbzJkBb85vmfbPXVxv7
 MwQjtuz8BDN5ZeS0rv4kVqDFt6/h/cgr6rRkJjKZgQfmNds51L8qarYOq3BtXoF+i/OB
 uH59A07MyLS3Y6ZvrZGSBdJzGQgWTcXCF5iWP7T4zpxpXmSCdT1DeP88/6i7PQTmflHT
 XX518pQla0u1NRGlqyj0Zs47ZCy6Mf4afTMrxAaCk7tvZqjKRfZ688hToYeeLMWrIiKM
 UpFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdMbBJBzqWutJtcKRw9VofojWXSAJ5+ym9Vb/mJ6RrAXQu3LcKNBzZ2mXwopL6Kq3o/Me/+s0ycwK1EQPTCO6mM9jzk2WTzfWpTbvAXY3E
X-Gm-Message-State: AOJu0Yw+Megxg1Q1vYtBpqh/eH5mbML54dPLJSn2IWZskVpcNa+b6LS0
 DnsnsDsF2kU9eAihPhN6/ALOx4p4SiUUQebeUQCpPFEvq0sxe6pHgAZEJ9TcRmT+IbfK93bPjY3
 jGgpDngKp1EbUCvcO5DrWK9j0BXQ=
X-Google-Smtp-Source: AGHT+IFaNmyXhKvkHaju/fD6czmfU5+0YRmYN0D9kWNR7TF9ngH2WTRU1X52ONsV3cgVzDb8Fk18ptTYJbgoITDIqso=
X-Received: by 2002:a05:6512:360e:b0:518:755e:4bb4 with SMTP id
 f14-20020a056512360e00b00518755e4bb4mr1559926lfs.1.1713546734510; Fri, 19 Apr
 2024 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
 <c7d80c1538db3a414636977314feba13871907ef.camel@samba.org>
 <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
Date: Fri, 19 Apr 2024 12:12:04 -0500
Message-ID: <CAH2r5mvn0tMB_SoQYGh4bVK-ZRYfOLNn4PgX51_rofPkhwqD4g@mail.gmail.com>
Subject: Re: Missing protocol features that could help Linux
To: Jeremy Allison <jra@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 19, 2024 at 10:55=E2=80=AFAM Jeremy Allison <jra@samba.org> wro=
te:
>
> On Fri, Apr 19, 2024 at 01:40:34PM +1200, Andrew Bartlett wrote:
> >POSIX <-> POSIX locking over SMB is something I have a client trying to
> >get working with SMB3.
> >
> >They have a use case where, as I understand it so far, the mapping of
> >POSIX fcntl() read and write locks to SMB locks isn't 1-1, because they
> >expect advisory locks, but SMB locks are mandatory as far as I read
> >it.
> >
> >They use cifs.ko and Samba, so it isn't about working with Windows, it
> >is about running Libreoffice on LInux against Samba.
>
> That's not going to work the way LibreOffice on Linux expects,
> until we fully expose POSIX locking semantics.
>
> It's the range semantics that will probably break them.
>
> POSIX locks can be split/merged/overlapped. Windows locks
> must be distinct. Currently over SMB3 we only expose Windows
> locks.

For a surprising number of Linux apps mounting with "nobrl" (which only
enforces byte range locks locally, and thus POSIX style not Windows
style) is fine for SMB3.1.1 mounts.

--=20
Thanks,

Steve

