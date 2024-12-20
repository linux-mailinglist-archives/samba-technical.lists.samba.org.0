Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B509F91EC
	for <lists+samba-technical@lfdr.de>; Fri, 20 Dec 2024 13:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=TTAaanDKthAUP2gEglWMEbGuXQfLW3sd6Dvlz+Yk5Mc=; b=DpVvmFGXqA12We3jTjnjql2Weh
	kY6tVVqmQrKi+W6ZB3WMf3cpF/3wrKHBGOjFZn5MDBXX9EJ7J2pvIugdYUNX8+8A3YFiXT9VaMY/T
	Wd4FyWS2XhEYFf6OTDwRrP7INjJlP6bvcbb2sn+mRDI1257GLjfYkRAEYJsHlCSX61BZOG9yw6BQ2
	OTQCjMC0ub3qpI2eUtDMoMQYrYMwx6jK60DOf7dY6eAxA/AJjbH2/gU/ld4Cy+A6CM25yYyL6TdAE
	8Hj7dLrFPDnVZvzrZ3vGAl8wpVK4bSoR8ubAi5jaQq31liQJTwl69o40brzoTKM2FJ1TVza99Fyub
	jKB99Obg==;
Received: from ip6-localhost ([::1]:61604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tObn4-004eVa-PB; Fri, 20 Dec 2024 12:07:34 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:49329) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tObms-004eUH-VM
 for samba-technical@lists.samba.org; Fri, 20 Dec 2024 12:07:31 +0000
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-46677ef6910so18108961cf.2
 for <samba-technical@lists.samba.org>; Fri, 20 Dec 2024 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734696440; x=1735301240; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ln7MgD1YhcwgwOkCCAqsyoRh0MgXDZwmYisDDcV0YQE=;
 b=bnm/A2n/z3DUctq8QJyzsBDi/jh8FgfwmjTbIh0+0uOtbUBeTs5MhkOz45BCGRyb56
 Peff2kBF5XPL95sUnG37+8awMsdlDHql3uZQW4jGSaTVn3usslodTS78+OT77HzyvAaD
 gOhiraUhommiljG34EoV6nftFWiORjTKXBiA6RiWR2J2o91gbJUJoF/tFrsnLII7ishm
 +EQlQht1Jt3ADz01YClQcUnUBL5cn7geQ9vnTOjtfSnI9eXsziKxXEYdrVHZzk07F3S8
 IhIN1ZA7+EzqAo/0pV5UWPaiio7kHr0+J3WQT7vr01lipaFOczXUrQPq2LXe1d+QXv1t
 L0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734696440; x=1735301240;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ln7MgD1YhcwgwOkCCAqsyoRh0MgXDZwmYisDDcV0YQE=;
 b=RI+xOILjb4Wmveqi/43XuA9mR+HYH5YZgo4dk5D2R0po69i3/rzNr9SvnzWnoYySjP
 /lGhcD0wY9cyqEQxXPrQsn3DxHq+/Sgp6JcCKPwLX21evPjDelmTI7HratoZFQnFSna7
 bJgkZSOgoW3M3TEiZF8FrrxWCqomqZw1eiOcAlWJM+1+J5/cUibDR2ep8APAvqPrecMD
 Ow8TiDPHAb9t4aYN4DEQ0KmB4AdA726UJGOjbAQWvxoCW/qpB6MX2qj+coGxa3LWABbQ
 KLwnJAuuWKvBF/QvBmvYpTdynzo2VOgXuGVcvK7aTU58RMhSUBWJuNo7FhgKmjP9oJix
 4YDg==
X-Gm-Message-State: AOJu0Yxes0ffFMeaZjuz1e858abDMH8zN8SkMah9c0g+SPPCVh2kKkNm
 1/0YKQO+9NfKqJ4gv0eKUl44Cx2k11E3JO/LhV6GtAmYJNe4WGJdObbTC4zH78wuzRHzSup3SG8
 HanrSfb4lHD79MhSggRI8O97QQVbNsRjj
X-Gm-Gg: ASbGncsKKzc9m9eNh0TpjOT2uqvru7DBiSaHduNE8esmk/N5vJS31nQOjL8aYaG/PLj
 C+bEaUGByTh4XpPgqb0wZ9kqyVpM5obyolrU4Ui4vjgPPDx4BYPrT+y+yRnPJ1PMM59TW1cA=
X-Google-Smtp-Source: AGHT+IGmoukvB490RllB/FeT/VqJMpnpR1Jf+0ivmg6L1nZpkFHP9ej+xB2E90i5nlA7yRBIy7i2JhfFB9j2WGsqXgA=
X-Received: by 2002:a05:622a:64a:b0:46a:65c:b589 with SMTP id
 d75a77b69052e-46a4a8c5beamr40063321cf.6.1734696440521; Fri, 20 Dec 2024
 04:07:20 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 17:37:07 +0530
Message-ID: <CAHbM3qjtAkRbn4CuGyYgKWKECkpeatjYKBYY2Zw0QYB4R_MULQ@mail.gmail.com>
Subject: Negotiate not done when session setup using Kerberos fails with
 CONNECTION_RESET in winbindd
To: samba-technical <samba-technical@lists.samba.org>
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

In one of our setups, there was a considerable amount of network latency.
In one case, after negotiation is done by winbindd to the DC in the
function cm_prepare_connection(), by the time the kerberos ticket was
obtained, DC reset the connection. During fallback to NTLMSSP, as the
negotiation was not done again, session setup failed with
NT_STATUS_CONNECTION_DISCONNECTED. Should we not redo the negotiation in
case when the reset happens while establishing session setup using kerberos?

Thanks in advance,
Shilpa
