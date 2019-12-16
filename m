Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5B1209AD
	for <lists+samba-technical@lfdr.de>; Mon, 16 Dec 2019 16:29:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=sMYVUMkI0FLZAeCC1DaL0CEIgJASG+c0UYO8HZ/NVxg=; b=m5SQsjCu0/SQFLJ5ZQhGxge0eF
	o7x/bljY05+sUQRVKJuomoRAG41nY+MhPjvSEhWeo1NtViVikzbfpmqUH5A56NBszXgP/XWydI+Dd
	qT4Uhl4tIrcsHoIAOdvDTBlwIe9Yhp3evwUjbN1Bs7Zlm/S65cU53klVnnNJrdhxBZaitd3cKJrzA
	SdcIvDJnRozncPi5KNbmyYfooTwmTUImNoAkFPG1HkBh2aKXHye0mFTbAlxFaXA/zyM6WKXHqkITA
	wUGhyS1ppiRxoEkFmUjpguQTsDH1cqKPWawAA84ciFTHM1JMPIcB2Z9KAoP6Nfw3ADBeOzzT/kAhC
	XCQ9TkIg==;
Received: from localhost ([::1]:23434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1igsJC-007QCZ-27; Mon, 16 Dec 2019 15:29:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48078) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igsJ4-007QCS-1A
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 15:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=sMYVUMkI0FLZAeCC1DaL0CEIgJASG+c0UYO8HZ/NVxg=; b=mZDjUb7w3JIt47uD2IXWHfi/FB
 ahLPq28dV3d4Ix6t0Q8hVwfvHY+7J+uKy8HQBG7gsYZh4ooZlKIamxAYrk6AN+scO6hiijmhZQcFI
 bor7ic4Y4Z1zUWTosCqp8/djGSCyFBGWBfjqf4DyFC8Yn/dpEOO2bdfJTtr4/8GyVi4u18muaGP+q
 3ankI3ctEN8Slq1kKEzvXmw1TVytECEaC7IyVZrEzD+EVYWB+9gfSAy3jfCqlEXkHC0zv4NM5XYov
 iCGAl0rJVjBPCR2pvudFOPJ+ogYbfOnCpduBRHYh46G7RPT8F0Fqwf5JmF3qTDdwa3AW+Blz+mtCV
 jqGJU4W2Ng2iYD8KImLBw/IJVCvDMDJj8dt+DA9pQhTVPje29r7/jB6jTQDOMDOsW5kx/B/xS76vJ
 AOdJytbbEgqWhBsJMMI3H7zliLDmhmWkGbr3lSA+PKLjoNs/Bla1+HZbfGHaMnqk1ShJrmA8/SfO+
 1CvRoj1zezaenkU3XwMijrgP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igsJ3-0007PW-LP
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 15:29:09 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] Samba 4.11.5
Organization: Samba Team
Message-ID: <8b58f382-7c98-c022-a851-ef1013ec7efa@samba.org>
Date: Mon, 16 Dec 2019 16:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
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

Samba 4.11.5 is scheduled for Tuesday, January 28 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

