Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6674A65B7
	for <lists+samba-technical@lfdr.de>; Tue,  1 Feb 2022 21:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xMQ5qDN8hCi1hWD1xbcMgQZS6lZtCJ62MHsZFjUsqx8=; b=s+Jsduhyc4c4rkHasncRMUNZzv
	+KvZN4MlFDUcoTluduCcySfR8DqlK1DO5iDXxeMOC1gSR9d0umbqRPoUY4E9A48qDObjFnT8HY3c0
	JIZ0C7bHIZROHorUM0ywZ0Wb7O9S20wKfxw3F3gQoZGgi3f301RfYtNFFrVm39BUeHHe2Rncwiwce
	bnvGXbw3XYinyT81fVoLGHRanWnRnS2mPzmM8s0LPXV+kQXM7Ft/Jrk90YBtR/ukbTvnfDHgcxynv
	NQdjQRgaXKSDTZ5J/Ch6vdXW60qJlcP9xGDnG5gPjCBGY9BCKyb2oQg1GL+S65WaMQ81ozgvoCQDO
	RfjszGgg==;
Received: from ip6-localhost ([::1]:60846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nEzpA-004oDK-FE; Tue, 01 Feb 2022 20:32:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48644) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nEzp0-004oCm-TR; Tue, 01 Feb 2022 20:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=xMQ5qDN8hCi1hWD1xbcMgQZS6lZtCJ62MHsZFjUsqx8=; b=npYcZP8Ct0SMQ/AkC6tccW5qN8
 EJpdSbG3rgBafgBtqBdWBTSDQoNbLO8/jdlrjVyiSEMqHCA4lOKfJMOLFsMOm1VZdSWseiwd/gyoB
 5lKOlw1dUmC8z+p0kp8r2SsadH57a00vgZhdWnXG9NCmzzMgEiDziNK0RriCnHd8NCqOXD7iRGebj
 52AmTk7F2hbOEKZU//UlTOUDsuZQ62lA3PAf0DcEa0UqDQ3Nz0qRvUkkgTyxbHOVwXNyhs5F/2CkY
 IfJaFz/oLe/+lQzyTbZ1pl5awKWG/g/0JjVc+JqLxqdg1kOOUaa2l97O21rBGJ2lqfGzdWQkRarwo
 M3J/JgG2E1YE442x5s9yzKJjLUcKWxwvqlpc1tRLYJhmT9EyaOiuyihz9svDm7geddQebaSN0G3li
 /kmkFp71JvDjLAGVCZxObRjNgV6V6vWANOjbdqC0X0tjcmaWW2R0usG6RfZV+bJRV87jAjZ98EkSE
 9r4sMTvOWJCAzfHv9dg8ao2F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nEzoz-001jLC-OY; Tue, 01 Feb 2022 20:32:14 +0000
Date: Tue, 1 Feb 2022 12:32:09 -0800
To: samba@lists.samba.org
Subject: SONOS finally adds support for SMB2/3
Message-ID: <YfmYyVJIwDOzagUb@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release notes for their update are here:

https://support.sonos.com/s/article/3521?language=en_US

I have a lot of SONOS kit so this is good
news (finally :-). Now, of course this is
only for SONOSv2 devices, not V1, but that's
understandable given the hardware restrictions
on the units.

The last real user of SMB1 is dead ! We can
get on with removing it from Samba :-).

Cheers,

Jeremy Allison,
Samba Team.

