Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2347A8AAB2C
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 11:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Wd8qfVpOSi2aTBE1qS4Ju6mUNYzzs77q4PD9LAsCG4g=; b=mGBrtzUTLfz1RcrzWCVoqsfPm3
	FKPJjIKta1WXiWmlQsYjEnW8e/8oko7d3wJWzQZsbP4PpjafI6WktTwPR76SuHixWdTL9DSTXZZLA
	eXEM9CCzUI5PZuBmLZf98AIp/G3c6DOOUSWqaclgx3NFkR2LwKaIEghFXpJ89W1lr922VgAsXydGc
	mHw7vBIY4qcR96mHQ6i9JlvsyTsEHrmwqpPuXZusEEc/B7/CdA2p0v/MnXbM7YEWPnb00Jmnu6dxY
	BFwuna4NS5G0IfBaDQzCAlIuFnHljcqVsIvmud9olbNz0ss3AhYr75IIqr/ipGvENb/4Z6bUFW+S7
	U+6rus3A==;
Received: from ip6-localhost ([::1]:57380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxkB3-005AKH-0p; Fri, 19 Apr 2024 09:05:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43228) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxkAx-005AK9-U5
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 09:04:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ee0642f718so2100069b3a.0
 for <samba-technical@lists.samba.org>; Fri, 19 Apr 2024 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713517492; x=1714122292; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qycMCu7lqisN4GytvSApI336sWKWrMnVv82r+544234=;
 b=Z/5UmKBObS/SXwqTYanJpMXAOkK5mNBs5c8HEDsEWpF9sHy1/Iv6AciOhpDNO67xUX
 b1ca7bBEjPouEZdHrv06Bez84PzUHfInzRuQ2mwVwQFjSOX4aSnmkTmgNH+dlqNA0Z4z
 lFeYIaSjf/U6x1mGNylClDuK6zH7oJSodiR+yKEBwvreqZV5/TSenvMsK2oiDKqHHEX/
 m4z+Y6Wi04yCzlB4Ef7o/FktDD8EB6Z0S7elbO92VOifY3b9E2MOqoIUB12Wl80nBEVs
 1KKn7E7eRKvnFHbJKey8bb0N9iPunWCUV58DORmxAb9Or8GBfm1+3b6mkIiVrFcx02TY
 sXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713517492; x=1714122292;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qycMCu7lqisN4GytvSApI336sWKWrMnVv82r+544234=;
 b=AT+4QSTAfD/Cku80nR6AbWVpXQ3R7LpWqnhXYoj8TIk9v/3w3UvJmeVW5IZrWPErdP
 bf7gRuschkPatmX3MDVxnn2yTp6y6nbQ2j1WT6AU7MBiF7o2dK4ANBhD72h/i56nJY3J
 /GgGZuPdo7DUqhTxZ5k+h8ZrEGnq65Uh9dUtE25PI2T2zQ9G1rHE+LQUYSWDmsP995Et
 zjNBxPFdCND4/Uvd7cqFSMRBXD/2IORTJkgT27474qOn737FT7zRAak8/bC3dc+Hwxgd
 AT8LS8nyXPjM1ksw01JeV/KzNPdoX2P3LNrhOvEIpNomLXg7/UCobn08+MofQJOrv+xV
 4GRw==
X-Gm-Message-State: AOJu0YwMx0uVNVIX7B6GtaDryEjhThGNyOOZJHbAKjfFgDhbBS5UmolZ
 GUKnzPJKh5FrY2lLoqaxQW5kNY0P1/wBmKX6WQ8Ikw+lxWDmKPb1T2VxEWbZM2iKB1xrcvBZn8x
 NJY7yGDybIS1vrMILIIge9ufyVG7lmk3Y
X-Google-Smtp-Source: AGHT+IGx+2F2u3Dt18KOIoh2e6JDEEXPpDgUyEr4Yv20d/6TBQFQicPr3Kp+1bAQmaVX/+lyfkRD+Mi8+mHjfcSG4G8=
X-Received: by 2002:a17:90b:f12:b0:2ab:8324:1b47 with SMTP id
 br18-20020a17090b0f1200b002ab83241b47mr2386174pjb.15.1713517491903; Fri, 19
 Apr 2024 02:04:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 19 Apr 2024 11:04:40 +0200
Message-ID: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
Subject: Doubts about Samba's unicode translation tables
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

I'm currently trying to integrate Samba with CephFS, and one of the
important things to improve is to access CephFS files in an insensitive way
without needing to scan the entire directory from smbd.

During this work I've found that Samba does the case insensitive comparison
using a couple of UTF16 translation tables (one that converts to uppercase
and another that converts to lowercase).

Looking at how NTFS does the same thing I've found that it also uses a
UTF16 table stored in the $UpCase special NTFS file located in the root of
the volume.

The first question is why Samba uses two tables while Windows only requires
one ?
For what purpose is the lowercase translation table in Samba used ?
Is the Samba's case-insensitive comparison method actually equal to Windows
?

I've also extracted the $UpCase file from a Windows 11 machine and I've
found that the Samba's uppercase table is very similar but not identical
(there are 339 different values). Is this expected ?

I'm new to Samba, so I will be very grateful for any insights you might
give me about how the unicode tables work in Samba and any other important
details related to the case-insensitive accesses.

Best regards,

Xavi
