Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9E6DA636
	for <lists+samba-technical@lfdr.de>; Fri,  7 Apr 2023 01:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sa4w2wBUhh2LraZYWTmyiXr2wBMjNJ8awyrNTkWw7lc=; b=Cwd5u+xQqCNPVBuJBUNT0NxNk6
	JLzW6vcLPd0xvirutpF3KpO3bvv99ham7C1mwtwdz18RK977RLbYYk8GtAfph+155hS/6r0RLkXUF
	sIvwJcpEn/7OcyqH+D1eb4L9nb88NyudS7Ka5vpqPct8ofYcRdCISEjc0z9Jhxt3vIssCg4m79wgp
	AcT+cy/urrqHVwKkf5HeHUbii8QN+rC23Q8tcOYq5HWzlIJLiyQCHLVt0zMYmPj4t9h6tN+5HsA2+
	x5h4d9dX491p1LugOCCqQcufQurTcYf+/3xWdcF3dOFwUGUzwwtf0CrgydCWmMaaRU8JBBLVkC5sB
	qVEAF5Nw==;
Received: from ip6-localhost ([::1]:48674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pkZGa-009kq7-Te; Thu, 06 Apr 2023 23:43:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pkZGW-009kpy-Kb
 for samba-technical@lists.samba.org; Thu, 06 Apr 2023 23:43:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id n21so5027216ejz.4
 for <samba-technical@lists.samba.org>; Thu, 06 Apr 2023 16:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680824619; x=1683416619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sa4w2wBUhh2LraZYWTmyiXr2wBMjNJ8awyrNTkWw7lc=;
 b=UtP1mBlhsggmxLoOvfJLtVEopzWRqIyYL8Ug49LHqTYjMM7HdUpcBqf2AbZxCkkB8A
 jvND/qZdS+6SSw8zpJttAncyQ4bcQx9LgIaJUaAmEx8yQdzNrw3Y33t/j8nWL/dA5MIZ
 opy45DYM/dPuGE433N4lBeMwH3kJX7HlpMjXxto94ocz4FwlRATpuKhYLn+gboUoJf6w
 SUzOtHPzY3IxbBwa2Hx+89RhEZnfFk48t/sfSXsyOv8yQwxTecB63aII7hhy4/a01Ycj
 9nAyMMDKfx/OfsrrZYtxwGwSBMoElAQ3d0E2N3XyENbPjoP3nevtwrUVxbzdRq0ycd98
 Jhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680824619; x=1683416619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sa4w2wBUhh2LraZYWTmyiXr2wBMjNJ8awyrNTkWw7lc=;
 b=jeGbajlsuQz3GovA6Tz08zqARBox5QoxaJYX1m0Xz1/W9Mr6tm1RFTCoWq+eUWwTqT
 Dyt8nnmkjSFfg5Wq1uetIKX1WbrA144z/qzP367kqlazpHZEbAOJNlPQQPXKg5Da17f7
 Ct5BRWAOaG7xW7iyogaAe2aTVzTZI3rVe2agm+h0ir2q8lRg1uPlDLO2pC+/4F6tbDsp
 eyz840gNW+PlQiTe4ltwwCMbiu6orAUf5bzlee4ZwLy57U34YMG3MzFAQkmxIGBE6oy6
 de15jIBsVbuqzhX0tLQ3b618G5uS7Ji0ZmX0eFU8tFo3ZIbJON1nFEFMonsucCOVkS8h
 2KPA==
X-Gm-Message-State: AAQBX9c51aZVMTwwfN99hbEdDaWVWBBd1DgJrvDu92t2+hzb4GQpUZ08
 HNduJqL4dF4nA1frzE01UyM7ZIulxiCGgg+k8f4=
X-Google-Smtp-Source: AKy350aBEkf5TgGsv2J/0hdQg7fObnxz4RgvnMs2l7oi3Q8is/NrmWVmaPsJCNU+iGHcckbbHivvQg0JaDbaRmw6XcI=
X-Received: by 2002:a17:907:6d99:b0:8d8:4578:18e0 with SMTP id
 sb25-20020a1709076d9900b008d8457818e0mr253918ejc.10.1680824619045; Thu, 06
 Apr 2023 16:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <ZC6JEx4dvWUvgcwW@kili>
 <8219c3dd87179df545fb6de4b89b2bbc.pc@manguebit.com>
In-Reply-To: <8219c3dd87179df545fb6de4b89b2bbc.pc@manguebit.com>
Date: Thu, 6 Apr 2023 18:43:27 -0500
Message-ID: <CAH2r5muJwda_HxHvBR_riAjq65XHjs4Pbvc07i7ZQ76rU9GUNg@mail.gmail.com>
Subject: Re: [PATCH] cifs: double lock in cifs_reconnect_tcon()
To: Paulo Alcantara <pc@manguebit.com>
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
 Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Added to cifs-2.6.git for-next

On Thu, Apr 6, 2023 at 7:10=E2=80=AFAM Paulo Alcantara <pc@manguebit.com> w=
rote:
>
> Dan Carpenter <error27@gmail.com> writes:
>
> > This lock was supposed to be an unlock.
> >
> > Fixes: 6cc041e90c17 ("cifs: avoid races in parallel reconnects in smb1"=
)
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  fs/cifs/cifssmb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@manguebit.com>



--=20
Thanks,

Steve

