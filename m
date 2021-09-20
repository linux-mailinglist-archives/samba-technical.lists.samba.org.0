Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AA3411254
	for <lists+samba-technical@lfdr.de>; Mon, 20 Sep 2021 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=QiZh60wd3L9gV0hI0d69nBVL4RJnXQ9AeLCOBb/8C34=; b=l43/AbzxhxP5KBcdEiKhy6L9VT
	nfDt6DJjSTaUBJlocoK6oQFU51CTKOR87TJZpDB6fV70QXvDm1OqU1duWLilCU+pwTrFaMmRmU7FL
	xNc7cIgsmUAgQQI4ZUSD+yRIEf80eoXH324CTUMIGnxPSEm6amI28bDMdIN73sT3qcZ7zWpwzJJdi
	7mf4ca3GTPAO97AMrMSbCaowH//+a2sAsWaGkxyh9LsuV0n115FxUFA/pg5/1cFQw76Z5yig/ULOE
	alq8HDPrcoPTsgH5j85w2CiAQkgJz+WWwx1HuKPsYrUBT/OZwnaF+tPRfbMVxTddxrcidQC8xn0LU
	ceXBMpGQ==;
Received: from ip6-localhost ([::1]:45418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mSFzn-00G0Wz-BY; Mon, 20 Sep 2021 09:53:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33218) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mSFzd-00G0Wq-Th
 for samba-technical@lists.samba.org; Mon, 20 Sep 2021 09:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=vTp5AP1Hht/t3vcvpajxcl3RQveqZz2D2Nvpngcx0Hg=; b=fz3GRcU41EYezq2Oqe4rf9pHWZ
 IF0LjQdX4zYPDCHxfeutiKDhBRbYesc4MC4yB1ACHC6sm3vlizEfzX/Kf8dj0JY+oTEP7HwTg3LMC
 xNdTYEx22jDLADIKmcevPRuWn6K2t2jkgZNHvEwS5nkg/DJIF0jfV0kOdyZMmicLBii9SOO2gJVax
 4xrBfLeS/Psc6bm/T9V6Yusqw1SLeqEzZwFS09H/RAVQ+N3BbOeTjuIjaudv7XEISB+le7v7rZlJw
 ynJg227mOEAnhoawQAPayLc4jO76MC1RqxprcZBNIpWzMQ1WlJq21OotC4t6irSYc5laI/xtUxLzV
 9UTdiC+CJUIYYYyaka2pRK4NOcSr0wIExFP+2gpGZaA1gtFROUHd/8sW2Am4izC9UN3MnG7nR0RHo
 EdIjxVvaoSux46oHEOGDgRgrXZWR/HtW0W6dbkAaCVTpaztNRhyD941V+kjZPkotj3vFP9nziMoQL
 um1y/+fNblONyyAQLpW5RXUw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mSFzd-006y4J-8h
 for samba-technical@lists.samba.org; Mon, 20 Sep 2021 09:53:45 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.1
Message-ID: <9387fd15-9f76-67ba-abaa-bd7f3960e6a9@samba.org>
Date: Mon, 20 Sep 2021 11:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with today's release of Samba 4.15.0,
- Samba 4.14 has been turned into the *maintenance mode* and
- Samba 4.13 into the *security fixes only mode* (there will be a last 
bugfix release on Wednesday).
- Samba 4.12 is end of life now.

Samba 4.15.1 is scheduled for Monday, November 01 2021.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15 
<https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14>
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de

