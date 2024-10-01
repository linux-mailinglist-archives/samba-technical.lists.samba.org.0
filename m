Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEDF98BEE0
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2024 16:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=nAgr/u3BFqgK0ukKgSMKjQbZnIyvwXSurFiIbfivZvo=; b=z+m1047xZivB29qehBf/d5RL/r
	3Tr4ljLAVjzSQA3XEZ8dmQo810J5EjTW0LnuLxJNOG9AZ4p9wr+clht4pKi0icfqGpfrgBG/wl4ri
	EDwuQC05fUBq7OCON2qDf/cC9+woiEJeL+EUufbDll9tssAQWoTTauJTy678d5WLuGiCeCD45Krg/
	Xg3qWnYqRnKuoTOMWiRwuvRqReoG7SaLad/0BjcBJSBlkFC7YOIlmfHJUFhGKyFA4Rfq9EBUI7A/p
	w9Z/7HC+z7wWhK8M4lJmGlIRoeHb1N9ePEEixuv/gVEoZ6VCqoIwBdx8EREr0KwghT4rCWdiNfAGB
	MJUOub7w==;
Received: from ip6-localhost ([::1]:56720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svdTL-002myj-5b; Tue, 01 Oct 2024 14:03:27 +0000
Received: from ipv6.s152.cyber-folks.pl ([2a02:1778::113:260]:41283) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svdTG-002myc-Vk
 for samba-technical@lists.samba.org; Tue, 01 Oct 2024 14:03:24 +0000
Received: from [89.191.129.194] (helo=[192.168.10.248])
 by s152.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98) (envelope-from <wsm.bydgoszcz@gmail.com>)
 id 1svczo-0000000BGa6-41Td for samba-technical@lists.samba.org;
 Tue, 01 Oct 2024 15:32:56 +0200
Message-ID: <a9db27f5-2e7c-4a68-b742-8601b325f835@gmail.com>
Date: Tue, 1 Oct 2024 15:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: pl
To: samba-technical@lists.samba.org
Subject: GPO permissions - The security id structure is invalid
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: informatyk@szpital.bydgoszcz.pl
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
From: "wsm.bydgoszcz--- via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "wsm.bydgoszcz@gmail.com" <wsm.bydgoszcz@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello

We have Samba Version 4.20.4-Debian-4.20.4+dfsg-1~bpo12+1 installed on Debian 12

When I'am trying to Edit permissions of GPO (from RSAT), adding user or group works but when I check "Apply group policy" permission, program is closing and when I'am trying to open Group Policy Management once again I'am getting error:
"The security id structure is invalid"
The "Security filtering" and "Delegation Tab" of this GPO are clear and I can't add there anything.

Except that, GP are working.

I have checked my configuration and everything seems to be OK.

I don't know how to fix it

Please help

Thank You :)


