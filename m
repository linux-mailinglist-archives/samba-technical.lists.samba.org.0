Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23479ACB537
	for <lists+samba-technical@lfdr.de>; Mon,  2 Jun 2025 17:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mz5uR2jaK9I/x+9GZvo7AvYe3abg//9WbYk/8xiupV8=; b=qH9fT8SzhuvYLOsJpiCGAFjzXk
	NQVO0yjAirG/wHEEdlje486WLWWEigenvqEgJofQ3uoTHII5Pd+FAnHtmU1+vnIl+3t1oMKWQblWc
	szCdJyDmwr40FCxC/sePNcJMzJGT+v6wSmJcFCGlcZ2LjB1PdcCkILLkVp4TkeuM2cP4NFaqffAIO
	vGd+j1yFYKhJ4dE/5syg9pOqFMH5pJie7cQ22Rj9sjy6GB6msVjEw6sR3GD+mUFuagX4T8yBrTyzv
	6+TUuJyzwtGWymIqsDUBx3p2CjC2QTTi3JvE/76vgYUTxyE+kIZe34ZYRyakfZbqsiB93V4dhkp80
	uOad1FEQ==;
Received: from ip6-localhost ([::1]:28340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uM6e3-006RP4-C5; Mon, 02 Jun 2025 15:00:11 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:50843) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uM6dv-006ROu-J8
 for samba-technical@lists.samba.org; Mon, 02 Jun 2025 15:00:05 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3AC32127362
 for <samba-technical@lists.samba.org>; Mon, 02 Jun 2025 17:44:30 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2C4CF21D3EB
 for <samba-technical@lists.samba.org>; Mon,  2 Jun 2025 17:44:37 +0300 (MSK)
Message-ID: <a049e002-cfa4-4c25-9575-3bec7dac765c@tls.msk.ru>
Date: Mon, 2 Jun 2025 17:44:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: samba-technical@lists.samba.org
Subject: bind9 version 20 support?
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

Hi!

It looks like samba 4.22 does not have support for named
(bind9) versions 19 and 20.  In particular, version 20 is
shipped with to-become-stable debian "trixie" release, and
it looks like samba wont work with bind9 there.

Adding support for these seems to be simple, but maybe
someone already did it?

Thanks,

/mjt

