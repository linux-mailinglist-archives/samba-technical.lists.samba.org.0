Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2ABB03360
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 01:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pghOaMNTzGLDB+pGIqjlpDyoXu4PVYRYPaX2Vz5N3AQ=; b=VcMYmUHdBA0VRe7Tbd5TzN2DbJ
	+26j9FFr1gu1kr2mfxAfbv/Ao9wtfMFfkK09P5CXrNq2znbm+hpRF1nzZG6uT2/rtSr9COjjjCpb9
	tY9ZoQ2LOUesNt16dv9bCA2creu8JNFImv9Lw8VgT/w5fpKogHfeEJAZxJGQjc5s5EKslEwnJ+y5K
	rW7bVt2Od3/u4e7O9B5hjWR6u7nvcNJYa66ZgtaAR5X3V+kHNhQ1Ygp6xIIvfAuUWhA/DrFnLUV4w
	5OQoAyfpOqmoMJH1iX2vdFK7wqlrEfkM8xnwmY7Ojscsr0ClMq9CT/M2nZEyqDBSHSXc+nZr2oK8S
	Kml1n8Pw==;
Received: from ip6-localhost ([::1]:40392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ub5lR-00B5rg-0X; Sun, 13 Jul 2025 23:05:45 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:49154) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ub5lM-00B5rZ-LO
 for samba-technical@lists.samba.org; Sun, 13 Jul 2025 23:05:43 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6fadd3ad18eso36031286d6.2
 for <samba-technical@lists.samba.org>; Sun, 13 Jul 2025 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752447938; x=1753052738; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pghOaMNTzGLDB+pGIqjlpDyoXu4PVYRYPaX2Vz5N3AQ=;
 b=MEbaojSpOVzBCUw424zh/ELnjRGafmQr0SvRhrfAAip8FGOVqPadU3tVoPGJZj2hl8
 StJEWgfFfehTM85hEpnFLXUBotoliluntjP9ucGaZ8VwhaDh/CSaANBWdz7U9r77MsXK
 Z7DLFWauZ8WNOtWCvn8z/bv3t7IO+08+AKfBheZYAUTczrF0J9sFE1Zr+JVp3DNT6jNO
 MdlyGWgkNPu7GpGNd7ivg5J77HN5aL2KH3opjDsmnGk+wjby7CmNew1aaKeqloJ4vAsX
 WsMFRZfa+3dvelzVZxpt+ys+wsgcUxJyJ7j4KtvfAwQnwiQU/iQaYIKDCg0K9ApjJ2YK
 I3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752447938; x=1753052738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pghOaMNTzGLDB+pGIqjlpDyoXu4PVYRYPaX2Vz5N3AQ=;
 b=rvZSWjAw5b4zKQN86q9L/YFl60S67f+QtAsYc0gTDVUoBapmoI2U7i7vVkTQQDtKBf
 2kEojSfhw3KJqQniShGU98beX1ExfNOwCSEVoraV3GbxCiab6bDL+lDnKc+dooQ4JKOn
 cO6nn5z3N71hWwfbhHJBScmiyxUQqceYLr0sLHmMOghP9BaU/Po3yBouOD+9AB8pIUwG
 Dw1ZsvKrpp4aOvAmR5sHJF1KmqaYdMZpl8g/0YK9JSfOqo5MnknpQfbfWdyyK0jxhuT/
 /E9HNv/bAtbR95ACoc4pK1z1QM1KjvpEV/sHK2esjjDZkyqB6vf+ieeYQBg6hgVGplN4
 COkg==
X-Gm-Message-State: AOJu0YzVJd40z4CaRT0j2SeWQHOQWki6iA/pZz9UU6v0dPNlgelcEQh0
 yOVF0pqm37YxfeNGsJeqYehGWB4Fyso+cSD4ceLgCsy+EygaHEA0hi4VnRccbpu7Nw5GybfP3Kw
 6lHHELC0IeCgsKa7G0HIJkzSce2qjaSWMwZRmI3g=
X-Gm-Gg: ASbGncvv9HxjC7MEi6SNDY1jLXuWgNmy0AE3WnttJ0SZ1QDM5F45ynFWhWb2cl+4L9I
 Cl/eZXBxvyetoBREyoAR2JkI7S5H65ENfRLpgdaBpLoT+xO1zYmbRb6299ILZtWWPl++05pYgou
 EuDtoPedTDasz981o39r7LwCS2Cxy8+YPhTdMVa6zTWSzcRsOQH1oBx8qJerS9N6MeyWhIa3BAU
 mt7VZJY0BJadEWMs7LF4f/DVAwRhN1dLaDFuezXJiQ1IJGxkasn
X-Google-Smtp-Source: AGHT+IHc12ZUW2LmyNcGWCXkLrnbQWQvX7+8kndPhxLQslSgebcnquGSpNeEz4tNWW1Pq9AwGR2I2QtbkHYReVlrYJ0=
X-Received: by 2002:a05:6214:2a47:b0:6f8:bfbf:5d47 with SMTP id
 6a1803df08f44-704a38beb6dmr170740766d6.24.1752447938437; Sun, 13 Jul 2025
 16:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
In-Reply-To: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
Date: Sun, 13 Jul 2025 18:05:27 -0500
X-Gm-Features: Ac12FXym8mydveM1sDm1q7OfQg4K3-IMntgjQQkH_AD3HiM7LnzgyhLN7UccTxw
Message-ID: <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
Subject: Re: Samba support for creating special files (via reparse points)
To: samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@manguebit.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It does look like a change in behavior on the client as well (the
client didn't used to enforce the server correctly setting this flag)
- see below, but it is tricky, because without the check on the client
for that capability flag a server could end up with unusable empty
file on the server if it actually didn't support reparse points.

What is strange is that when I comment out the checks for
FILE_SUPPORTS_REPARSE_POINTS on the client, Samba does seem to allow
creating special files via reparse points, it just doesn't properly
advertise that.

commit 6c06be908ca190e2d8feae1cf452d78598cd0b94
Author: Pali Roh=C3=A1r <pali@kernel.org>
Date:   Sat Oct 19 13:34:18 2024 +0200

    cifs: Check if server supports reparse points before using them

    Do not attempt to query or create reparse point when server fs does not
    support it. This will prevent creating unusable empty object on the ser=
ver.

    Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

On Sun, Jul 13, 2025 at 5:58=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> I was trying to test out creating special files to Samba (with and
> without the SMB3.1.1 POSIX Extensions) and noticed that although Samba
> reports special files properly (as reparse points) it does not allow
> creating them (it does not set the filesystem capability
> FILE_SUPPORTS_REPARSE_POINTS except in a very narrow case for offline
> files, so clients won't attempt to send create requests for special
> files to Samba).
>
> Is this intentional that Samba server does not allow creating special
> files via reparse points?
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

