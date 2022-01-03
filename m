Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D4048301B
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jan 2022 11:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Uhht0SCnCDeUWz2C0m23G9FFU8CIvgzlECgxjFuHOnc=; b=GnIqaIX63tmjzEViFksUVmBIG0
	DelnBexLTw/FuS6KhsDWISz1kktOoIuw9Jg/DKAJwxJkEaRk7Y1gKHtLL7sNjHLXhFtiKNt+Cwxko
	wS48JblKJAERfLIQzpESWTJWzkIEOSkkDxE/AH3wKqi8WrCiP0rYT7ipZkF+owWWHM1/w9VasTcT2
	FCB4qUsrJeegHRQ4Rfh3ucBygrqHizGDy1CpwSC8rpYyqHdzO023FM8kzl4WdFlst4cxXKrN/dpez
	DRsxLN9HwIYJJtBCflNkxEiJvE4Pxlylle059sek5ndlvFCIhg/GFqmt5wcv8kyTwbpH9JLlC+7yc
	HA04g2tA==;
Received: from ip6-localhost ([::1]:28094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n4KzI-004TqZ-Qz; Mon, 03 Jan 2022 10:54:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n4KzD-004TqG-Jd; Mon, 03 Jan 2022 10:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=Uhht0SCnCDeUWz2C0m23G9FFU8CIvgzlECgxjFuHOnc=; b=Gq+JXsJQxUMZGvzsQxcybEOcjJ
 mUP9EP+x/6qxPuvH/CyQVgERyssHRIKJYjdEmOJ0G8xgjPmkpQgWILyvm0sv/FcjBy4l//3goj1mm
 2HqaIEb3yHl+1u48hTt/ZFGnGYm/+wFWgfmRrub+Rgfkgr7WyGtYmKhxbyjo7Nx7O9HAaUJAQ+mi3
 1M2cwI0v+Yca3oasi0nFNsmfMvtXBFL0Yghf0qxh3i79mRn2dbsMWXfSUFmnZflNNZST/mLnR/vuq
 lC76MYpa4wT903jrw0rL0W7z2uGiuij4UL2EMvopHvsmMBX65i1xNHGyJkavgyDg3TreY8coB7k4J
 L4l6U6mewAQUeYyEnCJp9N70b4RQMJKJR+9IkhG0rQRGa82yG9l5LleXe6Zr8QenIFWDMjSw62YBk
 EIvyvoDqZ6lz0RWbEOIJZFZAHPzmjIU2vWvR5byqHFZUf9ZnIg1P8CWeG1vMkihJL35hcOCc3Wiow
 UAfEQ1AECoGypQPN6cPy8gPg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n4KzD-005XSB-21; Mon, 03 Jan 2022 10:54:43 +0000
Subject: Heads-up: Upcoming Samba security release for 4.13
To: samba-announce@lists.samba.org
Message-ID: <84421002-51c2-8336-ffb0-d80a54a66640@samba.org>
Date: Mon, 3 Jan 2022 11:54:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be a Samba security update for 4.13 
on Monday, January 10 2022. Please make sure that your Samba servers 
will be updated soon after the release!

Impacted components:
  - file server (CVSS 2.6, Low)

Cheers,
Jule Anger

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


