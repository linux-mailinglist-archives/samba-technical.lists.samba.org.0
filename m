Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB0620D3B
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 11:26:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jCsIiugayGUH9DBnKcl6CTQdsea1zxanwOHQ02pnMlM=; b=5Ytrsa8xVKg8PXBJ94Cyha8Crk
	stU1GpHV7WoOZ7VCuE2UhTcgMczND9mdrNo5daECC7vTlJLNiUIuzFuTMrDTQWDCgFcOuniWW7x2q
	wP019oSACxeHumkKzTSgLuZoYSXaY4THszwvzgWpic3ffagLAaj2oxczG6leOOGrq3DKsxIcOBbzE
	6DtNlY66wtbWwnZ2Rnd6YDYUzoz/LEOTBUuxesCYBTQTMF3uaXkPIEC+kWriTpHegZqGS9I7Pu8rE
	IcII4MtfFIQvPJaZtuSiAEiWoKkim6g+G2puOU8IwiQa380LJQRsajThDWRnoFutuDB/0DyAE50EA
	KAsiLk+w==;
Received: from ip6-localhost ([::1]:48568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osLnd-00BVbq-Cr; Tue, 08 Nov 2022 10:25:45 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:59341) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osLnX-00BVbh-7c
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 10:25:41 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 519B0400A8
 for <samba-technical@lists.samba.org>; Tue,  8 Nov 2022 13:25:36 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7200F30C
 for <samba-technical@lists.samba.org>; Tue,  8 Nov 2022 13:25:41 +0300 (MSK)
Message-ID: <5a3d3b11-0858-e85f-e381-943263a92202@msgid.tls.msk.ru>
Date: Tue, 8 Nov 2022 13:25:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: samba does not work with liburing 2.3
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

FWIW, samba built against the relatively new liburing-2.3 does not
work right, io_uring-enabled samba just times out in various i/o
operations (eg from smbclient) when liburing used at compile time
was 2.3. It works fine with liburing 2.2.

That's just a heads-up/JFYI for now.

Thanks,

/mjt

