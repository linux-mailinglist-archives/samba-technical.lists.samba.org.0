Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622E7BE1F6
	for <lists+samba-technical@lfdr.de>; Mon,  9 Oct 2023 15:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=EIHllxYAwmMx58CTHDCuQDWS16s6GWv+D/tF7N9u3+4=; b=VXiFfch5lBQD26AIveiZH9B6TH
	MKzU1D8GPeI5dG/rx1rE8XHMSy07240pveW4LF112/WQTCYcKkcP8MtiniPkjUE6SDlcziR5Dn9Li
	kmbJ2qMln4LQ0LaNWu0riLxEH0+MtyVKys1ofO9klS1erVFilsOD4T/BP8yGz6nZ2pIob+3+ORmq7
	D9vN2wSOZblf2Bw52RB7p2jjol5oCEVRQNb0pL6b78G2vWBoAhD9Ox/hcJm6W5cADGJh5d/8IvXhW
	tZ0Cm+1LeBCLxgsaqGiMZCQHohkaSc2Rb/Wgua3aT9XcLJNg4siVpAAc3nLLtTMOIy3sZeuuoIGGF
	t+lABZBw==;
Received: from ip6-localhost ([::1]:40594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qpqlm-000fgH-St; Mon, 09 Oct 2023 13:58:02 +0000
Received: from mx.inno.tech ([185.228.49.205]:44629) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qpqlj-000fg7-1B
 for samba-technical@lists.samba.org; Mon, 09 Oct 2023 13:58:01 +0000
Received: from ksmg2.inno.local (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id ECB0A40029
 for <samba-technical@lists.samba.org>; Mon,  9 Oct 2023 16:40:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech ECB0A40029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1696858824; bh=EIHllxYAwmMx58CTHDCuQDWS16s6GWv+D/tF7N9u3+4=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
 b=IbplXoha8kVddyjja16OUjWQ1X3tVHh4/xalgDGKr+d8LGI+YbsvHm07X8nMMFmc4
 M8DgNIQWL5iB0SxNT1I4PJKD6ABpG06ehvHNbSHw07iqpV+rvKDqgTCmfl/9nk6cap
 aLZet5KpSzI+D0l/CESS8ScG+9PhUAFLGsSkegWxhunPOyXH1GC3SEy2UQPG7gCjrM
 F7zyISIxDlDLeDu/UWCVL6m00KSq+j6egpcxyXMRpkw6FbLCkIfBaApIR87oVHncUf
 UMwUC3m4O/qrHhVgUtr/6SuzVkG3p8J0P5SmuGh6s95fiXaQiky5eSEQolXySANdmh
 Ag2JrQz5aNVJQ==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Mon,  9 Oct 2023 16:40:24 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20231009_164024162_00021531
X-MS-Exchange-Organization-AuthAs: Partner
Received: from MAIL-DC1.inno.local (10.0.115.2) by MAIL-DC2.inno.local
 (10.12.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 9 Oct
 2023 16:40:23 +0300
Received: from MAIL-DC1.inno.local ([10.0.115.10]) by MAIL-DC1.inno.local
 ([10.0.115.10]) with mapi id 15.02.1118.037; Mon, 9 Oct 2023 16:40:23 +0300
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Plans on MSA/gMSA support
Thread-Topic: Plans on MSA/gMSA support
Thread-Index: Adn6tdsEXMzDDjZHT1yqFg0kgRKZJg==
Date: Mon, 9 Oct 2023 13:40:23 +0000
Message-ID: <b1a2c6f144b048cbb630469e8c4c0f7c@inno.tech>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.0.117]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSMG-Rule-ID: 5
X-KSMG-Message-Action: skipped
X-KSMG-AntiSpam-Status: not scanned, allowlist
X-KSMG-AntiPhishing: not scanned, allowlist
X-KSMG-LinksScanning: not scanned, allowlist
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 not scanned, allowlist
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
From: =?utf-8?b?0KfRg9C00L7QsiDQmNCz0L7RgNGMINCY0LPQvtGA0LXQstC40YcgdmlhIHNh?=
 =?utf-8?q?mba-technical?= <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?0KfRg9C00L7QsiDQmNCz0L7RgNGMINCY0LPQvtGA0LXQstC40Yc=?=
 <ICHudov@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgYWxsIQ0KDQpBcmUgdGhlcmUgYW55IHBsYW5zIG9uIGdNU0Egc3VwcG9ydCBpbiBTYW1iYT8g
SSB3aXNoIEkgY291bGQgaGVscCB3aXRoIGltcGxlbWVudGF0aW9uIG9yIHRlc3RpbmcuDQoNCi0t
DQpXaXRoIGJlc3QgcmVnYXJkcywgSWdvciBDaHVkb3YuDQoNCg==

