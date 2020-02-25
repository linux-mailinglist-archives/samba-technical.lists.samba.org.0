Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E9F16F1A3
	for <lists+samba-technical@lfdr.de>; Tue, 25 Feb 2020 22:49:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GFL+JFSeK8Pf05fysDahqfMvWqdD2QNFZNTabpiCQ0s=; b=nSnZBhTAaRcrBvepASD1WzRN5g
	hoHFeEVn9yAfHC4eCEPB3wRSDgsdX1yFIce9yqkHjwwIf7ZuEhrBww6KFb9twrn+cuxmCffTLlINa
	AZFqQoUcIGR1CU5oI8gg5GHHbqUL0QxB+ISnrEFzjXsiB8i0shTeVpoYUsxIa+cKW+htLMmLqd+OK
	Kx1+Yegfwt/tK2DxYhyUGCcDPv1WConZPrXoK/IqwYsmHfT6ETcC0SlVs5FH43ZjJdjPdRgzLuqwc
	DcFUV3Mckeql/eyqL1LkYWAB8AXMrPgbVyVZqfw8SMaqpS1qqgt7Up2/d85B+EzQNdp85m5QP78Lk
	VVVccN4A==;
Received: from localhost ([::1]:54078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6i4H-00Bfsn-0r; Tue, 25 Feb 2020 21:48:41 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:42299) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6i4B-00Bfsg-ME
 for samba-technical@lists.samba.org; Tue, 25 Feb 2020 21:48:38 +0000
Received: by mail-lj1-x243.google.com with SMTP id d10so563964ljl.9
 for <samba-technical@lists.samba.org>; Tue, 25 Feb 2020 13:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GFL+JFSeK8Pf05fysDahqfMvWqdD2QNFZNTabpiCQ0s=;
 b=eyyOVvjXkCGNvg8gvaN5NB9FmldzBAcoAso+hFf3aBrIhNjsjTl1Qmdh+CjkyuxFQj
 kD/UCGHWxTrCk4COLlDEDZB0356bwMpJNsVU2INXffi31XZouE77m0XftJ+xzlZI3b5B
 pvYOjtHIbZVk+S37zcnR50onZ1i4QdtIepMovMFLfmXNLP/fJY+mTWCk5e6+TxF5Ag1c
 26hDAAvOdeEJwle5g2Pf3bImC3CuQMJ50USMHFEXBLRdXQQk9VhDhyn8NxUMnmpCaWGk
 swpvG32sl19bFwxzpEuUWH68OeqqM5RlTRYZdFJ1q5gfb+j0BT4o8A7rCJ1gMrLzStBG
 TAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GFL+JFSeK8Pf05fysDahqfMvWqdD2QNFZNTabpiCQ0s=;
 b=EBl9c+r0swY7+JeuMpOSC8/3Pbpk08QGdtV3Wys/K8cLWbs18+5ay8TC1ZaRy7XqSz
 bgzTQ7hqjuwpxlA7t3SSP7zdgtlynui7ExugMFCl51wgRs19fwO8H5ESvqdNbnp7bUbF
 vfbPbaK2rIlYhVWfmSE2sIjVWb+e1Ehm2rC0W9plHW+NqMKa5k4SPSTO15nT8/ibetBt
 k3dJWk219ILPYezOiIKmUnuNeBwsI9v3c2c8f496iO46egxDrShY29Mbc1gTsxMa8JHA
 PQ/uf4kkzgoZqfzrZZRGNJ73EncOm+4GcOL74zqTb7EhGy7rB8g/sU2zToFjprDBK3Sc
 /w8g==
X-Gm-Message-State: ANhLgQ1jjWlMx8S9dGhNd8mJOMKcIGkN5myCKAiizUYqrTlULyMBB5vH
 T1tMkmiUkAkeprXYmh0gmwCmt7kUMrN4vsw4ZylIxautezc=
X-Google-Smtp-Source: ADFU+vtW6k4eoJuAKVStKdNuPMsiHBoWn9M6a0/AboDob8v3q+3WOecPEKuaqCfHOo3bc4Tws6G02WckjlQCXDIJCUE=
X-Received: by 2002:a2e:9008:: with SMTP id h8mr619141ljg.217.1582667314589;
 Tue, 25 Feb 2020 13:48:34 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
In-Reply-To: <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
Date: Tue, 25 Feb 2020 22:48:22 +0100
Message-ID: <CAC-fF8TfRsx3WT3Gx3h=W28tT_V9Gfi_dvyA-XY_1zYoRAmbcg@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 25, 2020 at 9:17 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> And:
> LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/ldapsearch -h
> sdc.smb.net -b dc=smb,dc=net cn=administrator -Y GSSAPI -N -ZZ -O
> maxssf=0
> SASL/GSSAPI authentication started
> ldap_sasl_interactive_bind: Invalid credentials (49)
> additional info: 8009030C: LdapErr: DSID-0C0904DC, comment:
> AcceptSecurityContext error, data 52e, v1db1

btw, here are the openldap/cyrus wip branches I test with:
https://github.com/iboukris/openldap/commits/gssapi_cbind
https://github.com/iboukris/cyrus-sasl/commits/sasl_gssapi_cbt

