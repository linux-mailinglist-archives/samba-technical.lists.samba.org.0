Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 255098AB42F
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 19:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tvr/x60xtpTktT7h8r6FpEdBLh7taTCd91SP6ssulWw=; b=WHaHS7m8/BpQlHE+h9FCt+DPx7
	afyFLRl+qr1RE8+6z8FqFC8uxxzJ7Myk7tMnVHb7cyD5aG3OWrFMJFEiKm+rVv+7+f5qkS7naZHHN
	TX8kKeCp4+Y3PIWSGXSqmpYBZiBAQOJqCC5MHkw9bq3++3ftjt+QW50qJivqal8x7Bi44mG1DdHHP
	hhqk33Ng2aApAfSJjAUrgyU9d+ckLXOikvVg2DO656BTjZJ1KFtKBmAyPNj5T1c2rWNhYWFFxgnuR
	dwweXv47FJS1SqU2vGITd/kp3pardCJWZdjcS16F0lBxv7ZPc2VucHVPxSEUI2/rDNWQuxJDSE/sk
	HEe6Ac1w==;
Received: from ip6-localhost ([::1]:24158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxrkM-005DET-Ng; Fri, 19 Apr 2024 17:09:58 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:51391) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrkI-005DEM-6S
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 17:09:56 +0000
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2da08b06e0dso27209051fa.2
 for <samba-technical@lists.samba.org>; Fri, 19 Apr 2024 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713546593; x=1714151393; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UvarPvMFV759JWyu9gt5vK+dq/Kqj8aYtJFs6soSg8A=;
 b=GWBYgbD6q/11V+TrbcZuzm8j1vn+1n61mn+ADRfacyV5mgSt3t/VBhSLZ7pjmqhsTp
 VdXf2JmMsOUhj2C8cu06XxDCCWdwLXJYOJCGOTnULxLOOrfuUwt2rwMp463yJOTYRC7R
 FkFWduww5qZVcGSvr9zDDJO9mrHb9xg0QTh7DuerhGKA68pk6xW1CmIejTqbFN8N/isM
 QW+Zlp8uxIbqaP2p9OYLAe7dvYOioAjVqCiy8bYclv2bPe81ZO7phS6ZJjzmCwxL32F8
 jmU6kk4h7iRWSB5oztP39SUPNfvAMq6YP7ejrTn/2GTuaROzFZmRoX2A3LgS3xct9RjY
 ZkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713546593; x=1714151393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvarPvMFV759JWyu9gt5vK+dq/Kqj8aYtJFs6soSg8A=;
 b=rxixEBSahdaZWqSX4O+dAu2YfUcjwnD/4Rq0SmIt1QUq0dZc3tnHXSgCzKsh7iT32x
 QCUgyI0Q4Im925TE4eB3CnIBQMqrjeY7EyYM5UFlOSDWXFbAw87ucZn/kNuMf7Fh7TO5
 tSeLgEpklR3uR4zmkz8Uur6Yuh/DkLFTmNqRIf0uhY2516pigmiCMefJinQpDCrm4oS7
 EAw8YzG+MCXYh7VYkWzMdD0OT6F47sbcEW3HO8HYxGh/al/gyrq3wO2P/xd4oM5k3oEh
 9cAZk/bsCZwfDerrLpqLBER4tNxWvMvAaFW+XHzAQVY+onkjmORqVNMv5Ro58B3OJ0TK
 bmtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFc9+S3AHEUo9i35Ad4EGIuCzzU5cTNbdFq4x1t2GP8YS3jom57rgoZa5zyIuyCvq9iyINdn7JkL87Ltci4Bzhav5THq2OfcTcZdsNQa+c
X-Gm-Message-State: AOJu0Yzk8NzmH2rNMi1zDzNB7E+Ii0pXe+ZqWZmNxbAt6ZDlKVG/wBsE
 vqSDuEvpuEzuSD4/rID2BRJ73by688w22spn1VApgYbXOf3wMHskJxWJyBF/HMh4F1V7FpFjC1B
 Qgjfgonr1/g2cYfRoaStgFgyzmq0=
X-Google-Smtp-Source: AGHT+IGy1T0zgFoxZVkYTrcJCHiBPv2/74yF+5sRwbG4vmsWRw8QNRtTYpMgBvvQzoo+paJQgSrLG1Jdl4WdhrWm0LY=
X-Received: by 2002:a2e:a489:0:b0:2d9:f7f8:3e88 with SMTP id
 h9-20020a2ea489000000b002d9f7f83e88mr1577981lji.33.1713546592655; Fri, 19 Apr
 2024 10:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
 <c7d80c1538db3a414636977314feba13871907ef.camel@samba.org>
 <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
Date: Fri, 19 Apr 2024 12:09:42 -0500
Message-ID: <CAH2r5mtv+-sacaeSVVs+jWGoygNji+R0Uq4vEn8p4Ymf=u0K2w@mail.gmail.com>
Subject: Re: Missing protocol features that could help Linux
To: Jeremy Allison <jra@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 19, 2024 at 10:55=E2=80=AFAM Jeremy Allison <jra@samba.org> wro=
te:

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
>

For a surprising number of Linux apps mounting with "nobrl" (which only
enforces byte range locks locally, and thus POSIX style not Windows
style) is fine for SMB3.1.1 mounts.
--=20
Thanks,

Steve
