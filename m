Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3430970AEF
	for <lists+samba-technical@lfdr.de>; Mon,  9 Sep 2024 03:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FC8DA1RitRFO9s2XSqQLDWC+hDdqNRLOBg1YLV6pXX0=; b=Vp8B5TRpHOPMan98muMfDS/wmN
	Aw06HjDPrhrtFmYUdYq/Y7lsmyLuZUxwZmDN0a2ln/BMh3NDnmRwtnDSRI7h247ag0Cmht/nH1ga4
	AMQpcDXfm/lL5zI1BKUWNBxR4rr++rWIzIqnQeCVpw+xzfOzywxnzlBMlNLZxbLeqxY8/A9fXmXVI
	CCppmbIdrCnIRh4N4ySM42g6IqVgCIwJyhmRqEP15m+y57lxyLY0pBkGnRlNuo0skvPDazng01q/j
	DC+JYrtxxwZ632Zu3LbTWVD0hEzUz5BXxw6hsX3qUi300/ovs7a6da7XN41VTv6vckzf4zKP6uQyE
	cGd68owg==;
Received: from ip6-localhost ([::1]:32622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1snSws-0088AG-F6; Mon, 09 Sep 2024 01:12:10 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:61927) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1snSwn-0088A9-73
 for samba-technical@lists.samba.org; Mon, 09 Sep 2024 01:12:07 +0000
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so3399052e87.3
 for <samba-technical@lists.samba.org>; Sun, 08 Sep 2024 18:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725844323; x=1726449123; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FC8DA1RitRFO9s2XSqQLDWC+hDdqNRLOBg1YLV6pXX0=;
 b=BppZf10UIJP55c47t4dSpQOUSD4NR/PXlzpokt3ivN5DY6DLCmo6CPhyfW2b4pPhf+
 aptHHkDzw2rtItAYYGTV7uBkUZv1CLaEjJj6HGsOCM3mj/Z1et8d5moXc+ZV3OQMVNiK
 o6z0YlbvUC6QfTf2E0Za0Y3TpO2hR+4UmMWUVXmgled6qrVDG5Y8C5BQCzQte8SKtqGX
 SCYAV+/IsJ5NZrjR5c0itlVMI5MBbd3PmZgHp/dL8kiS7eV4ycOvIJ7/K3sbLpYqT2Tt
 xZqwT6U6pomqGgm3nTvhaeGx+SQLREl/2DBWGzGKvWYwTOoGJrrYFDP6va1QUp3KZ46t
 guGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725844323; x=1726449123;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FC8DA1RitRFO9s2XSqQLDWC+hDdqNRLOBg1YLV6pXX0=;
 b=IL7AuaxjYbRKNjFHqd0WNOno4bu1x4ig2YLILbjy9fWBx309aPTgCdGPs7RcN27bax
 9TL4TwD/WAJaN4h7zwQfsKs+r36G/2/eGJotV8Phb0VpqbuKpAFIlW9KYKOLryYwL5gZ
 9UHdjv3dj7D9/sL/kSzUTzCxYasLT9+oYTOjW/P4rtpnzC+59KGA4BgpUxv9ylQdA8n8
 VFC8KDAMcEX+w1kXRvqTsU/GzbxN6FGqRJPnDMHADec6uIPnRXoH3NR0w0gwcsXY6Ulc
 j6DnXLgRHfBSyxhYsPj9OmOKkwFNyce5k6XRzhc21XOEdv7htRZsJPVi96gpnPIElfUb
 oxFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4gqBQmrgsQRHgZ5qjwtz54vPtvDzwCPJP5gx8/+ig+7g7tqQSGPPmuOmuDCh5WUYIXIKM7AH7OMrRv8l3n1k=@lists.samba.org
X-Gm-Message-State: AOJu0YxBe3lslMvqIBG1u56o1aC1jBBLmrfZNXlzUVkq3fu6rDPnVfad
 QNZIEBOUct0CqSYLlyELVa4XE2VeRMcyzEVlqCH+ROu+d/SkM71BgSzaoVH3YCI8j/28EGigU0x
 Tqqzhl7unqlf7LpJryHb1ZkeQPoo=
X-Google-Smtp-Source: AGHT+IE06XlY3Aws/B4tNQpqklSEnl2D64bvLknSxCUR5e+FK74bGoMU+jMb2P3OyiEie2EPk1Y5QYA+3j4xUM3pT4g=
X-Received: by 2002:a05:6512:2313:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-536587a54a5mr4830421e87.7.1725844322625; Sun, 08 Sep 2024
 18:12:02 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 8 Sep 2024 20:11:51 -0500
Message-ID: <CAH2r5mvVZrgVTdmxXwVVYrNkCS-QXQkMhwCA9At+mboiBvE-5g@mail.gmail.com>
Subject: generic/236 test failure (failure to update ctime on hardlink) turned
 out not to be a client issue
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>, David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Was having problems reproducing the generic/236 ("Check ctime updated
or not if file linked") failure that we saw on the buildbot to Windows
(e.g. http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/6/builds/67/steps/91/logs/stdio)
but then found out that the issue was the clock was off on the test
server VM.  When I reset the time in the Windows server VM properly
the test now passes in our 'buildbot.'

The test (generic/236) still fails to Samba server but that is a
server bug (Samba server reads ctime from mtime so you don't see ctime
updated on hardlinks as expected), but at least this test works to
Windows server, ksmbd server etc, and have confirmed that it is not a
Linux client issue.

-- 
Thanks,

Steve

