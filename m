Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C199F230C46
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jul 2020 16:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=YxKDW+K4LtWJWNpluuVBLAtIqjA4TsoP0znM0+s5gIg=; b=N2frPCSIoyttuqcnCJdjr1PweV
	XJoQQi3BTJfCWRbb8hR48PsRB5KJsqg9Aup10Yk5ZJgUcXWJYUzGhBXY2Q/tldZwS7e81UwSAC8c1
	/eocg2iALGMmzVWSuZ86LUQcPnNNj0hUetP/hwMOykZmq65j0Ug1G58kSIMYdaBGIggnxh1lSGhME
	y+EDJpDItIkYc6IyqpKR0DE8PvRBFP9i8T33LrAID1kHwhZOVJ492w5npOnPJC9HAXJQna/zB5unk
	cdJDPXHGgLL1qEv86ZYGOa0+VulpNbMv6vLsl5KSHww0QsVeRR8Xl0DouFUnNWVydWcOJUr7Z8y/C
	pEZZpHXA==;
Received: from localhost ([::1]:60850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0QQ0-00A8uS-3U; Tue, 28 Jul 2020 14:17:24 +0000
Received: from mail.pardus.org.tr ([193.140.98.156]:47198) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k0QPt-00A8uL-Ua
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 14:17:20 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id D6CE61F78FD
 for <samba-technical@lists.samba.org>; Tue, 28 Jul 2020 17:17:14 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Mk2TPGwUWfYd for <samba-technical@lists.samba.org>;
 Tue, 28 Jul 2020 17:17:14 +0300 (+03)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.pardus.org.tr (Postfix) with ESMTP id 8A1801F78FE
 for <samba-technical@lists.samba.org>; Tue, 28 Jul 2020 17:17:14 +0300 (+03)
Received: from mail.pardus.org.tr ([127.0.0.1])
 by localhost (mail.pardus.org.tr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WDXtPQCDQRcE for <samba-technical@lists.samba.org>;
 Tue, 28 Jul 2020 17:17:14 +0300 (+03)
Received: from [161.9.194.136] (unknown [161.9.194.136])
 by mail.pardus.org.tr (Postfix) with ESMTPSA id 68DE41F78FD
 for <samba-technical@lists.samba.org>; Tue, 28 Jul 2020 17:17:14 +0300 (+03)
To: samba-technical@lists.samba.org
Subject: Samba 4.9.5 Windows 2012r2 AD Cross Forest Trust
Message-ID: <582d92af-1132-9684-30bc-255ded0b4724@pardus.org.tr>
Date: Tue, 28 Jul 2020 17:17:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
From: =?utf-8?q?Izzet_Ayd=C4=B1n_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Izzet_Ayd=c4=b1n?= <izzet.aydin@pardus.org.tr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone,

Due to the integration problem between Samba and Windows 2012r2, we've=20
changed our process to cross forest trust implementation.

I've managed to create a forest trust in Windows AD 2012 with samba, i=20
visualize the vice-versa with samba-tool

samba-tool domain trust list
Type[Forest]=C2=A0=C2=A0 Transitive[Yes] Direction[BOTH]=C2=A0=C2=A0=C2=A0=
=C2=A0 Name[CFT.LOCAL]

I've included a debian client to samba via sssd, the client lists all=20
users in samba and login without problem

The problem is, the client cannot access users in windows ad.

Where should i check to resolve this issue ? I couldn't find any viable=20
info about this case.

Every help is appreciated.




