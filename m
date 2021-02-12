Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10F319CC3
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 11:42:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BD1wIF4DXA7UFOAGSN1stM0wbdVETKd9rewRFTSOdZk=; b=Ip3ergTztRvFrkmriuHTE8CeKx
	1fEY2ZINbaKTke3YKmJFcDJVIE6s4o+8gStRhGHqSYhfuBMSNwBXF0LnfR03bNP79250umTFHQHAC
	rqTUIFtWulzDR3rMPCRDaFYH3/6tsjQl/YlzAFU+8nyL2qm0b8hpL5eAQlO4AFD5E8SD2dxFupGdB
	jx+md+NaqM5slLrhT/8Ki/zslkgEYQYSOEEuf9zSq1SqyECt4geT/tKSDxAjFd3Y4xYnIqFj0JZPY
	C3uXERTZ+qYrPvs1W2bToSHu8R0xKZ1UhLxxtGVAaSRqEQdbOhSXq7kDvmTugDCnL1OnR9SRsLtpX
	hq9l8meQ==;
Received: from ip6-localhost ([::1]:28836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAVt7-00CO4m-1I; Fri, 12 Feb 2021 10:41:25 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:38238) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAVt0-00CO4e-JO
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 10:41:21 +0000
Received: by mail-oo1-xc34.google.com with SMTP id f26so1975321oog.5
 for <samba-technical@lists.samba.org>; Fri, 12 Feb 2021 02:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BD1wIF4DXA7UFOAGSN1stM0wbdVETKd9rewRFTSOdZk=;
 b=YvPgzS5eH6wrs4rAhIqrs2RTu4ukFhgTwi6RUFUgqe6/6V/dLxL/x752X+8K42BK6M
 KFo9nY87xoI7W7zZjpYeeDHWkCsEC0k36xWWUyQd8Lu+qGkCIP3oW2emkNUSyk+pp0Z0
 HCRkTOG+CdSVCzsCQNifCg1xw4+gdCVacUws/AaDhCAk4PJgwgdv0nchfAMRSjwN05tz
 1R2WfENdIkBTKXCQDg6CRCAMSCqGC03rrk2x3x1XZ2/40DVlEqMrn0y52tKmrf4D4Xlm
 LyN8TTaMveKkLoWMSzwBCr/u3SG/XMHRXSKdz8cm/gKgeXQE3l0oEIkJNCkdUYg7VR9D
 FL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BD1wIF4DXA7UFOAGSN1stM0wbdVETKd9rewRFTSOdZk=;
 b=c+fZNdrxP8m2uHzBRF1FdFCQfqhOIIa9eCexTgwlepST8wAKVBsBJdaN8s1E45fpFb
 PfMvHeCVPcSpgIRplJQt0WMu/FMrbrVLDyM7OTnvrPiwtzYaUS2vbwVUWvxR2by7y6eq
 KmGs1t1fGTqZT0nM+9M0OoA2VsNAR87QH/FM30lgDKEtOlL+qOgcIHf9AljYZFapsDl1
 iCIkpqr6GVLtiRnMR6Ki8TotYaLwwxLoOMTvorSW3Cxi+EGEz/ccsbFQeE/k+HB72FT/
 z4LhG9kOOU3rYiKi1EJ7ORB9b5+9Wx4KhDQqk3IndhQfqKfR+JvkMra4tZzcbYeopm7u
 I1Jw==
X-Gm-Message-State: AOAM530VvEtixmgZZdlHC0SNGBIFgmiEAETeBqKYq1gwdv9oiC+Nq4Sa
 42EQXO8R7H0XPqYgEfFu2qtFYMwn6LoYPNEDzUfRuHjjPVw=
X-Google-Smtp-Source: ABdhPJy8sH/k/jP9pCvFB1y6297eA8OBWBwi9CoULPC62mvsIXO1YlSNMF0g9tKpgfWRM0LGWFy+wfnyvBYEvR10z+k=
X-Received: by 2002:a4a:55c8:: with SMTP id e191mr1435890oob.13.1613126476017; 
 Fri, 12 Feb 2021 02:41:16 -0800 (PST)
MIME-Version: 1.0
References: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
In-Reply-To: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
Date: Fri, 12 Feb 2021 05:41:06 -0500
Message-ID: <CAOCN9ryq_P0j6brW+UW7v_4d0hX12MP293e5TwkieTNNh7z9ZQ@mail.gmail.com>
Subject: Re: Building Samba 4.14 on CentOS 8.0 and gnutls
To: Richard Sharpe <realrichardsharpe@gmail.com>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 11, 2021 at 10:03 PM Richard Sharpe via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi folks,
>
> I am slowly getting Samba to build.

Take a look at the branches for samba-4.14 in my repos at
https://github.com/nkadel/samba4rrepo.

The RPM's that RHEL 8 published did not include the python3 "devel"
RPM's for various dependencies, so the Fedora style .spec file is not
compatible with it. It's really frustrating and demanded rebuilds of
other Samba related libraries.


> The latest problem I hit is this:
>
> -------------------
> Checking compiler accepts ['-Wno-error=3Dunused-result']
>                          : yes
> Using in-tree heimdal kerberos defines
> Checking for GnuTLS >=3D 3.4.7
>                          : not found
> ---------------------
>
> However, what was required was not gnutls (which was already
> installed) but gnutls-devel.
>
> How can this be fixed?
>
> --
> Regards,
> Richard Sharpe
> (=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)
>

