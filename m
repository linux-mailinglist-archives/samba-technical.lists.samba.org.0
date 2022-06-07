Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6865753FCF6
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jun 2022 13:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=mE8kezWzrcnRs5nYERhXHgD422msa+xLOk2aZBQlTZ4=; b=yhKpYFSBkjDN1HkC0+bcCqzCZG
	Lje4WJfLiLEvaboZ0ytZ8uHUfesO96Wpm1wHppmQ5g8C+Kksbwv1vZYbVdHQ5kysuV/JCw5Uoqu6F
	Ka6ktvzivmfhi+upCOZRSpDEy+GIE5+2aG5hnQ4xT1xxroS1ZCYt7SC7/bwpiD0sHZsMWY6eIc4Gd
	bu1u3SMFRWQNJE3A/DkbNgMyUjUZSkVYlr3jS+DNBKbWAw9cLfRWd8e0HnL7H3QquPR9cVsIN8Jpn
	/TOF9vF7Pdiv3NtzK6RSRtNcNWsDyTf2YYYm654uhXKodMJ5SNKTxfsWiCPjqiN8f2XcJmN9ac1rz
	Hu3uC1Zw==;
Received: from ip6-localhost ([::1]:57396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nyX4W-007goB-Im; Tue, 07 Jun 2022 11:08:28 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:35997) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nyX4S-007go2-7u
 for samba-technical@lists.samba.org; Tue, 07 Jun 2022 11:08:26 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 992E440632;
 Tue,  7 Jun 2022 14:08:17 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id A79E913A;
 Tue,  7 Jun 2022 14:08:15 +0300 (MSK)
Message-ID: <c08aa333-c45e-40b7-7f5a-f11e0f3068d0@msgid.tls.msk.ru>
Date: Tue, 7 Jun 2022 14:08:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: move samba-specific libs from libwbclient0 to samba-libs
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>,
 Louis van Belle <louis@van-belle.nl>
References: <3861233f-bf09-7124-30db-b61a71a924d8@msgid.tls.msk.ru>
In-Reply-To: <3861233f-bf09-7124-30db-b61a71a924d8@msgid.tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

07.06.2022 00:47, Michael Tokarev via samba-technical wrote:
> I just comitted a change to move libsamba-utils.so out of libwbclient0
> into samba-libs, since libwbclient.so itself does not use this library
> anymore:
...

This email has been sent to a wrong list: samba-technical instead of
debian-samba. Please excuse me for the noise :)

/mjt

