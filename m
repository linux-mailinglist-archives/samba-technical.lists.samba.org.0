Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A496581E
	for <lists+samba-technical@lfdr.de>; Fri, 30 Aug 2024 09:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=LhByPWJGIPwskeK0ezj2Mx3vUl2irUaPibjCZEu92ac=; b=goQWcus7u3f/CiOe7CM0kIxN4i
	YyhWaW2ynQSUsGRQUyoN8UeTD1Mm1FzZWeehTmp74bH3TewAyQG9UeZBXryqYo05zAVzr+2AIk5nm
	yL9RmidNvC/HYWc3ULnom3u1rPVztZ1BHc8NhgUTY5zmjKmGFpOaZcv6XRBE6cumb537iBaiMHeKL
	F5VxhOW4O6tPe3gMWN/CQfXTTNx8ZEt9hS5Yy68ggcnkzTWatCKwtv5dcpQvt6PEvImXNK1jDSQvC
	wIm+gDs0hkP1opv2X2uO1j2flzdNZubdy1RFCvgjBrq8L90qgXn+ekcaZElED5CLB+m6EwA4Rv9m9
	RnCgeZGw==;
Received: from ip6-localhost ([::1]:64938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sjvn6-005pEW-MQ; Fri, 30 Aug 2024 07:11:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:58862) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sjvmv-005pEP-AJ
 for samba-technical@lists.samba.org; Fri, 30 Aug 2024 07:11:20 +0000
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c0abaae174so1596292a12.1
 for <samba-technical@lists.samba.org>; Fri, 30 Aug 2024 00:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725001875; x=1725606675; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=icXVHrzAzkisBCnSmmLuUTR2fS7DZ5X/XtWNPwr69rA=;
 b=WWLD6N7oLvrj46bMOrLonhVXFluQgI0UQitglRKxh1m5TS1LEmsuGyQkXT73kKSMt2
 YURzCGY2CxYY4j8UWc9i15Vi3/LHT9YDRwka2LqPk8s3VCndR2tTYA8A2VG5xInuMAxw
 7Oq9/TqL1jcO9i8CIKT2Cx3v/GCLcpSkIq3N+pHaIamt+9oUjNu73+GoCHqW3A7PVT7K
 etBeY7oCY3/iFoYsiOcurk2GOnIbglzfdA5pT+Gjp6x+NpjN/VNbtWdGgKdlQ+H/UHsA
 jM3rMDbZBwInMefG2ma5KET261ki1e7CQlc+Y+a4DUOM9Lt9OGW6aErI4idnJj5q/5iX
 G8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725001875; x=1725606675;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=icXVHrzAzkisBCnSmmLuUTR2fS7DZ5X/XtWNPwr69rA=;
 b=lSMg3rIDvbKQ6eoBf4Aqfy+hlvGmMqFD74qRoRbPNmZ6BJNRlhpIXIicfXHPBU13YH
 rQvWzMfqXJ5//PEWDQdRlf9+qVHWLkgvftukOY2xyg1uk47Tr/0U32gQV3bqxbz+QMgY
 mN0OiOcVL6ebvBsHb7XOebnCckWAm/hGRLboyUnRUgmPxluum2nHBMfCNRLwCJb8jGLt
 iYiG2FTwxoHuPY8Ch/unWBuaY2l1zbe2NuFeUUVQymFCEewD3yhlfEMSeMzLftCe/xpb
 r2BYhUuQtqjVJ6dr+p+CB9fiZk3VC5k9OHVuWlJAQ9h6DqgjDdjKvpCfE/VwTiiIVdsu
 inXQ==
X-Gm-Message-State: AOJu0YyXgw6kqV0mzwoGcuvAHOEpSHLjxkVV5fLAUvW4WFDqoc2Ra86j
 KuHTqPe9hrkmyBrJQ9uA7BZ3/uvcMl5axFNMlaubmFDi2is0xB+yrMp+YwlMg9OEntjgb6O4EKq
 Gtqys4Bu+2pq5afbYYdGkSVjVs6Sk1+dSaL4=
X-Google-Smtp-Source: AGHT+IGZtJMibxUnFZGu1nuO6Rp21ZUsGhKcpe3ALQYZ3VFj7w/tUBE1RjbhGvzCdy07rkQRPpQ3UcMwANhk9+xUWqw=
X-Received: by 2002:a05:6402:234f:b0:5a1:1b3f:fbf5 with SMTP id
 4fb4d7f45d1cf-5c21ed3e07cmr4413516a12.12.1725001874816; Fri, 30 Aug 2024
 00:11:14 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 30 Aug 2024 10:11:03 +0300
Message-ID: <CAAu4aPH0nJao+Nn808R=3S8e-quUHr4u9S+9tuqO4CUmq8MOwQ@mail.gmail.com>
Subject: outgoing neighbors do not appear in drs showrepl when samba is
 located in a separate site
To: samba-technical@lists.samba.org
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
From: Omnis ludis - games via samba-technical <samba-technical@lists.samba.org>
Reply-To: Omnis ludis - games <sergey.gortinsc17@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, if you enter samba into the windows domain in a separate site where
there is no one, then outgoing neighbors do not appear, maybe someone has
encountered this problem? if anything, the sites are interconnected via
site link and replication between them is set in the range of 15 minutes,
there was also an attempt to make repadmin /kcc from windows and samba_kcc
--attempt-live-connections, but none of this led to success, I also noticed
that the FromTo connection is hanging on the windows side, but still not on
the samba side, maybe someone else can tell me if I=E2=80=99m looking at th=
e source
code in the netcmd/drs.py file correctly
