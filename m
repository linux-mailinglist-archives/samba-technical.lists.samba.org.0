Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B8138E2A
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jan 2020 10:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=q2y+Ekh1KQB1mCJt1ymdeSEMPEWnjafhqutKhInBRe0=; b=EHIxnOMT6RWc2Mw1QV8cFFTTr2
	DjlnGo+/0zrosTL1HixPGEO7DQfeA1m1cKTIPvsFZkXaQymdnDxkY9KMbl2OoTIZCpYz0N0VDweac
	/ivTm9yDwsVpGwNq5R3CpHFul345sCnprauMBhQt5gSrivdu91Svu1K6nnfthBliaOmUmYtJZ68Js
	iIgu+wieM/+uzavgRS0CMM4ngx7pCdc6yMKXgL6C/es3alXX+Dvv4a1xjzf1KezoqT3qQJzU5h39J
	vhXkjvrD6iDNVWk7I8oJmURaHdpoOjFm+qtr6Ou4f2McdRTtoeJVC8hkO9HrnVgvh6amRSt/pxoD0
	78vuT2bw==;
Received: from localhost ([::1]:57466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iqwL5-003Av7-QG; Mon, 13 Jan 2020 09:48:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iqwL0-003Aur-14; Mon, 13 Jan 2020 09:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=q2y+Ekh1KQB1mCJt1ymdeSEMPEWnjafhqutKhInBRe0=; b=Ao83EoFmOOMfvcKbw5T5ZLJ3ZF
 cPX5IalYkjL0EQI8o2UA5eNT11uKlUIaXg+VVhQKu51TOsEQynEFCB+V1L8WCtV75EZbBv18tJSW4
 I3Uqpq21BRRc866c92WJZ9GgWTMSqCmupFpbHMg7EC2hxZcXRAWYqrGqs0vBK+7wRXaXpyORsTb0t
 N2oWVkh4vb9CPkBFiwCvS7tVWplmMzUQ4KdfCSRMPW6GXpOHfR4K2bbq/e15MVmFXApwCythBCVQ5
 XJdy15dBwwjNpAsb5FQthzaSxO0igwZLKLoFoSuQBS9HAVX1zwpEFR1fmMC5JybOwvSPhA7D3g6cJ
 Hi20UD8y4XkdKsXlLf39W1iUrwZz9Y+SgLux8Uf05J2CaBfJHEGcvUDd3iq4eswplWKBnCvoQrQwt
 xeVextQle8wgRGMIFYFHNNfh19Q9pU0enoxjCozNAi4XegbkGEsbBpQfjfZnK8scQFk0cmHeK0hyN
 +Th+xMvxwjIn1zcCcX1ymX+z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iqwKz-0005m6-Hv; Mon, 13 Jan 2020 09:48:45 +0000
Subject: Re: Heads-up: Security Releases ahead (January 14th)!
To: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>, 
 samba-announce@lists.samba.org
References: <bea68fc1-5478-2c3f-f4eb-58b42fa87015@samba.org>
Organization: Samba Team
Message-ID: <9b8d6045-24d8-2c24-86df-abecf168e703@samba.org>
Date: Mon, 13 Jan 2020 10:48:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bea68fc1-5478-2c3f-f4eb-58b42fa87015@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 07.01.20 um 12:40 schrieb Karolin Seeger via samba-announce:
> this is a heads-up that there will be Samba security updates on
> Tuesday, January 14th 2020. Please make sure that your Samba
> servers will be updated soon after the release!
> 
> Impacted components:
> 
> o AD DC (CVSS 6.5, medium)

I am sorry to announce that this release needs to be delayed.
The new release date will be published as soon as possible.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

