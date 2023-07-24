Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D775F64C
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jul 2023 14:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1Bs1XUioKkW+qHLGgpcf2tQ6cvCxg/dCPzq417Q3vWo=; b=X3HAXIIpCOhVsxYQyvRdU6ay4W
	bKUUY/N6HdXbLjSh9pJcqBKYuo/wq8cGs19H8rIiYL8S9yLH+OqrM3G7Tj5rqrDaIzzjNUYsCIBL8
	fA73fgRbTkCkx+xeFxZXPGPFb3NErTHbv/AISjj0r5Z4BDm4AjgN+l0B0BtGgV2iEIAvEkAATPnFp
	2btHypHmrB7rAtnouCMhONLy7w/JV1x8umwM8hAte29hLui+39pcPl66F7nfLV8PksxVhDHwVHb7I
	fU/fno11H5/BQjoPZPUFYjYpLyROXajOjlxqmIhK34hKr2k1dhCQkxJr+vXKcmwie0gg8hfP8yDKR
	wJk2pHrw==;
Received: from ip6-localhost ([::1]:27662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qNufW-004tC1-Mm; Mon, 24 Jul 2023 12:28:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qNufQ-004tBs-Oc
 for samba-technical@lists.samba.org; Mon, 24 Jul 2023 12:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=1Bs1XUioKkW+qHLGgpcf2tQ6cvCxg/dCPzq417Q3vWo=; b=CLAa95Lk+Lmezfz2uKRq5L3gvl
 zK92ukapnEvmVUCSGhrXAoePnKPzku9czET4zYmrF/JAUYkCSBg0N26QS97ixuf4dFGthCw1MxX95
 MREmsHnL+IwNfydv42Q1kWWUUAk43mn9OHni9xHlyp+X2iLzbouDAmSuD2IKZEwiGnJt2n5RsNBWn
 BIFdunA5yoonLtbH2LcPuThKkmEWjkNYpt6HN9zHAp+oTjy3Xc28qmsfm08/31F2lzbRAxi2wHJvS
 ehDPZAFxU0R7RZyLXfG1NKW3lGZq33FWMJLmuG6NdfxQuCAz9VCnA+Lar4CSo1Polv5yzdKXxB1Lv
 SSS7ottcoJVkzOfBp4eQEBUqW+iuN2Ag0s6cSCoDxh34djy/HSxYFihh+R57WJ2FQXk1joErQyKsB
 bVv9Xp9uYAYIa30y5Lr0y3ippppoVE2W+OVCEgSsSNdfGvUcdbmxtUgNW2LajtBOglBHqDKMJy4uj
 F1Wq3tZowCE2ApSX5mB9TTO2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qNufH-003oos-1m for samba-technical@lists.samba.org;
 Mon, 24 Jul 2023 12:27:52 +0000
Message-ID: <1430d5ec-f2fb-7021-0aa2-2a759a0dbefc@samba.org>
Date: Mon, 24 Jul 2023 14:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.0rc1
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.19.0rc1 is scheduled for Friday, July 28 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


