Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBCD68E622
	for <lists+samba-technical@lfdr.de>; Wed,  8 Feb 2023 03:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=69maQLSG2Ofy+4HjwUWdDOcU+jdLD1AS/+UalepphVk=; b=Y9ROnSrP1CDu5jxSYq/frIdkkY
	srmsX3r0+tIXBP8/VYVjDiOCjbRvM+o4/YWWhc8IMZhK2/q9dP1tZmmPJCY3R0WBad6fNFhjWTTZX
	QHbhXr9y5P7h8+p9TkA258GfVFYcxcWaZ8RUL4g3+GJtG+jFMTw5sWxIK71acpXgz7oFmVPdRGk0L
	n7cVzAu8/6uHh08iUaF8s+onzeSKxQGQlqlLhe0canRCVetslLokklJ+kHCMbOYSbnT3u4322Xf0e
	GWGY0zHyJDoSZfrc6FQMqjfr3MMY8WLcfvF52uRDQ8Wlfi/Gls6XUpfH4frskAt2snFCYndzXEflZ
	g+xqoNDQ==;
Received: from ip6-localhost ([::1]:56162 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pPaN6-009WNs-6F; Wed, 08 Feb 2023 02:39:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45546) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pPaN1-009WNj-3G
 for samba-technical@lists.samba.org; Wed, 08 Feb 2023 02:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=CZLL1QdhQnGwT97B/4CZ0/55svxjHsObnUWtftPrpWk=; b=osm5pDupu9RO/FDTK2u+zMm5lO
 DRLTIMTG8T7OWH/8EXATG+B3jjs2hk6tQCpUOBimWw0URqs78ffNo1XgsuJJc1TMA/qs9BTO6YDt7
 UC7XZEM98Q+VzAjunAPnu2ysnQMmlwO8a32TrqA/UdijTwhtY/onudLSOexsTIEzhXW7RZxiH/mQv
 g1e2wJMI9lvss4O1czBrUfKDVLvOhbGPLE5l2F3w5pEfB4LwHerJrCjNz9+ssTvfsCZcf+D820F9X
 Hc6vxqd4+BlYiOmEjIQhKcArvNYcWKPKiGj2/ohy2vjL/81gFV2/ibkJA0YBsJWOFlprXPvZm0t+4
 h9dhKEShhXNIQZ4CMOvxzCJXP/Q2eGvSEHFxUhHVugCq8O7iJkCJuh3P4AuidTpRyx6nDJstmQX5m
 Vsvbyqprd5m9GRjMKvVaXSGMCO2SXFkvywMr+KK6fzaC0zkQ22cY4yK14SR8LlAV/IXzUH0gCSy3Z
 /PGSooX7tSICBvnZuA7lTOdN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pPaMy-00CU48-Uc; Wed, 08 Feb 2023 02:39:37 +0000
Message-ID: <cce5d58d9dc31c7080a5ee775785c83e79f47838.camel@samba.org>
Subject: Re: How to handle @LIB_RPATH@ macro in
 a/source3/libsmb/smbclient.pc.in ?
To: =?UTF-8?Q?Ji=C5=99=C3=AD_=C5=A0a=C5=A1ek?= - Solaris Prague
 <jiri.sasek@oracle.com>, samba-technical <samba-technical@lists.samba.org>
Date: Wed, 08 Feb 2023 15:39:33 +1300
In-Reply-To: <313c49ae-fde5-bea8-e150-676176a6f8c9@oracle.com>
References: <313c49ae-fde5-bea8-e150-676176a6f8c9@oracle.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2023-01-31 at 13:21 +0100, Jiří Šašek - Solaris Prague via
samba-technical wrote:
> Hello Samba hackers,I understand it is under the level of problems
> discussed here but I would like to know how to deliver -R${libdir}
> into Libs: in .pc files. I think the LIB_RPATH macro is the correct
> way but I can not find the option to unpack this macro.Thanks,Jiri

Were you able to work this out or do you still need some help with
this?
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



