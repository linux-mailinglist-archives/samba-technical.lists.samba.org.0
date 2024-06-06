Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCD8FE18D
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jun 2024 10:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MS3XHj9zNmVBgIpmdvY1il3QTnxhM25B559CF0HnaP0=; b=UuGkXFPQAZOuABVdzJ43/p6SWs
	AgPzw8KUhcuup5hno8SblDWEO12PVwYe3PDWsa4EObrFUfZG0yRMZ8bE5Or8D7Dc4Jbo1qKz7nkq+
	T4oxlJRqdJqyj5k7+2HZAvKyRq28F8n3iht0U2eCP4JFZ8MOzJIZjRRVD6nrw8g8prWbZVE8Ym1S3
	pfSUnIKEeNQ6g5iA6mQ30ce5SIoO8frzLwHczLrmhKHsMcflGLFE86b1DpJ1eM67SwRHea+2iHIGU
	GucyxFbaJQHWt2sPjcKyxrvVJT/+uiHTFk33ux26vdAH12Hv9c3jqoXb/kHOohR/rew5eivlK8oCK
	03IurekQ==;
Received: from ip6-localhost ([::1]:60980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sF8q8-00Cq32-4I; Thu, 06 Jun 2024 08:51:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14574) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sF8q1-00Cq2q-QC
 for samba-technical@lists.samba.org; Thu, 06 Jun 2024 08:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MS3XHj9zNmVBgIpmdvY1il3QTnxhM25B559CF0HnaP0=; b=aZ/uf3YSGUOUg698X7XrOsgw1Q
 ihvMD44MuQk8TpjXYyq856Ll04UleXz50aDj+Pf6y1VuPLkLhYtSY8KDdM75x/idde9hY0tzVuXEQ
 HNu61ZGf9lV6LeF8Am4iin6yu5W6GihPoWirOcHqR4Wvlfzfh+7ysEmwoJsHeYQ8d/vBdDHU4HR0F
 doE5WFL/cyehkUfwXShvk6HaIzUS57guzMgKiWBwtSutFx+F1Q1mJ3uQgPX/eDUtPRBro2zS8Pl/B
 WzsBVuolr0aOmL+xQKqvg464Dk692RrZjqaF9q/0emHQlBbvM5mXCufSHu5FVUgHsBlZyjWTaXpdu
 c8+kWZj7LeOQ7ADFcFHGiF47QOQiCea0+4he18q9mZpGbDwg2qTZDgx2VzAxTpMFfE0zgOlRiDKhb
 FUpe7WIGBVtxkEWXbdpJSPkvqgRbxVFKM/poYfr3dKWk3fCUiflOIq1YrlEtXcP96+/+sXVWO2uV2
 CfeaHWOV0kF9ntzZwcmmZVSz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sF8q0-00FI9W-1t; Thu, 06 Jun 2024 08:51:12 +0000
Message-ID: <b857325a-d937-44d5-b9f0-7b366a4b2fb9@samba.org>
Date: Thu, 6 Jun 2024 10:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: missing krb5 dependencies after recent changes
 in nightly bits
To: Vita Batrla <vitezslav.batrla@oracle.com>
References: <Zl4Dh9XZ2XsQWROD@ultra> <ZmCG254bAl-mvxIt@ultra>
 <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org> <ZmC7V3JsFXo1tYV-@ultra>
 <ZmDA14dT72iP-Hjg@ultra>
Content-Language: en-US, de-DE
In-Reply-To: <ZmDA14dT72iP-Hjg@ultra>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Vita,

> Still fails. With your patch it's better, LP_RESOLVE builds,
> but DNS_UTIL and LIBNMB do not build.

Thanks for testing!

> The 'krb5.h' seems to be included through libads.
> Maybe libads needs to define its dependency on 'krb5'?

Can you try https://gitlab.com/samba-team/samba/-/merge_requests/3662

Thanks!
metze


