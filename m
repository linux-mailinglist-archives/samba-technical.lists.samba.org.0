Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F37096D2E1
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2019 19:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zvmK4oo7UnZcq1oY+8Vc0sIfpk/4xoEF0mrsMnZnEw8=; b=UQd//mtXQ1M+5iFMPrK3d7qgY9
	C+i8Qj6FDoL2RWi5fEuJThsNgKSXSqYa0F+yC2v2TwaTI+RaXn5A0dfK1+PagQEdI1SiSkanXD1v4
	w2IInRgfl++JKjf5fvKiLXALoQlvfRlUxWE+0JtJqTEUKtU/ZMJFkw+6tNYLLLSHDmjagigNTWvhI
	lNnKrmNb3hbFbq+w2ySWeIeMiyRyYT9d/9tR1hep3uf5xnWQ2DjcHaE48dwWTi2aSREb3CCh8qxg0
	XmnGAtz3iVUjPUpEO6cDeVYNOXTSLLv52KGkEZxkJ7k4sLrRgAYSpMKxEFdRhCs5OHOo50hvuud8T
	jJ3vlOGg==;
Received: from localhost ([::1]:55522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoALF-000zT1-Rh; Thu, 18 Jul 2019 17:37:17 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36182) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoALC-000zSu-76
 for samba-technical@lists.samba.org; Thu, 18 Jul 2019 17:37:16 +0000
Received: by mail-lj1-x244.google.com with SMTP id i21so28196160ljj.3
 for <samba-technical@lists.samba.org>; Thu, 18 Jul 2019 10:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zvmK4oo7UnZcq1oY+8Vc0sIfpk/4xoEF0mrsMnZnEw8=;
 b=jyyVhdY1qGbvbJgQcBEcWktTO8sQjc1vMefUshoSF00IFFWQ1vj52M2bF6WjFwbJKT
 PSJF97LDbN5l/NSrA2f8V04lYjm4frXXdtJUZIdBiLWoLrqT1prRvagiNSUev0n/zXfC
 r/8KoWGjPGTg3AFT8pi1chsbdG3hGeRBO06o3tSbn1GObCfa50GC/BHIgwcZguQKPy0m
 wnPak9zRjsPw1Xy7ahJ1cpzT/HOsRc7dC+GZJfsmglJwZxdVYeFJ9m9zoYCkgdZnKZcT
 Q7efLwDimY0kAEHtGu3fv7Vjcevwafcg5sXmo5BipmIzzv9HCG2EMmOhQrp0ayPfGZG+
 dHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zvmK4oo7UnZcq1oY+8Vc0sIfpk/4xoEF0mrsMnZnEw8=;
 b=pxR5A9UbNIBdz7KkPNtLSiqahF2DCwMqavyJMDFARFZk7CtXruXac6ZmtHQFxdbRSt
 pwwforh7HLIIKldITrkfl4tLdkbkeADy5vzAbwaLIYL+JQQOrA1zlbN0EU4V/pvwUOgQ
 R/ovDJ2YGGWCBl7U7ArUxibug5/f4fHPfCB6JdOGo4PDtziD4oeM7bDvZ2kHQAgpfZl8
 czYYATweUoxxo8MgXJ/uz96d8M5///CiBblgP+VtfdsPwBrsgBlb9cnJ0MWpxjRMbZNM
 P+ftc3QIwPh22eqxygtB3CmyPA6emIXmKN9ojdSmU85yDDbivq0OuJctkuDP8AvgNvn1
 IfKQ==
X-Gm-Message-State: APjAAAWVeW2ciWoPk91aYkAMY/goSFMbrVTzT/EbxcMvUenQshEmCf6u
 mKIJsUlny9MW4UyCTrs6LTv2F2csrCZpYozmFQ==
X-Google-Smtp-Source: APXvYqwY5NELv0ogOElNbG3TOwFSrm84E6qf5D2pYxqwKkJOaxzod5q3T6KGG29WZeZBEeJx1ap3JbuDl6gGIO5+pdQ=
X-Received: by 2002:a05:651c:87:: with SMTP id
 7mr17369880ljq.184.1563471432791; 
 Thu, 18 Jul 2019 10:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtn5SyUao9Y3f-_ubqgSV8t3RSj2fzAR9bE5ZQQ5dFcRQ@mail.gmail.com>
In-Reply-To: <CAH2r5mtn5SyUao9Y3f-_ubqgSV8t3RSj2fzAR9bE5ZQQ5dFcRQ@mail.gmail.com>
Date: Thu, 18 Jul 2019 10:37:00 -0700
Message-ID: <CAKywueQEk84q-3PNNvGQNYLc9DXfygy+75LNBfyTKRo-iFvmGw@mail.gmail.com>
Subject: Re: [SMB3][PATCH] Speed up open by skipping query
 FILE_INTERNAL_INFORMATION
To: Steve French <smfrench@gmail.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

index 54bffb2a1786..e6a1fc72018f 100644
--- a/fs/cifs/smb2file.c
+++ b/fs/cifs/smb2file.c
@@ -88,14 +88,20 @@ smb2_open_file(const unsigned int xid, struct
cifs_open_parms *oparms,
  }

  if (buf) {
- /* open response does not have IndexNumber field - get it */
- rc =3D SMB2_get_srv_num(xid, oparms->tcon, fid->persistent_fid,
+ /* if open response does not have IndexNumber field - get it */
+ if (smb2_data->IndexNumber =3D=3D 0) {

What's about a server returning 0 for the IndexNumber?

- if (rsp->OplockLevel =3D=3D SMB2_OPLOCK_LEVEL_LEASE)
- *oplock =3D smb2_parse_lease_state(server, rsp,
- &oparms->fid->epoch,
- oparms->fid->lease_key);
- else
+
+ *oplock =3D smb2_parse_contexts(server, rsp, &oparms->fid->epoch,
+       oparms->fid->lease_key,
+       buf);
+ if (*oplock =3D=3D 0) /* no lease open context found */
  *oplock =3D rsp->OplockLevel;

oplock being 0 here probably means that the lease state which is
granted is NONE. You still need to keep if (rsp->OplockLevel =3D=3D
SMB2_OPLOCK_LEVEL_LEASE) gate.

 /* See MS-SMB2 2.2.14.2.9 */
 struct on_disk_id {

Please prefix the structure name with "create_".

Best regards,
Pavel Shilovskiy

=D1=87=D1=82, 18 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3. =D0=B2 00:43, Steve Frenc=
h via samba-technical
<samba-technical@lists.samba.org>:
>
> Now that we have the qfid context returned on open we can cut 1/3 of
> the traffic on open by not sending the query FILE_INTERNAL_INFORMATION
>
>
>
> --
> Thanks,
>
> Steve

