Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4275319887
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 04:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=FhySWImZso+xl1JCkVOEKxqefhh6yZ7Ke/cUzPCtnDU=; b=PVs0wHujXgTY816rzugVFBLMDd
	6ajluOAiqjbHKSSUNQQ27XTD4xC5ZLJiLZfGQrFBOt+4T+WK9o8YyInD0QhFDruVNosLbnLmqRmDM
	G5WOIpwWDoOCixcmY4C+VLVc5Nn8vmw5Zid5Mc4q1su2Ds6jJ3ozGcWdasV1jTfXDoF8lHaWl8Scg
	tR+ydIqKC30XVe5FLdEgSGaofolcDsZ53iggb0DyHE9gWdoOM/a1ce6hfgGcNFHg9Oy1l8vdymPtt
	GJN30wrDAAl8vW+dvSpkY+Pv4eFrk3MMC4dPFq1usCnNNNf7b2NS15NDqCFmMmnijxXBJICRT/yKS
	jcpvUj1g==;
Received: from ip6-localhost ([::1]:18340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAOim-00CLFY-UD; Fri, 12 Feb 2021 03:02:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37183) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAOig-00CLFQ-WA
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 03:02:13 +0000
Received: by mail-ed1-x529.google.com with SMTP id q2so9197045edi.4
 for <samba-technical@lists.samba.org>; Thu, 11 Feb 2021 19:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=FhySWImZso+xl1JCkVOEKxqefhh6yZ7Ke/cUzPCtnDU=;
 b=vd1pBW4Nvnh/psYDj8Etu/T1q/5KqFRvQY49o9DuEVBfFgBNVelTjYDevz04yju1Z+
 GH5mUtiCT7WtRJUyqEgY6s3tMSA2R5vZwKCA5AvB4eG1belafqHKVCWnU7Qwy+Jxo1v9
 WzC3YrmWt/sTJgBdIXwnEa+VJw6pB15fnntPSpO5MWDJWjwbNUByksRaDMBVciRTB23r
 4RlBrI46X7BfI8CRZ/cBJKUPhILwuxI3g1EIteUxfnMxgMpkbEIBL/nHqJsCUa09EW0O
 1VWMN73KWOfdt7qsMBm6ZZqyJHCYIvN35kNEhdqUZEW9zppKOLyDs4Zt2mCBC5wUCI62
 8kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=FhySWImZso+xl1JCkVOEKxqefhh6yZ7Ke/cUzPCtnDU=;
 b=ASQVpX+5+MA2kwqbeouEc8ZMwxheKXE3+3INwrUUD9rHKpoyCSPLIocg497bXXw0jO
 Jx0VrVglQ9FVvYWvI7zCbfZ4evwytHUtzIGGFSOj8SgqOWps/eo39bXB5Mtm25PVhmfn
 8QxYYZ4ordKMDWtObgftj8bKpU2n4KJJ8fWcE7qM2jK4G/h3O8PYfzYl6KKUaEXKbe1k
 XwFlumExOGUPJSnMY0vtVV3XFcfuqZaJm07LazF23vk+bqCsw49cDewPYOZljUAmQSit
 VH12u/71/X7QgtsAeMUC3QTpdi7U6IY7rYbgZORohWKJ7yIm1HVMRb2aorsnIqlv90M1
 lbKg==
X-Gm-Message-State: AOAM5324LVtRVsw+kFhsHXJW1TcVpCSvvf10qCk+yeXIakAzn8WeMY6L
 DXw9cVjLreGgDK8zlxczMxBH4AU+B0go+C2s+xZK0GmYieI=
X-Google-Smtp-Source: ABdhPJzuF7jP97/F7ofshcnmdgFEXvreHlUkriE/7IgjJlY90FXW/DGkvO94gE5NTRwFlgZj0DnI5HLCG/m/oz72NYs=
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr1210142edc.186.1613098924375; 
 Thu, 11 Feb 2021 19:02:04 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 11 Feb 2021 18:58:58 -0800
Message-ID: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
Subject: Building Samba 4.14 on CentOS 8.0 and gnutls
To: samba-technical <samba-technical@lists.samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I am slowly getting Samba to build.

The latest problem I hit is this:

-------------------
Checking compiler accepts ['-Wno-error=3Dunused-result']
                         : yes
Using in-tree heimdal kerberos defines
Checking for GnuTLS >=3D 3.4.7
                         : not found
---------------------

However, what was required was not gnutls (which was already
installed) but gnutls-devel.

How can this be fixed?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

