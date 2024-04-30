Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0248B68BD
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2024 05:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MoZlXSZP/0npl5u6Gp7hc8n3Y3K8zPSHo+Cg+9jfJxs=; b=R6QrVU2rfpqNJ0tdTbMmbMrgOq
	hmmQs1o7n89cttpAL4zVNUcVdPpjeu7LRkdA/FMEWkreFVoJ0rneJ4tObkWhpIoopQgv5W4n1xcsO
	h1Y5FayoKDhhQAqG3+UBtADqSpYjsukEr+GSR3ZMrPOJQ3pWe4/0CgxVa7c6pUlvtw/682afXTohw
	BHNaYGlWnGMwSDsn4u9nC3jLj4XLYyzFfkCp64ZAV10t0RB8ku2/dIULQi3jNdbX2kGtjHbihCG5k
	WOlr8DqgqOetssxiZ59UkDlkpDuxHrokMC6cha8YBOBmmwOPIieVYxJpfiZP7vlGpaMJFtA7Usj6k
	5xaC9nPg==;
Received: from ip6-localhost ([::1]:27086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1eCY-0062ms-WF; Tue, 30 Apr 2024 03:30:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:52569) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1eCU-0062mk-09
 for samba-technical@lists.samba.org; Tue, 30 Apr 2024 03:30:40 +0000
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2dd6a7ae2dcso82403511fa.1
 for <samba-technical@lists.samba.org>; Mon, 29 Apr 2024 20:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714447833; x=1715052633; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoZlXSZP/0npl5u6Gp7hc8n3Y3K8zPSHo+Cg+9jfJxs=;
 b=MdbpGp4uj5qvLwKbTavjktLtaDqLsGBA07Zn9d9tRvvq0MULmn/9APFj071M0udGuH
 uJO3Y/rKrSTDSSrb8YgVl9X+3pyJiaXZ7HRtYMYbs4kL2eCEM6tKnD9PCovkq3XwxgJJ
 y1OxEmRJzB5F8bAQLs3SgFRsOvCmkRrSHUA9xKIw8M1hubkBXnasZNcFNgfmsLbebetQ
 FBjX2kG3233QeoMG0RLULKgNUSCNllKLwRXATjbbhpih/GqwKuUSx8f7FJ/PvyCx7TYi
 GZcJAezru0EE3QOQmPgLM6oTRxb1Q0FtRS0YoNm/Bq9lMP+4BLzYgOgQg8gKT2RCMQhx
 vQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714447833; x=1715052633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MoZlXSZP/0npl5u6Gp7hc8n3Y3K8zPSHo+Cg+9jfJxs=;
 b=p2rkdrPE8IxGngxmStldP8dnt6YHpqJEp7PLcdmkNBFGYCP68TRamHFERXxlHTUxEP
 +QkkcG8ZQnvQGxgUL2wTSNULegurbM/I5eB7ZBcarK7sXxmCdwMZOBKHiAcnvTWI7UYt
 dCwvMUYBkIFst2C3GcUGW0qise7vQoIptxeFU8KmZknXQb0L9KGr/pDfcKFW3X3nu0SK
 PRz0w36poeJ/NPASteqEL+yD0eb2E+JQCE0P5Cl1Sb1RlKYiEYjVgm+XabsaMtLOXBao
 M0EOEU6EQBlZmWbAiSn35oJIGsy6D8qdIws4p0iw8AvndRBrECU0DU8HqL768hEdAhw1
 4Klg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3hZLcc1GYRVrKPaC3EuyJXEMILXMYU4u5ZmcEwFFL3MOD7ehJwJNKztzegUQQ4fYKdXZS7AlnqmTaphj/Fp61Ijjn9eh+28r8nXjEAZ+m
X-Gm-Message-State: AOJu0YwZCcCLYX7/gNv9UV1cVc3reRDcFbZ5Ooo3Xj3G+S6jru6hNLNF
 P81w4ZzEOv/P7kfPEpP/PgcIH3kBsQs/b99TUgZ0nn5ROkP7x/hxqL6OAZOl7bV+u+Tthi97js7
 B85YNP+ix2odJuT2sLlA8CatuVjBrtA==
X-Google-Smtp-Source: AGHT+IFwkPOLqw8WtqjbNzTmmhTNLX0Q1atBGD1deVAz7dqHzyROhOur4V0LlxYm2Cw/rLJsRgiss0ST8lIYG/3J6Tg=
X-Received: by 2002:a05:651c:221b:b0:2e0:5d7:a3a6 with SMTP id
 y27-20020a05651c221b00b002e005d7a3a6mr6445182ljq.9.1714447832661; Mon, 29 Apr
 2024 20:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
 <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
 <CAH2r5muhcnf6iYaB25k+wZC50b5pNV+enrK=Ye_-9t2NCVdCJQ@mail.gmail.com>
 <83480311-74b1-4ee6-be85-5b21b0f55ee9@samba.org>
 <Zi/UzF/guANa02KO@jeremy-HP-Z840-Workstation>
In-Reply-To: <Zi/UzF/guANa02KO@jeremy-HP-Z840-Workstation>
Date: Mon, 29 Apr 2024 22:30:21 -0500
Message-ID: <CAH2r5msSmi7z0usFAU-BGctoApZthgqy6j9ZdghYRyifBNB60A@mail.gmail.com>
Subject: Re: query fs info level 0x100
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
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Worked for me.  You can add my Reviewed-by and Tested-by if you want.

On Mon, Apr 29, 2024 at 12:11=E2=80=AFPM Jeremy Allison <jra@samba.org> wro=
te:
>
> On Mon, Apr 29, 2024 at 06:44:39PM +0200, Ralph Boehme wrote:
> >On 4/29/24 6:13 PM, Steve French wrote:
> >>But the (current Samba) server fails the level 100 (level 0x64 in hex)
> >>FS_POSIX_INFO with "STATUS_INVALID_ERROR_CLASS"
> >>which causes all xfstests to break since they can't verify the mount
> >>(e.g. with "stat -f").
> >>Nothing related to this on the client has changed, and ksmbd has
> >>always supported this so works fine there.
> >
> >ah, I broke it. Fix attached. Really embarrassing...
>
> Double embarrassing, I +1 reviewed it. So sorry for the bug :-(.



--=20
Thanks,

Steve

