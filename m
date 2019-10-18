Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FFDDC20B
	for <lists+samba-technical@lfdr.de>; Fri, 18 Oct 2019 12:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=MHT9lmeT4wWGbE9ODoOUVXmkUmGMq5xeyj4k9WosNGw=; b=mhs8//hZ97n6xTwwlsGkfcRzYE
	UrMjp7wi7Xss1NZV74zL3TGcnKM60x69GU8ftKbi5i5kz57Cj8ig4aE5h6ea1EozHgDO7SwWcbe5K
	lla6AYdlB0riQUEdEfLK33ooKOOzj42yFXptDEMIGIbdPmK3TkP1cPaiwswx/kxMgRxjaQwpnoA+Q
	865wOMBNO8ld4IxUoEPaxh+WxzhX3N4kVjhboBUCOh1hqQwYiKUcyNg2kbUdsD90HfANxTR/8Jfxw
	slUA5dOrekXP9ShBYS+CjEQCsBj4NSszCJkMOdUzMAkTg7PlrQbGNAk2wbpiMT4Q9T5aEYIEfp7Ab
	yJG1mEWQ==;
Received: from localhost ([::1]:40498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLP7y-000Fkd-9j; Fri, 18 Oct 2019 10:04:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64382) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLP7u-000FkV-9Z
 for samba-technical@lists.samba.org; Fri, 18 Oct 2019 10:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=MHT9lmeT4wWGbE9ODoOUVXmkUmGMq5xeyj4k9WosNGw=; b=lKJSV+4xI9BWcjT9qSGrM8XI8V
 xnijZkXMwVUYG7y7GcaH5BH9NuRQzmiUZ3aGmHkJjQaY+OMy3OTc4iQYfuxCNIkhe6KiJeTU69JB5
 /ubFPk7XlmX3bO7Diqw+kmK40ch5VZ+NTH4o3P4Qa0OnnEv9/+03S3wRZ19C5mMI1+JnqXdSsewov
 z0wTqntIjVHrb8aevC0d9RtxDQq7Vop4GVwXy5KsZr6rRovdZaFDzAyKNppC32/yhsaXhxlyTzDXQ
 mmof7TdwiwGG61uO/SNhG+OA5j19O34mQHen5UnWPBKAgAr079P6ZTZ5nJxIbhkrt3PYm81QgKPnv
 phrfOVRLuIwXzIVI10B5Pzb1NWxG92o+zDslcIw7lIuJSJFXyyakjd4ajNJVmota3kdd5KVaEjk0B
 F+R3NebIg0TThrpiXCYjeNcODcRpe/icuORuN32I+yOEdCGTvr8t68PdAfrF+dkRTRdz5xlF11Vvs
 ifOoi85ZQvGY+l3fkOTISccF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLP7u-0003dj-2l
 for samba-technical@lists.samba.org; Fri, 18 Oct 2019 10:04:54 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] Samba 4.11.2
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
Date: Fri, 18 Oct 2019 12:04:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
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

Samba 4.11.2 is scheduled for Thursday, December 5.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

